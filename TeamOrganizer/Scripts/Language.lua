-- Return translated message --
function translate(key, lang)
	return translations[key][lang];
end


translations = {
	pluginName = {
		english = "Team Organizer",
		german = "Teamorganisator",
		french = "Team Organizer"
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
	save = {
		english = "Save",
		german = "sparen",
		french = "sauver"
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
		english = "Saved group with name",
		german = "Gruppe mit Namen gespeichert",
		french = "Groupe enregistré avec nom"
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
	groupSaveFailedError = {
		english = "Failed to save group",
		german = "Speichern der Gruppe fehlgeschlagen",
		french = "Échec de la sauvegarde du groupe"
	},
	groupLoaded = {
		english = "Loaded group with name",
		german = "Geladene Gruppe mit Namen",
		french = "Groupe chargé avec nom"
	},
	groupLoadFailed = {
		english = "Failed to load group, unknown group name:",
		german = "Fehler beim Laden der Gruppe, unbekannter Gruppenname:",
		french = "Échec du chargement du groupe, nom de groupe inconnu:"
	},
	groupLoadFailedError = {
		english = "Failed to load group",
		german = "Fehler beim Laden der Gruppe",
		french = "Impossible de charger le groupe"
	},
	invalidLoadName = {
		english = "Load failed: Invalid load name!",
		german = "Laden fehlgeschlagen: Ungültiger Ladungsname!",
		french = "Echec du chargement: Nom de chargement invalide!"
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
		english = "List of all commands:\n/team toggle or /team - toggles the Team Organizer window's visibility\n/team show - shows the Team Organizer window\n/team hide - hides the Team Organizer window\n/team save <name> - saves the current group\n/team load <name> - loads a custom group\n/team clear - clears Team Organizer window",
		german = "Liste aller Befehle:\n/team toggle oder /team - schaltet die Sichtbarkeit des Teamorganisator Fenster um\n/team show - Zeigt das Teamorganisator Fenster\n/team hide - verbirgt Teamorganisator Fenster\n/team save <name> - aktuelle Gruppe speichern\n/team load <name> - benutzerdefinierte Gruppe laden\n/team clear - klar das Teamorganisator Fenster",
		french = "Liste de toutes les commandes:\n/team toggle ou /team - bascule la visibilité de la fenêtre du gestionnaire de groupe\n/team show - montre la fenêtre de Team Organizer\n/team hide - cache la fenêtre de Team Organizer\n/team save <nom> - enregistrer le groupe actuel\n/team load <nom> - charger un groupe personnalisé\n/team clear - efface la fenêtre Team Organizer"
	},
	command_unknown = {
		english = "Unknown command argument, use '/team help' to see list of all commands",
		german = "Unbekanntes Befehlsargument. Verwenden Sie die '/team hilfe' um die Liste aller Befehle anzuzeigen",
		french = "Argument de commande inconnu, utilisez '/team aide' pour voir la liste de toutes les commandes"
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
	fellowshipDisbanded = {
		english = "Your .+ has been disbanded",
		german = "wurde aufgelöst",
		french = "Votre communauté s'est rompue"
	},
	raidDisbanded = {
		english = "Your .+ has been disbanded",
		german = "wurde aufgelöst",
		french = "Votre raid a été dissout"
	}
};