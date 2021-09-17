-- Return translated message --
function translate(key, lang)
	-- Default language --
	if (lang == nil) then
		lang = settings["language"];
	end

	-- Check does translaton exist --
	if (translations[key] == nil) then
		return "Invalid translation key: " .. key;
	end

	-- Get Translation --
	return translations[key][lang];
end


translations = {
	pluginName = {
		english = "Team Organizer",
		german = "Teamorganisator",
		french = "Team Organizer"
	},


	-- Classes --
	beorning = {
		english = "Beorning",
		german = "Beorninger",
		french = "Beornides"
	},
	burglar = {
		english = "Burglar",
		german = "Schurke",
		french = "Cambrioleur"
	},
	captain = {
		english = "Captain",
		german = "Hauptmann",
		french = "Capitaine"
	},
	champion = {
		english = "Champion",
		german = "Waffenmeister",
		french = "Champion"
	},
	guardian = {
		english = "Guardian",
		german = "Wächter",
		french = "Gardien"
	},
	hunter = {
		english = "Hunter",
		german = "Jäger",
		french = "Chasseur"
	},
	lore_master = {
		english = "Lore-master",
		german = "Kundiger",
		french = "Maîtres du savoir"
	},
	minstrel = {
		english = "Minstrel",
		german = "Barde",
		french = "Ménestrel"
	},
	rune_keeper = {
		english = "Rune-keeper",
		german = "Runenbewahrer",
		french = "Gardien des runes"
	},
	warden = {
		english = "Warden",
		german = "Hüter",
		french = "Sentinelle"
	},


	-- Settings --
	language = {
		english = "Language",
		german = "Sprache",
		french = "La langue"
	},
	generalSettings = {
		english = "General Settings",
		german = "Allgemeine Einstellungen",
		french = "Réglages Généraux"
	},
	customization = {
		english = "Customization",
		german = "Anpassung",
		french = "Personnalisation"
	},
	enableEscape = {
		english = "Close window by pressing 'ESC'",
		german = "Fenster schließen mit 'ESC'",
		french = "Fermez la fenêtre en appuyant sur 'ESC'"
	},
	enableEscapeTooltip = {
		english = "Team Organizer window will be hidden when 'ESC' is pressed",
		german = "Teamorganisator Fenster wird versteckt wenn 'ESC'",
		french = "La fenêtre du gestionnaire de groupe sera masquée lorsque vous appuierez sur 'ESC'"
	},
	enableDisband = {
		english = "Display disband button",
		german = "Schaltfläche zum Auflösen der Anzeige",
		french = "Afficher le bouton Dissoudre"
	},
	enableDisbandTooltip = {
		english = "Disband button will be displayed in the UI",
		german = "Die Auflösen-Schaltfläche wird in der Benutzeroberfläche angezeigt",
		french = "Dissoudre bouton sera affiché dans l'interface utilisateur"
	},
	enableDismiss = {
		english = "Display dismiss player button",
		german = "Anzeige der Schaltfläche zum Entfernen des Spielers",
		french = "Afficher le bouton de rejet du lecteur"
	},
	enableDismissTooltip = {
		english = "Dismiss player button will be displayed in the UI",
		german = "Die Schaltfläche Spieler schließen wird in der Benutzeroberfläche angezeigt",
		french = "Le bouton Ignorer le joueur s'affichera dans l'interface utilisateur"
	},
	enablePromote = {
		english = "Display promote player button",
		german = "Anzeige der Schaltfläche 'Spieler fördern'",
		french = "Afficher le bouton de promotion du joueur"
	},
	enablePromoteTooltip = {
		english = "Promote player button will be displayed in the UI",
		german = "Die Schaltfläche 'Spieler hochstufen' wird in der Benutzeroberfläche angezeigt",
		french = "Le bouton de promotion du joueur sera affiché dans l'interface utilisateur"
	},
	horizontalUI = {
		english = "Horizontal UI",
		german = "Horizontales UI",
		french = "Interface horizontale"
	},
	horizontalUITooltip = {
		english = "Players are seperated into 2 columns if there are more than 12 players in your party",
		german = "Spieler werden in 2 Reihen aufgeteilt wenn mehr als 12 Spieler in der Gruppe sind",
		french = "Les joueurs sont séparés en 2 colonnes s'il y a plus de 12 joueurs dans votre groupe"
	},
	forceTop = {
		english = "Force window on top of other elements",
		german = "Fenster über andere Elemente erzwingen",
		french = "Forcer la fenêtre au-dessus des autres éléments"
	},
	forceTopTooltip = {
		english = "Team Organizer window will always be on top of other game elements.",
		german = "Das Teamorganisator Fenster befindet sich immer über anderen Spielelementen.",
		french = "La fenêtre Team Organizer sera toujours au-dessus des autres éléments du jeu."
	},
	goldTheme = {
		english = "Golden theme",
		german = "Goldenes Thema",
		french = "Thème d'or"
	},
	goldThemeTooltip = {
		english = "Disable this option to change the theme back to normal Lotro UI",
		german = "Deaktivieren Sie diese Option, um das Design wieder in die normale Lotro-Benutzeroberfläche zu ändern",
		french = "Désactivez cette option pour rétablir le thème en interface utilisateur normale de Lotro"
	},
	settingsSaved = {
		english = "Settings have been successfully saved",
		german = "Einstellungen erfolgreich gespeichert",
		french = "Les paramètres ont été enregistrés avec succès"
	},
	customizationLabelInParty = {
		english = "Players in Party",
		german = "Spieler in Gruppe",
		french = "Joueurs en groupe"
	},
	customizationLabelInPartyTooltip = {
		english = "Players who are in your group will be displayed using this color",
		german = "Spieler, die sich in Ihrer Gruppe befinden, werden in dieser Farbe angezeigt",
		french = "Les joueurs qui sont dans votre groupe sont affichés en utilisant cette couleur"
	},
	customizationLabelNotInParty = {
		english = "Players Not In Party",
		german = "Spieler nicht in Gruppe",
		french = "Joueurs non en groupe"
	},
	customizationLabelNotInPartyTooltip = {
		english = "Players who are not in your group will be displayed using this color",
		german = "Spieler, die nicht zu Ihrer Gruppe gehören, werden in dieser Farbe angezeigt",
		french = "Les joueurs qui ne font pas partie de votre groupe sont affichés en utilisant cette couleur"
	},
	customizationLabelInvited = {
		english = "Invited Players",
		german = "Eingeladene Spieler",
		french = "Joueurs invités"
	},
	customizationLabelInvitedTooltip = {
		english = "Players who have pending invitations will be displayed using this color",
		german = "Spieler mit ausstehender Einladung werden in dieser Farbe angezeigt",
		french = "Les joueurs ayant une invitation en attente sont affichés en utilisant cette couleur"
	},

	customizationLabelDeclined = {
		english = "Invitation Declined",
		german = "Einladung abgelehnt",
		french = "Invitation refusée"
	},
	customizationLabelDeclinedTooltip = {
		english = "Players who have declined your invitation will be displayed using this color",
		german = "Spieler, die Ihre Einladung abgelehnt haben, werden in dieser Farbe angezeigt",
		french = "Les joueurs qui ont refusé votre invitation seront affichés en utilisant cette couleur"
	},
	customizationLabelInAnotherGroup = {
		english = "Players In Another Party",
		german = "Spieler in einer anderen Gruppe",
		french = "Joueur dans un autre groupe"
	},
	customizationLabelInAnotherGroupTooltip = {
		english = "Players who are in another group will be displayed using this color",
		german = "Spieler, die sich in einer anderen Gruppe befinden, werden in dieser Farbe angezeigt",
		french = "Les joueurs qui sont dans un autre groupe seront affichés en utilisant cette couleur"
	},
	customizationLabelOffline = {
		english = "Players offline",
		german = "Spieler Offline",
		french = "Joueur hors ligne"
	},
	customizationLabelOfflineTooltip = {
		english = "Players who are offline will be displayed using this color",
		german = "Spieler, die offline sind, werden in dieser Farbe angezeigt",
		french = "Les joueurs qui sont hors ligne seront affichés en utilisant cette couleur"
	},

	
	-- General --
	yes = {
		english = "Yes",
		german = "Ja",
		french = "Oui"
	},
	no = {
		english = "No",
		german = "Nein",
		french = "Non"
	},
	removeAll = {
		english = "Remove All",
		german = "Alles Entfernen",
		french = "Enlever Tout"
	},
	removeAllConfirmation = {
		english = "Are you sure you want to remove every player?",
		german = "Möchten Sie wirklich alle Spieler entfernen?",
		french = "Êtes-vous sûr de vouloir supprimer chaque joueur?"
	},
	save = {
		english = "Save",
		german = "Speichern",
		french = "Sauver"
	},
	load = {
		english = "Load",
		german = "Laden",
		french = "Charge"
	},
	delete = {
		english = "Delete",
		german = "Löschen",
		french = "Effacer"
	},
	saveGroup = {
		english = "Save Group",
		german = "Gruppe Speichern",
		french = "sauver le groupe"
	},
	loadGroup = {
		english = "Load Group",
		german = "Gruppe Laden",
		french = "Groupe de Charge"
	},
	deleteGroup = {
		english = "Delete Group",
		german = "Gruppe Löschen",
		french = "Effacer Groupe"
	},
	addPlayer = {
		english = "Add Player",
		german = "Spieler Addieren",
		french = "Ajouter un Joueur"
	},
	removePlayer = {
		english = "Remove Player",
		german = "Spieler Entfernen",
		french = "Enlever le Joueur"
	},
	changePlayer = {
		english = "Change Player",
		german = "Spieler Wechseln",
		french = "Changer de Joueur"
	},
	getPlayers = {
		english = "Get Players",
		german = "Spieler bekommen",
		french = "Obtenir joueurs"
	},
	raid = {
		english = "Raid",
		german = "Schlachtzug",
		french = "Raid"
	},
	readycheck = {
		english = "Ready",
		german = "Bereit",
		french = "Prêt"
	},
	disband = {
		english = "Disband",
		german = "Auflösen",
		french = "Dissoudre"
	},
	noParty = {
		english = "No party members found!",
		german = "Keine Gruppenmitglieder gefunden!",
		french = "Aucun membre du parti trouvé!"
	},
	groupSaved = {
		english = "Saved group with name ",
		german = "Gruppe mit Namen gespeichert ",
		french = "Groupe enregistré avec nom "
	},
	nothingToSave = {
		english = "You need to have a group before you can save it!",
		german = "Sie müssen eine Gruppe haben, bevor Sie sie speichern können!",
		french = "Vous devez avoir un groupe avant de pouvoir le sauvegarder!"
	},
	invalidSaveName = {
		english = "Save failed: Invalid name (only letters and numbers are accepted)!",
		german = "Speichern fehlgeschlagen: Ungültiger Name (es werden nur Buchstaben und Zahlen akzeptiert)!",
		french = "Sauver échoué: Nom incorrect (seules les lettres et les chiffres sont acceptés)!"
	},
	saveNameTooLong = {
		english = "Save failed: name was too long (name should be 50 characters or less)!",
		german = "Speichern fehlgeschlagen: Name war zu lang (Der Name sollte maximal 50 Zeichen lang sein)",
		french = "Échec de la sauvegarde: le nom était trop long (le nom doit comporter 50 caractères ou moins)"
	},
	groupSaveFailedError = {
		english = "Failed to save group!",
		german = "Speichern der Gruppe fehlgeschlagen!",
		french = "Échec de la sauvegarde du groupe!"
	},
	unknownError = {
		english = "Unknown Error!",
		german = "Unbekannter Fehler!",
		french = "Erreur Inconnue!"
	},
	groupLoaded = {
		english = "Loaded group with name ",
		german = "Geladene Gruppe mit Namen ",
		french = "Groupe chargé avec nom "
	},
	groupLoadFailed = {
		english = "Failed to load group, unknown group name: ",
		german = "Fehler beim Laden der Gruppe, unbekannter Gruppenname: ",
		french = "Échec du chargement du groupe, nom de groupe inconnu: "
	},
	groupLoadFailedError = {
		english = "Failed to load group!",
		german = "Fehler beim Laden der Gruppe!",
		french = "Impossible de charger le groupe!"
	},
	invalidLoadName = {
		english = "Load failed: Invalid load name!",
		german = "Laden fehlgeschlagen: Ungültiger Ladungsname!",
		french = "Echec du chargement: Nom de chargement invalide!"
	},
	invalidClass = {
		english = " is an invalid class!",
		german = " ist eine ungültige Klasse!",
		french = " est une classe invalide!"
	},
	missingClass = {
		english = "No class specified for ",
		german = "Keine Klasse angegeben für ",
		french = "Aucune classe spécifiée pour "
	},
	playerAlreadyInGroupSetup = {
		english = " is already in your group setup!",
		german = " befindet sich bereits in Ihrer Gruppeneinrichtung!",
		french = " est déjà dans votre groupe!"
	},
	addCommandUsage = {
		english = " Usage: /team add <name> <class>",
		german = " Usage: /team add <name> <class>",
		french = " Usage: /team add <name> <class>"
	},
	playerNotInGroup = {
		english = " is not in your group!",
		german = " ist nicht in deiner Gruppe!",
		french = " n'est pas dans votre groupe!"
	},
	loaded = {
		english = "Activated version",
		german = "Aktivierte Version",
		french = "Version activée"
	},
	unloaded = {
		english = "Unactivated",
		german = "Nicht aktiviert",
		french = "Non activé"
	},
	credits = {
		english = "by Henna",
		german = "von Henna",
		french = "par le Henna"
	},
	username = {
		english = "Username",
		german = "Nutzername",
		french = "d'utilisateur"
	},
	default = {
		english = "Default",
		german = "Standard",
		french = "défaut"
	},
	revert = {
		english = "Revert",
		german = "Umkehren",
		french = "Revenir"
	},
	edit = {
		english = "Edit",
		german = "Ändern",
		french = "Modifier"
	},
	name = {
		english = "Name",
		german = "Name",
		french = "Nom"
	},
	nothingToDelete = {
		english = "Nothing to delete!",
		german = "Nichts zu löschen!",
		french = "Rien à supprimer!"
	},
	nothingToRemove = {
		english = "Nothing to remove!",
		german = "Nichts zu entfernen!",
		french = "Rien à enlever!"
	},
	nothingToChange = {
		english = "Nothing to change!",
		german = "nichts zu ändern!",
		french = "Rien à changer!"
	},
	deletedGroup = {
		english = "Deleted group ",
		german = "Gelöschte Gruppe ",
		french = "Groupe supprimé "
	},
	nameTooShort = {
		english = "Name too short!",
		german = "Name zu kurz!",
		french = "Nom trop court!"
	},
	nameTooLong = {
		english = "Name too long!",
		german = "Name zu lang!",
		french = "Nom trop long!"
	},
	addPlayerFailed = {
		english = "Failed to add player!",
		german = "Fehler beim Hinzufügen des Players!",
		french = "Impossible d'ajouter le joueur!"
	},
	groupFullError = {
		english = "Group is full, can not add more players!",
		german = "Gruppe ist voll, kann nicht mehr Spieler hinzufügen!",
		french = "Le groupe est complet, impossible d'ajouter plus de joueurs!"
	},
	change = {
		english = "Change",
		german = "Ändern Sie",
		french = "changer"
	},
	to = {
		english = "To",
		german = "In",
		french = "En"
	},



	-- Commands --
	command_toggle = {
		english = "toggle",
		german = "toggle",
		french = "toggle"
	},
	command_show = {
		english = "show",
		german = "show",
		french = "show"
	},
	command_hide = {
		english = "hide",
		german = "hide",
		french = "hide"
	},
	command_save = {
		english = "save ",
		german = "save ",
		french = "save "
	},
	command_load = {
		english = "load ",
		german = "load ",
		french = "load "
	},
	command_add = {
		english = "add ",
		german = "add ",
		french = "add "
	},
	command_change = {
		english = "change ",
		german = "change ",
		french = "change "
	},
	command_remove = {
		english = "remove ",
		german = "remove ",
		french = "remove "
	},
	command_clear = {
		english = "clear",
		german = "clear",
		french = "clear"
	},
	command_help = {
		english = "help",
		german = "hilfe",
		french = "aide"
	},
	command_arguments = {
		english = "List of all commands:\n/team toggle or /team - Toggles the plugin's visibility.\n/team show - Makes the plugin window visible.\n/team hide - Makes the plugin window hidden.\n/team save [name] - Save current group.\n/team load [name] - Load group with given name.\n/team add [name] [class] - Add player to your team setup.\n/team change [player] to [name] [class] - Modify player in your team setup.\n/team remove [name] - Remove player from your team setup.\n/team clear - Remove all players from team setup.",
		german = "Liste aller Befehle:\n/team toggle or /team - Schaltet die Sichtbarkeit des Plugins um.\n/team show - Macht das Plugin-Fenster sichtbar.\n/team hide - Schließt das Plugin-Fenster aus.\n/team save [name] - Aktuelle Gruppe speichern.\n/team load [name] - Gruppe mit Vornamen laden.\n/team add [name] [class] - Fügen Sie Ihrem Team-Setup einen Spieler hinzu.\n/team change [player] to [name] [class] - Ändern Sie den Spieler in Ihrem Team-Setup.\n/team remove [name] - Entfernen Sie den Spieler aus Ihrem Team-Setup.\n/team clear - Entfernen Sie alle Spieler aus dem Team-Setup.",
		french = "Liste de toutes les commandes:\n/team toggle or /team - Bascule la visibilité du plugin./team show - Rend la fenêtre du plugin visible./team hide - Rend la fenêtre du plugin cachée./team save [name] - Enregistrer le groupe actuel./team load [name] - Charger le groupe avec un prénom./team add [name] [class] - Ajoutez un joueur à la configuration de votre équipe./team change [player] to [name] [class] - Modifiez le joueur dans la configuration de votre équipe./team remove [name] - Supprimez le joueur de la configuration de votre équipe./team clear - Supprimez tous les joueurs de la configuration de l'équipe."
	},
	command_unknown_1 = {
		english = "Unknown command argument, use '/team ",
		german = "Unbekanntes Befehlsargument. Verwenden Sie die '/team ",
		french = "Argument de commande inconnu, utilisez '/team "
	},
	command_unknown_2 = {
		english = "' to see list of all commands",
		german = "' um die Liste aller Befehle anzuzeigen",
		french = "' pour voir la liste de toutes les commandes"
	},


	-- Actions --
	action_invite = {
		english = "/invite ",
		german = "/einladen ",
		french = "/inviter "
	},
	action_dismiss = {
		english = "/raid dismiss ",
		german = "/schlachtzug ausschlie" .. string.char(223) .. "en ",
		french = "/raid renvoyer "
	},
	action_promote = {
		english = "/raid promote ",
		german = "/schlachtzug bef" .. string.char(246) .. "rdern ",
		french = "/raid promouvoir "
	},
	action_demote = {
		english = "/raid demote ",
		german = "/schlachtzug degradieren ",
		french = "/raid r" .. string.char(233) .. "trograder "
	},
	action_raidCreate = {
		english = "/Raid create",
		german = "/schlachtzug erstellen",
		french = "/raid cr" .. string.char(233) .. "er"
	},
	action_raidDisband = {
		english = "/Raid disband",
		german = "/schlachtzug aufl" .. string.char(246) .. "sen",
		french = "/raid dissoudre"
	},
	action_readycheck = {
		english = "/readycheck",
		german = "/bereitschaftspr" .. string.char(252) .. "fung",
		french = "/voirpr" .. string.char(234) .. "t"
	},

	
	-- Chat triggers --
	invited = {
		english = "Attempting to invite (%S+) into .+",
		german = "Versuch, (%S+) in Gefährtengruppe einzuladen",
		french = "Tentative d'invitation de (%S+) au sein de la communauté"
	},
	hasJoined = {
		english = "(%S+) has joined your .+",
		german = "(%S+) hat sich .+",
		french = "(%S+) a rejoint votre .+"
	},
	declined = {
		english = "(%S+) declines to join your .+",
		german = "(%S+) lehnt es ab, sich Eurer Gruppe von Gefährten anzuschließen",
		french = "(%S+) refuse de se joindre à votre communauté"
	},
	alreadyInParty = {
		english = "Target is already in a fellowship",
		german = "Ziel gehört bereits zu einer Gefährtengruppe",
		french = "La cible appartient déjà à une communauté"
	},
	unknownCharacter = {
		english = ".+ unknown target character '(%S+)'!",
		german = ".+Einladung fehlgeschlagen: '(%S+)' unbekannt",
		french = "Echec de l'invitation de communauté : '(%S+)' est un personnage inconnu !"
	},
	hasLeft = {
		english = "(%S+) has left your .+",
		german = "(%S+) hat Eure.+",
		french = "(%S+) a quitté votre .+"
	},
	personDismissed = {
		english = "You dismiss (%S+) from the .+",
		german = "Ihr schließt (%S+) .+",
		french = "Vous renvoyez (%S+) .+"
	},
	dropped = {
		english = "You leave your .+",
		german = "Ihr verlasst",
		french = "Vous quittez votre .+"
	},
	joinedFellowship = {
		english = "You have joined a Fellowship",
		german = "Ihr habt Euch einer Gruppe von Gefährten angeschlossen",
		french = "Vous avez rejoint une communauté"
	},
	joinedRaid = {
		english = "You have joined a Raid",
		german = "Ihr habt Euch einem Schlachtzug angeschlossen",
		french = "Vous avez rejoint un raid"
	},
	dismissedFromFellowship = {
		english = "You have been dismissed from your Fellowship",
		german = "hr wurdet aus Eurer Gruppe von Gefährten ausgeschlossen",
		french = "Vous avez été renvoyée de votre communauté"
	},
	dismissedFromRaid = {
		english = "You have been dismissed from your Raid",
		german = "Ihr wurdet aus Eurem Schlachtzug ausgeschlossen",
		french = "Vous avez été renvoyée de votre raid"
	},
	fellowshipDisbanded = {
		english = "Your .+ has been disbanded",
		german = "wurde aufgelöst",
		french = "Votre communauté s'est rompue"
	},
	raidDisbanded = {
		english = "Your .+ has been disbanded",
		german = "wurde aufgelöst",
		french = "Votre raid a été dissout"
	},
};