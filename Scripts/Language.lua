-- Return translated message --
function translate(key, lang)
	-- Default language --
	if (lang == nil) then
		lang = settings["language"];
	end

	-- Check does translaton exist --
	if (translations[key] == nil) then
		notification("Invalid translation key: " .. key);
		return "";
	end

	-- Get Translation --
	return translations[key][lang];
end


translations = {

	-- Plugin --
	TEXT_PLUGIN_NAME = {
		english = "Team Organizer",
		german  = "Teamorganisator",
		french  = "Organisateur d'équipe"
	},



	-- Classes --
	TEXT_BEORNING = {
		english = "Beorning",
		german  = "Beorninger",
		french  = "Beornide"
	},
	TEXT_BURGLAR = {
		english = "Burglar",
		german  = "Schurke",
		french  = "Cambrioleur"
	},
	TEXT_CAPTAIN = {
		english = "Captain",
		german  = "Hauptmann",
		french  = "Capitaine"
	},
	TEXT_CHAMPION = {
		english = "Champion",
		german  = "Waffenmeister",
		french  = "Champion"
	},
	TEXT_BRAWLER = {
		english = "Brawler",
		german  = "Schläger",
		french  = "Bagarreur"
	},
	TEXT_GUARDIAN = {
		english = "Guardian",
		german  = "Wächter",
		french  = "Gardien"
	},
	TEXT_HUNTER = {
		english = "Hunter",
		german  = "Jäger",
		french  = "Chasseur"
	},
	TEXT_LORE_MASTER = {
		english = "Lore-master",
		german  = "Kundiger",
		french  = "Maîtres du savoir"
	},
	TEXT_MINSTREL = {
		english = "Minstrel",
		german  = "Barde",
		french  = "Ménestrel"
	},
	TEXT_RUNE_KEEPER = {
		english = "Rune-keeper",
		german  = "Runenbewahrer",
		french  = "Gardien des runes"
	},
	TEXT_WARDEN = {
		english = "Warden",
		german  = "Hüter",
		french  = "Sentinelle"
	},



	-- Settings --
	TEXT_LANGUAGE = {
		english = "Language",
		german  = "Sprache",
		french  = "Langue"
	},
	TEXT_GENERAL_SETTINGS = {
		english = "General Settings",
		german  = "Allgemeine Einstellungen",
		french  = "réglages généraux"
	},
	TEXT_CUSTOMIZATION = {
		english = "Customization",
		german  = "Anpassung",
		french  = "Personnalisation"
	},
	TEXT_ENABLE_ESCAPE = {
		english = "Close window by pressing [ESC]",
		german  = "Fenster schließen mit [ESC]",
		french  = "Fermez la fenêtre en appuyant sur [ESC]"
	},
	TEXT_ENABLE_ESCAPE_TOOLTIP = {
		english = "Team Organizer window will be hidden when [ESC] is pressed",
		german  = "Das Teamorganisator-Fenster wird ausgeblendet, wenn [ESC] gedrückt wird",
		french  = "La fenêtre de l'organisateur d'équipe sera masquée lorsque [ESC] est enfoncé"
	},
	TEXT_ENABLE_DISBAND = {
		english = "Display disband button",
		german  = "Schaltfläche zum Auflösen anzeigen",
		french  = "Afficher le bouton de suppression"
	},
	TEXT_ENABLE_DISBAND_TOOLTIP = {
		english = "Disband button will be displayed in the UI",
		german  = "Die Schaltfläche Auflösen wird in der Benutzeroberfläche angezeigt",
		french  = "Le bouton Disband s'affichera dans l'interface utilisateur"
	},
	TEXT_ENABLE_DISMISS = {
		english = "Display dismiss player button",
		german  = "Schaltfläche zum Schließen des Players anzeigen",
		french  = "Afficher le bouton de rejet du joueur"
	},
	TEXT_ENABLE_DISMISS_TOOLTIP = {
		english = "Dismiss player button will be displayed in the UI",
		german  = "Die Schaltfläche Spieler verwerfen wird in der Benutzeroberfläche angezeigt",
		french  = "Le bouton Ignorer le joueur s'affichera dans l'interface utilisateur"
	},
	TEXT_ENABLE_PROMOTE = {
		english = "Display promote player button",
		german  = "Schaltfläche zum Werben für Spieler anzeigen",
		french  = "Afficher le bouton de promotion du joueur"
	},
	TEXT_ENABLE_PROMOTE_TOOLTIP = {
		english = "Promote player button will be displayed in the UI",
		german  = "Die Schaltfläche Spieler befördern wird in der Benutzeroberfläche angezeigt",
		french  = "Le bouton Promouvoir le joueur s'affichera dans l'interface utilisateur"
	},
	TEXT_ENABLE_HORIZONTAL_UI = {
		english = "Horizontal UI with large groups",
		german  = "Horizontale Benutzeroberfläche mit großen Gruppen",
		french  = "Interface utilisateur horizontale avec de grands groupes"
	},
	TEXT_ENABLE_HORIZONTAL_UI_TOOLTIP = {
		english = "Players are seperated into 2 columns if there are more than 12 players in your party",
		german  = "Spieler werden in 2 Spalten unterteilt, wenn mehr als 12 Spieler in Ihrer Gruppe sind",
		french  = "Les joueurs sont séparés en 2 colonnes s'il y a plus de 12 joueurs dans votre groupe"
	},
	TEXT_ENABLE_FORCE_TOP = {
		english = "Force window on top of other game elements",
		german  = "Fenster über anderen Spielelementen erzwingen",
		french  = "Forcer la fenêtre au-dessus des autres éléments du jeu"
	},
	TEXT_ENABLE_FORCE_TOP_TOOLTIP = {
		english = "Team Organizer window will always be on top of other game elements",
		german  = "Das Team-Organizer-Fenster wird immer über anderen Spielelementen angezeigt",
		french  = "La fenêtre de l'organisateur d'équipe sera toujours au-dessus des autres éléments du jeu"
	},
	TEXT_ENABLE_GOLD_THEME = {
		english = "Golden theme",
		german  = "Goldenes Thema",
		french  = "Thème d'or"
	},
	TEXT_ENABLE_GOLD_THEME_TOOLTIP = {
		english = "Disable this option to change the theme back to normal Lotro UI",
		german  = "Deaktivieren Sie diese Option, um das Thema wieder auf die normale Lotro-Benutzeroberfläche zu ändern",
		french  = "Désactivez cette option pour ramener le thème à l'interface utilisateur normale de Lotro"
	},
	TEXT_SETTINGS_SAVED = {
		english = "Settings have been successfully saved!",
		german  = "Einstellungen wurden erfolgreich gespeichert!",
		french  = "Les paramètres ont été enregistrés avec succès!"
	},
	TEXT_CUSTOMIZATION_LABEL_IN_PARTY = {
		english = "Players in group",
		german  = "Spieler in der gruppe",
		french  = "Joueurs en groupe"
	},
	TEXT_CUSTOMIZATION_LABEL_IN_PARTY_TOOLTIP = {
		english = "Players who are in your group will be displayed using this color",
		german  = "Spieler, die in deiner Gruppe sind, werden in dieser Farbe angezeigt",
		french  = "Les joueurs qui sont dans votre groupe seront affichés avec cette couleur"
	},
	TEXT_CUSTOMIZATION_LABEL_NOT_IN_PARTY = {
		english = "Players Not In group",
		german  = "Spieler nicht in der Gruppe",
		french  = "Joueurs hors groupe"
	},
	TEXT_CUSTOMIZATION_LABEL_NOT_IN_PARTY_TOOLTIP = {
		english = "Players who are not in your group will be displayed using this color",
		german  = "Spieler, die nicht in deiner Gruppe sind, werden in dieser Farbe angezeigt",
		french  = "Les joueurs qui ne font pas partie de votre groupe seront affichés avec cette couleur"
	},
	TEXT_CUSTOMIZATION_LABEL_INVITED = {
		english = "Invited Players",
		german  = "Eingeladene Spieler",
		french  = "Joueurs invités"
	},
	TEXT_CUSTOMIZATION_LABEL_INVITED_TOOLTIP = {
		english = "Players who have pending invitations will be displayed using this color",
		german  = "Spieler mit ausstehenden Einladungen werden in dieser Farbe angezeigt",
		french  = "Les joueurs qui ont des invitations en attente seront affichés avec cette couleur"
	},
	TEXT_CUSTOMIZATION_LABEL_DECLINED = {
		english = "Invitation Declined",
		german  = "Einladung abgelehnt",
		french  = "Invitation refusée"
	},
	TEXT_CUSTOMIZATION_LABEL_DECLINED_TOOLTIP = {
		english = "Players who have declined your invitation will be displayed using this color",
		german  = "Spieler, die deine Einladung abgelehnt haben, werden in dieser Farbe angezeigt",
		french  = "Les joueurs qui ont décliné votre invitation seront affichés avec cette couleur"
	},
	TEXT_CUSTOMIZATION_LABEL_IN_ANOTHER_GROUP = {
		english = "Players In Another group",
		german  = "Spieler in einer anderen Gruppe",
		french  = "Joueurs d'un autre groupe"
	},
	TEXT_CUSTOMIZATION_LABEL_IN_ANOTHER_GROUP_TOOLTIP = {
		english = "Players who are already in another group will be displayed using this color",
		german  = "Spieler, die bereits in einer anderen Gruppe sind, werden in dieser Farbe angezeigt",
		french  = "Les joueurs qui sont déjà dans un autre groupe seront affichés avec cette couleur"
	},
	TEXT_CUSTOMIZATION_LABEL_OFFLINE = {
		english = "Offline players",
		german  = "Offline-Spieler",
		french  = "joueurs hors ligne"
	},
	TEXT_CUSTOMIZATION_LABEL_OFFLINE_TOOLTIP = {
		english = "Players who are offline will be displayed using this color",
		german  = "Spieler, die offline sind, werden in dieser Farbe angezeigt",
		french  = "Les joueurs hors ligne seront affichés avec cette couleur"
	},

	

	-- General --
	TEXT_YES = {
		english = "Yes",
		german  = "Ja",
		french  = "Oui"
	},
	TEXT_NO = {
		english = "No",
		german  = "Nein",
		french  = "Non"
	},
	TEXT_REMOVE_ALL = {
		english = "Remove all",
		german  = "Alles entfernen",
		french  = "Enlever tout"
	},
	TEXT_REMOVE_ALL_CONFIRMATION = {
		english = "Are you sure you want to remove every player?",
		german  = "Möchten Sie wirklich alle Spieler entfernen?",
		french  = "Êtes-vous sûr de vouloir supprimer tous les joueurs?"
	},
	TEXT_SAVE = {
		english = "Save",
		german  = "Speichern",
		french  = "sauver"
	},
	TEXT_LOAD = {
		english = "Load",
		german  = "Laden",
		french  = "Charge"
	},
	TEXT_DELETE = {
		english = "Delete",
		german  = "Löschen",
		french  = "Effacer"
	},
	TEXT_SAVE_GROUP = {
		english = "Save group",
		german  = "Gruppe speichern",
		french  = "Enregistrer le groupe"
	},
	TEXT_LOAD_GROUP = {
		english = "Load Group",
		german  = "Lastgruppe",
		french  = "Groupe de charge"
	},
	TEXT_DELETE_GROUP = {
		english = "Delete Group",
		german  = "Gruppe löschen",
		french  = "Supprimer le groupe"
	},
	TEXT_SELECT_PLAYER = {
		english = "Select player",
		german  = "Spieler auswählen",
		french  = "Sélectionner un joueur"
	},
	TEXT_SELECT_GROUP = {
		english = "Select group",
		german  = "Wähle die Gruppe",
		french  = "Sélectionner un groupe"
	},
	TEXT_ADD_PLAYER = {
		english = "Add Player",
		german  = "Spieler hinzufügen",
		french  = "Ajouter un Joueur"
	},
	TEXT_REMOVE_PLAYER = {
		english = "Remove Player",
		german  = "Spieler entfernen",
		french  = "Supprimer le joueur"
	},
	TEXT_CHANGE_PLAYER = {
		english = "Change Player",
		german  = "Ändern spieler",
		french  = "Changer de joueur"
	},
	TEXT_GET_PLAYERS = {
		english = "Get Players",
		german  = "Spieler holen",
		french  = "Obtenir des joueurs"
	},
	TEXT_RAID = {
		english = "Raid",
		german  = "Schlachtzug",
		french  = "Raid"
	},
	TEXT_READYCHECK = {
		english = "Ready",
		german  = "Bereit",
		french  = "Prêt"
	},
	TEXT_DISBAND = {
		english = "Disband",
		german  = "Auflösen",
		french  = "Dissoudre"
	},
	TEXT_NO_PARTY = {
		english = "No party members found!",
		german  = "Keine Partymitglieder gefunden!",
		french  = "Aucun membre du groupe trouvé!"
	},
	TEXT_GROUP_SAVED = {
		english = "Saved group with name: ",
		german  = "Gespeicherte Gruppe mit Namen: ",
		french  = "Groupe enregistré avec nom: "
	},
	TEXT_NOTHING_TO_SAVE = {
		english = "You need to have a group before you can save it",
		german  = "Sie müssen eine Gruppe haben, bevor Sie sie speichern können",
		french  = "Vous devez avoir un groupe avant de pouvoir l'enregistrer"
	},
	TEXT_INVALID_SAVE_NAME = {
		english = "Save failed: Invalid name (only letters and numbers are accepted)!",
		german  = "Speichern fehlgeschlagen: Ungültiger Name (nur Buchstaben und Zahlen werden akzeptiert)!",
		french  = "Échec de l'enregistrement: nom invalide (seuls les lettres et les chiffres sont acceptés)!"
	},
	TEXT_SAVE_NAME_TOO_SHORT = {
		english = "Save failed: name was too long (name should be 50 characters or less)!",
		german  = "Speichern fehlgeschlagen: Name war zu lang (der Name sollte maximal 50 Zeichen lang sein)!",
		french  = "Échec de l'enregistrement: le nom était trop long (le nom ne doit pas dépasser 50 caractères)!"
	},
	TEXT_FAILED_TO_SAVE_GROUP = {
		english = "Failed to save group!",
		german  = "Fehler beim Speichern der Gruppe!",
		french  = "Échec de l'enregistrement du groupe!"
	},
	TEXT_UNKNOWN_ERROR = {
		english = "Unknown Error!",
		german  = "Unbekannter Fehler!",
		french  = "Erreur inconnue!"
	},
	TEXT_GROUP_LOADED = {
		english = "Loaded group with name: ",
		german  = "Geladene Gruppe mit Namen: ",
		french  = "Groupe chargé avec nom: "
	},
	TEXT_FAILED_TO_LOAD_GROUP_DETAILED = {
		english = "Failed to load group, unknown group name: ",
		german  = "Fehler beim Laden der Gruppe, unbekannter Gruppenname: ",
		french  = "Échec du chargement du groupe, nom de groupe inconnu: "
	},
	TEXT_FAILED_TO_LOAD_GROUP = {
		english = "Failed to load group!",
		german  = "Fehler beim Laden der Gruppe!",
		french  = "Échec du chargement du groupe !"
	},
	TEXT_INVALID_LOAD_NAME = {
		english = "Load failed: Invalid load name!",
		german  = "Laden fehlgeschlagen: Ungültiger Ladename!",
		french  = "Échec du chargement: nom de chargement non valide!"
	},
	TEXT_INVALID_CLASS = {
		english = " is not a valid class!",
		german  = " ist keine gültige Klasse!",
		french  = " n'est pas une classe valide!"
	},
	TEXT_MISSING_CLASS = {
		english = "No class specified for user ",
		german  = "Keine Klasse für Benutzer angegeben ",
		french  = "Aucune classe spécifiée pour l'utilisateur "
	},
	TEXT_PLAYER_ALREADY_IN_GROUP_SETUP = {
		english = " is already in your group setup!",
		german  = " ist bereits in deiner Gruppeneinrichtung!",
		french  = " est déjà dans votre configuration de groupe!"
	},
	TEXT_ADD_COMMAND_MESSAGE = {
		english = " Usage: /team add <name> <class>",
		german  = " Verwendungszweck: /team add <name> <class>",
		french  = " Usage: /team add <name> <class>"
	},
	TEXT_PLAYER_NOT_IN_GROUP = {
		english = " is not in your group!",
		german  = " ist nicht in deiner Gruppe!",
		french  = " n'est pas dans votre groupe!"
	},
	TEXT_LOADED = {
		english = "Activated version",
		german  = "Aktivierte Version",
		french  = "Version activée"
	},
	TEXT_UNLOADED = {
		english = "Deactivated.",
		german  = "Deaktiviert.",
		french  = "Désactivé"
	},
	TEXT_CREDITS = {
		english = "by Henna.",
		german  = "von Henna.",
		french  = "par Henna."
	},
	TEXT_USERNAME = {
		english = "Username",
		german  = "Nutzername",
		french  = "d'utilisateur"
	},
	TEXT_DEFAULT = {
		english = "Default",
		german  = "Standard",
		french  = "défaut"
	},
	TEXT_REVERT = {
		english = "Revert",
		german  = "Zurück",
		french  = "Revenir"
	},
	TEXT_EDIT = {
		english = "Edit",
		german  = "Ändern",
		french  = "Éditer"
	},
	TEXT_NAME = {
		english = "Name",
		german  = "Name",
		french  = "Nom"
	},
	TEXT_CLASS = {
		english = "Class",
		german  = "Klasse",
		french  = "Classer"
	},
	TEXT_NOTHING_TO_DELETE = {
		english = "Nothing to delete!",
		german  = "Nichts zu löschen!",
		french  = "Rien à supprimer!"
	},
	TEXT_NOTHING_TO_REMOVE = {
		english = "Nothing to remove!",
		german  = "Nichts zu entfernen!",
		french  = "Rien à enlever!"
	},
	TEXT_NOTHING_TO_CHANGE = {
		english = "Nothing to change!",
		german  = "nichts zu ändern!",
		french  = "Rien à changer!"
	},
	TEXT_DELETED_GROUP = {
		english = "Deleted group: ",
		german  = "Gelöschte Gruppe: ",
		french  = "Groupe supprimé: "
	},
	TEXT_NAME_TOO_SHORT = {
		english = "Username was too short!",
		german  = "Benutzername war zu kurz!",
		french  = "Le nom d'utilisateur était trop court!"
	},
	TEXT_NAME_TOO_LONG = {
		english = "Name was too long!",
		german  = "Name war zu lang!",
		french  = "Le nom était trop long!"
	},
	TEXT_FAILED_TO_ADD_PLAYER = {
		english = "Failed to add player!",
		german  = "Fehler beim Hinzufügen des Spielers!",
		french  = "Échec de l'ajout du joueur!"
	},
	TEXT_GROUP_FULL_ERROR = {
		english = "Group is full, you can't add more players!",
		german  = "Gruppe ist voll, Sie können keine weiteren Spieler hinzufügen!",
		french  = "Le groupe est plein, vous ne pouvez plus ajouter de joueurs!"
	},
	TEXT_CHANGE = {
		english = "Change",
		german  = "Ändern",
		french  = "changer"
	},
	TEXT_TO = {
		english = "change to",
		german  = "ändern",
		french  = "changer pour"
	},



	-- Commands --
	TEXT_COMMAND_TOGGLE = {
		english = "toggle",
		german  = "toggle",
		french  = "toggle"
	},
	TEXT_COMMAND_SHOW = {
		english = "show",
		german  = "show",
		french  = "show"
	},
	TEXT_COMMAND_HIDE = {
		english = "hide",
		german  = "hide",
		french  = "hide"
	},
	TEXT_COMMAND_SAVE = {
		english = "save ",
		german  = "save ",
		french  = "save "
	},
	TEXT_COMMAND_LOAD = {
		english = "load ",
		german  = "load ",
		french  = "load "
	},
	TEXT_COMMAND_ADD = {
		english = "add ",
		german  = "add ",
		french  = "add "
	},
	TEXT_COMMAND_CHANGE = {
		english = "change ",
		german  = "change ",
		french  = "change "
	},
	TEXT_COMMAND_REMOVE = {
		english = "remove ",
		german  = "remove ",
		french  = "remove "
	},
	TEXT_COMMAND_CLEAR = {
		english = "clear",
		german  = "clear",
		french  = "clear"
	},
	TEXT_COMMAND_HELP = {
		english = "help",
		german  = "hilfe",
		french  = "aide"
	},
	TEXT_COMMAND_ARGUMENTS = {
		english = "List of all commands:\n/team toggle or /team - Toggles the plugin's visibility.\n/team show - Makes the plugin window visible.\n/team hide - Makes the plugin window hidden.\n/team save [name] - Save current group.\n/team load [name] - Load group with given name.\n/team add [name] [class] - Add player to your team setup.\n/team change [player] to [name] [class] - Modify player in your team setup.\n/team remove [name] - Remove player from your team setup.\n/team clear - Remove all players from team setup.",
		german  = "Liste aller Befehle:\n/team toggle or /team - Schaltet die Sichtbarkeit des Plugins um.\n/team show - Macht das Plugin-Fenster sichtbar.\n/team hide - Schließt das Plugin-Fenster aus.\n/team save [name] - Aktuelle Gruppe speichern.\n/team load [name] - Gruppe mit Vornamen laden.\n/team add [name] [class] - Fügen Sie Ihrem Team-Setup einen Spieler hinzu.\n/team change [player] to [name] [class] - Ändern Sie den Spieler in Ihrem Team-Setup.\n/team remove [name] - Entfernen Sie den Spieler aus Ihrem Team-Setup.\n/team clear - Entfernen Sie alle Spieler aus dem Team-Setup.",
		french  = "Liste de toutes les commandes:\n/team toggle or /team - Bascule la visibilité du plugin./team show - Rend la fenêtre du plugin visible./team hide - Rend la fenêtre du plugin cachée./team save [name] - Enregistrer le groupe actuel./team load [name] - Charger le groupe avec un prénom./team add [name] [class] - Ajoutez un joueur à la configuration de votre équipe./team change [player] to [name] [class] - Modifiez le joueur dans la configuration de votre équipe./team remove [name] - Supprimez le joueur de la configuration de votre équipe./team clear - Supprimez tous les joueurs de la configuration de l'équipe."
	},
	TEXT_COMMAND_UNKNOWN_1 = {
		english = "Unknown command argument, use '/team ",
		german  = "Unbekanntes Befehlsargument, verwenden Sie '/team ",
		french  = "Argument de commande inconnu, utilisez '/team "
	},
	TEXT_COMMAND_UNKNOWN_2 = {
		english = "' to see list of all commands",
		german  = "' um eine Liste aller Befehle anzuzeigen",
		french  = "' pour voir la liste de toutes les commandes"
	},


	-- Actions --
	TEXT_ACTION_INVITE = {
		english = "/invite ",
		german  = "/einladen ",
		french  = "/inviter "
	},
	TEXT_ACTION_DISMISS = {
		english = "/raid dismiss ",
		german  = "/schlachtzug ausschlie" .. string.char(223) .. "en ",
		french  = "/raid renvoyer "
	},
	TEXT_ACTION_PROMOTE = {
		english = "/raid promote ",
		german  = "/schlachtzug bef" .. string.char(246) .. "rdern ",
		french  = "/raid promouvoir "
	},
	TEXT_ACTION_DEMOTE = {
		english = "/raid demote ",
		german  = "/schlachtzug degradieren ",
		french  = "/raid r" .. string.char(233) .. "trograder "
	},
	TEXT_ACTION_CREATE_RAID = {
		english = "/Raid create",
		german  = "/schlachtzug erstellen",
		french  = "/raid cr" .. string.char(233) .. "er"
	},
	TEXT_ACTION_DISBAND_RAID = {
		english = "/Raid disband",
		german  = "/schlachtzug aufl" .. string.char(246) .. "sen",
		french  = "/raid dissoudre"
	},
	TEXT_ACTION_READYCHECK = {
		english = "/readycheck",
		german  = "/bereitschaftspr" .. string.char(252) .. "fung",
		french  = "/voirpr" .. string.char(234) .. "t"
	},



	-- Chat triggers --
	TEXT_CHAT_INVITED = {
		english = "Attempting to invite (%S+) into .+",
		german  = "Versuch, (%S+) in Gefährtengruppe einzuladen",
		french  = "Tentative d'invitation de (%S+) au sein de la communauté"
	},
	TEXT_CHAT_HAS_JOINED = {
		english = "(%S+) has joined your .+",
		german  = "(%S+) hat sich .+",
		french  = "(%S+) a rejoint votre .+"
	},
	TEXT_CHAT_DECLINED = {
		english = "(%S+) declines to join your .+",
		german  = "(%S+) lehnt es ab, sich Eurer Gruppe von Gefährten anzuschließen",
		french  = "(%S+) refuse de se joindre à votre communauté"
	},
	TEXT_CHAT_ALREADY_IN_PARTY = {
		english = "Target is already in a fellowship",
		german  = "Ziel gehört bereits zu einer Gefährtengruppe",
		french  = "La cible appartient déjà à une communauté"
	},
	TEXT_CHAT_UNKNOWN_CHARACTER = {
		english = ".+ unknown target character '(%S+)'!",
		german  = ".+Einladung fehlgeschlagen: '(%S+)' unbekannt",
		french  = "Echec de l'invitation de communauté : '(%S+)' est un personnage inconnu !"
	},
	TEXT_CHAT_HAS_LEFT = {
		english = "(%S+) has left your .+",
		german  = "(%S+) hat Eure.+",
		french  = "(%S+) a quitté votre .+"
	},
	TEXT_CHAT_HAS_BEEN_DISMISSED = {
		english = "(%S+) has been dismissed from your .+",
		german  = "(%S+) wurde aus Eur.+",
		french  = "(%S+) ne fait plus partie de votre .+"
	},
	TEXT_CHAT_PERSON_DISMISSED = {
		english = "You dismiss (%S+) from the .+",
		german  = "Ihr schließt (%S+) .+",
		french  = "Vous renvoyez (%S+) .+"
	},
	TEXT_CHAT_DROPPED = {
		english = "You leave your .+",
		german  = "Ihr verlasst",
		french  = "Vous quittez votre .+"
	},
	TEXT_CHAT_JOINED_FELLOWSHIP = {
		english = "You have joined a Fellowship",
		german  = "Ihr habt Euch einer Gruppe von Gefährten angeschlossen",
		french  = "Vous avez rejoint une communauté"
	},
	TEXT_CHAT_JOINED_RAID = {
		english = "You have joined a Raid",
		german  = "Ihr habt Euch einem Schlachtzug angeschlossen",
		french  = "Vous avez rejoint un raid"
	},
	TEXT_CHAT_DISMISSED_FROM_FELLOWSHIP = {
		english = "You have been dismissed from your Fellowship",
		german  = "hr wurdet aus Eurer Gruppe von Gefährten ausgeschlossen",
		french  = "Vous avez été renvoyé de votre communauté"
	},
	TEXT_CHAT_DISMISSED_FROM_RAID = {
		english = "You have been dismissed from your Raid",
		german  = "Ihr wurdet aus Eurem Schlachtzug ausgeschlossen",
		french  = "Vous avez été renvoyé de votre raid"
	},
	TEXT_CHAT_FELLOWSHIP_DISBANDED = {
		english = "Your .+ has been disbanded",
		german  = "wurde aufgelöst",
		french  = "Votre communauté s'est rompue"
	},
	TEXT_CHAT_RAID_DISBANDED = {
		english = "Your .+ has been disbanded",
		german  = "wurde aufgelöst",
		french  = "Votre raid a été dissout"
	},
};