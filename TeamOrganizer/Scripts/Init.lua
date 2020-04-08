-- Plugin's name --
pluginName = "Team Organizer";
pluginReloaderName = "Team Organizer Reloader";

-- File names --
settingsFileName = "TeamOrganizer_Main_Settings";
customizationFileName = "TeamOrganizer_Customization_Settings";
savedGroupNamesFileName = "TeamOrganizer_SavedGroups";
groupMembersFileName = "TeamOrganizer_GroupMembers";
customGroupFileName = "TeamOrganizer_CustomData_";

-- Get player name --
playerName = Turbine.Gameplay.LocalPlayer.GetInstance():GetName();

-- Get client's language --
clientLanguage = "english";
if Turbine.Shell.IsCommand("hilfe") then clientLanguage = "german"; end
if Turbine.Shell.IsCommand("aide") then clientLanguage = "french"; end

-- Default player name color codes --
defaultPlayerNameColor = {
    inParty = Turbine.UI.Color(0, 1, 0),            -- Green
    notInParty = Turbine.UI.Color(0.7, 0.7, 0.7),   -- Gray
    invited  = Turbine.UI.Color(0, 1, 1),           -- lightblue
    declined = Turbine.UI.Color(1, 0, 0),           -- red
    anotherGroup = Turbine.UI.Color(1, 0.5, 0),     -- orange
    offline = Turbine.UI.Color(0.7, 0.2, 0.7)       -- purple
};

-- Default window position --
defaultWindowPosition = {
    xPos = 0,
    yPos = 0
};

-- Default settings --
settings = {
    language = clientLanguage,
    windowPosition = defaultWindowPosition,
    enableEscape = false,
    enableDisband = false,
    enableDismiss = false,
    horizontalWindow = true,
    forceTop = false,
    goldenTheme = true,
    loadRequest = nil
};

savedGroupNames = {};
playerNameColor = defaultPlayerNameColor;

-- RGB color codes --
rgb = {
    pluginName = "<rgb=#DAA520>",
    error = "<rgb=#FF0000>",
    clear = "</rgb>"
};

-- UI color codes --
color = {
    black = Turbine.UI.Color(0, 0, 0),
    white = Turbine.UI.Color(1, 1, 1),
    golden = Turbine.UI.Color(242/255, 217/255, 140/255),
    yellow = Turbine.UI.Color(244/255, 255/255, 51/255),
    red = Turbine.UI.Color(1, 0, 0),
    darkRed = Turbine.UI.Color(0.7, 0, 0),
    green = Turbine.UI.Color(0, 1, 0),
    darkGreen = Turbine.UI.Color(0, 0.5, 0),
    blue = Turbine.UI.Color(0, 0, 1),
    darkBlue = Turbine.UI.Color(0, 0.25, 0.5)
};

-- Initializing tables --
groupMembers = {};
icons = {};
names = {};
inviteButtons = {};
dismissButtons = {};

-- Load settings --
loadSettings();