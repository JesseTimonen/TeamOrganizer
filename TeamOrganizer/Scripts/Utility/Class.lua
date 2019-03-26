if (_G.class  ~= nil) then
	return;
end

_G.class = function(base)
	if (base ~= nil) then
		local baseType = type(base);

		if (baseType ~= 'table') then
			error("Base class is not a table. Base class was a " .. baseType);
		end
	end

	local c  = {};

	c.base = base;
	c.IsA = function(self, klass)
		local m = getmetatable(self);

		while m do 
			if m == klass then
				return true;
			end

			m = m.base;
		end

		return false;
	end

	local mt = {};
	mt.__index = base;

	mt.__call = function(class_tbl, ...)
		if (class_tbl.Abstract) then
			error "Abstract class cannot be constructed.";
		end

		local instance = { };
		setmetatable( instance, {__index = c});

		if ((instance.Constructor ~= nil) and (type(instance.Constructor) == 'function')) then
			instance:Constructor(...);
		end

		return instance;
	end

	setmetatable(c, mt);
	return c;
end