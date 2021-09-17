Tooltip = class(Turbine.UI.Window);

function Tooltip:Constructor()
	local xSize = 400;
	local ySize = 36;
	local cornerSize = 18;
	local sidebarSize = 3;
	local backgroundColor = Turbine.UI.Color(0.9, 0, 0, 0);
	local textColor = Turbine.UI.Color(0.82, 0.74, 0.55);
	Turbine.UI.Window.Constructor(self);
	self:SetMouseVisible(false);
	self:SetSize(xSize, ySize);
	self:SetZOrder(999);
	self:SetBackColor(backgroundColor);
	self.label = Turbine.UI.Label();
	self.label:SetParent(self);
	self.label:SetPosition(6, 1);
	self.label:SetSize(self:GetWidth() - 8,self:GetHeight());
	self.label:SetFontStyle(Turbine.UI.FontStyle.Outline);
    self.label:SetFont(Turbine.UI.Lotro.Font.TrajanPro15);
	self.label:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleLeft);
	self.label:SetForeColor(textColor);
	self.topLeft = Turbine.UI.Control();
	self.topLeft:SetParent(self);
	self.topLeft:SetSize(cornerSize, cornerSize);
	self.topLeft:SetPosition(0, 0);
    self.topLeft:SetMouseVisible(false);
    self.topLeft:SetBlendMode(Turbine.UI.BlendMode.AlphaBlend);
	self.topLeft:SetBackground("TeamOrganizer/Images/TooltipBorders/top_left.tga");
    self.topRight = Turbine.UI.Control();
	self.topRight:SetParent(self);
	self.topRight:SetSize(cornerSize, cornerSize);
	self.topRight:SetPosition(xSize - cornerSize, 0);
    self.topRight:SetMouseVisible(false);
    self.topRight:SetBlendMode(Turbine.UI.BlendMode.AlphaBlend);
	self.topRight:SetBackground("TeamOrganizer/Images/TooltipBorders/top_right.tga");
    self.bottomLeft = Turbine.UI.Control();
	self.bottomLeft:SetParent(self);
	self.bottomLeft:SetSize(cornerSize, cornerSize);
	self.bottomLeft:SetPosition(0, ySize - cornerSize);
    self.bottomLeft:SetMouseVisible(false);
    self.bottomLeft:SetBlendMode(Turbine.UI.BlendMode.AlphaBlend);
	self.bottomLeft:SetBackground("TeamOrganizer/Images/TooltipBorders/bottom_left.tga");
    self.bottomRight = Turbine.UI.Control();
	self.bottomRight:SetParent(self);
	self.bottomRight:SetSize(cornerSize, cornerSize);
	self.bottomRight:SetPosition(xSize - cornerSize, ySize - cornerSize);
    self.bottomRight:SetMouseVisible(false);
    self.bottomRight:SetBlendMode(Turbine.UI.BlendMode.AlphaBlend);
	self.bottomRight:SetBackground("TeamOrganizer/Images/TooltipBorders/bottom_right.tga");
	self.top = Turbine.UI.Control();
    self.top:SetParent(self);
	self.top:SetSize(xSize - 2*cornerSize, sidebarSize);
	self.top:SetPosition(cornerSize, 0);
    self.top:SetMouseVisible(false);
    self.top:SetBlendMode(Turbine.UI.BlendMode.AlphaBlend);
	self.top:SetBackground("TeamOrganizer/Images/TooltipBorders/top.tga");
	self.bottom = Turbine.UI.Control();
	self.bottom:SetParent(self);
	self.bottom:SetSize(xSize - 2*cornerSize, sidebarSize);
	self.bottom:SetPosition(cornerSize, ySize - sidebarSize + 1);
    self.bottom:SetMouseVisible(false);
    self.bottom:SetBlendMode(Turbine.UI.BlendMode.AlphaBlend);
	self.bottom:SetBackground("TeamOrganizer/Images/TooltipBorders/bottom.tga");
    self.left = Turbine.UI.Control();
    self.left:SetParent(self);
	self.left:SetSize(sidebarSize, ySize - 2*cornerSize);
	self.left:SetPosition(0, cornerSize);
    self.left:SetMouseVisible(false);
    self.left:SetBlendMode(Turbine.UI.BlendMode.AlphaBlend);
	self.left:SetBackground("TeamOrganizer/Images/TooltipBorders/left.tga");
	self.right = Turbine.UI.Control();
    self.right:SetParent(self);
	self.right:SetSize(sidebarSize, ySize - 2*cornerSize);
	self.right:SetPosition(xSize - sidebarSize + 1, cornerSize);
    self.right:SetMouseVisible(false);
    self.right:SetBlendMode(Turbine.UI.BlendMode.AlphaBlend);
	self.right:SetBackground("TeamOrganizer/Images/TooltipBorders/right.tga");
	self.label:SetMultiline(true);
	self.Show = function(x, y, text)
		self:SetPosition(x, y);
		self.label:SetText(text);
		self:SetVisible(true);
		self:Activate();
	end
	self.Hide = function()
		self:SetVisible(false);
	end
end	

-- Static functions to handle tooltip --
function TooltipShow(text)
	TeamOrganizer.Utility.Tooltip.Show(Turbine.UI.Display:GetMouseX() + 20, Turbine.UI.Display:GetMouseY() + 10, text);
end

function TooltipHide()
	TeamOrganizer.Utility.Tooltip.Hide();
end

function TooltipAttach(c, text)
	c.MouseEnter = function()
		TooltipShow(text);
	end
	c.MouseLeave = function()
		TooltipHide();
	end
end

if (not TeamOrganizer.Utility) then TeamOrganizer.Utility = {}; end
TeamOrganizer.Utility.Tooltip = Tooltip();