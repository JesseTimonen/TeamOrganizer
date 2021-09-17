local classInfoTable = {};
local classTypesTable = {};

local function IsA(self, target)
	return Type.StaticIsA(self.GetType(), target);
end

function _G.static_class(...)
	local args = {...};
	local baseClass;
	local mixins = {};
	local baseObjects = 0;
	local i;
	local object;

	for i, object in pairs(args) do
		local type = Type.StaticGetType(object);
		
		if (type:IsClass()) then
			if (baseClass ~= nil) then
				error("A class can only have a single base class. More than one base class was specified.");
			end
			
			if (type:IsFinal()) then
				error("Unable to inherit from final class.");
			end
			
			baseClass = object;
			baseObjects = baseObjects + 1;
		elseif (type:IsMixin()) then
			table.insert(mixins, object);
			baseObjects = baseObjects + 1;
		else
			error("Invalid base object specified in class declaration.");
		end
	end

	local className = "";
	local environmentTable = getfenv(0);

	if ((environmentTable ~= nil) and (environmentTable._ ~= nil) and (type(environmentTable._) == "table") and (environmentTable._.Name ~= nil) and (type(environmentTable._.Name) == "string")) then
		className = getfenv(0)._.Name;
	end

	local classTypeInfo = {
		Class = true,
		Static = true,
		Base = baseClass,
		Mixins = mixins,
		FullName = className
	};
	
	local classTableMetaTable = {};


	if (baseObjects == 1) then
		classTableMetaTable.__index = baseClass or unpack(mixins); 
	elseif (baseObjects ~= 0) then
		classTableMetaTable.__index = function(table, key)
			local i;
			local mixin;
			
			if (baseClass and baseClass[key]) then
				return baseClass[key];
			end
			
			for i, mixin in pairs(mixins) do
				if (mixin[key]) then
					return mixin[key];
				end
			end
		end
	end

	local classTable = {};
	setmetatable(classTable, classTableMetaTable);
	classInfoTable[classTable] = classTypeInfo;

	if (not classTable.GetUniqueID) then
		local idTable = {};
		local weakKeysTable = {__mode = "k"};
		setmetatable(idTable, weakKeysTable);

		classTable.GetUniqueID = function(self)
			if (idTable[self] ~= nil) then
				return idTable[self];
			end

			local metatable = getmetatable(self);
			setmetatable(self, nil);
			local tostringValue = tostring(self);
			setmetatable(self, metatable);
			
			local id = string.sub(tostringValue, 8);
			idTable[self] = id;
			return id;
		end
	end
	
	if (not classTable.ToString) then
		classTable.ToString = function(self)
			local target = self;
			
			if (self == self.GetType():GetClass()) then
				self = nil;
			end
			
			local id = target:GetUniqueID();
			local className = target.GetType():GetName() or "";
			local value = "<";
			
			if (string.len(className) > 0) then
				 value =  value .. className .. " ";
			end
			
			if (self) then
				value =  value .. "Instance";
			else
				value =  value .. "Class";
			end
			
			value = value .. ": " .. id .. ">";
			
			return value;
		end		
	end

	classTableMetaTable.__tostring = function(self)
		return self:ToString();
	end

	if (not classTable.IsA) then
		classTable.IsA = IsA;
	end

	classTable.GetType = function()
		local classType = classTypesTable[classTable];

		if (classType == nil) then
			classType = Type(classTable, classTypeInfo);
			classTypesTable[classTable] = classType;
		end

		return classType;
	end

	return classTable, classTableMetaTable, classTypeInfo;
end

function _G.class(...)
	local staticClass, staticClassMetaTable, staticClassInfo = static_class(...);
	local classInstanceMetaTable = {
		__index = staticClass,
		__tostring = function(self)
			return self:ToString();
		end
	};

	staticClassInfo.Static = nil;
	staticClassMetaTable.__call = function(classTable, ...)
		local instance = {};
		setmetatable(instance, classInstanceMetaTable);
		
		if ((instance.Constructor ~= nil) and (type(instance.Constructor) == 'function')) then
			instance:Constructor(...);
		end
		
		return instance;
	end

	return staticClass, staticClassMetaTable, staticClassInfo, classInstanceMetaTable;
end

function _G.abstract_class(...)
	local staticClass, staticClassMetaTable, staticClassInfo = static_class(...);

	staticClassInfo.Static = nil;
	staticClassInfo.Abstract = true;

	staticClassMetaTable.__call = function(classTable, ...)
		error("Cannot instantiate an abstract class.");
	end

	return staticClass, staticClassMetaTable, staticClassInfo;
end

function _G.final_class(...)
	local classClass, classMetaTable, classInfo, classInstanceMetaTable = class(...);
	classInfo.Final = true;
	return classClass, classMetaTable, classInfo, classInstanceMetaTable;
end