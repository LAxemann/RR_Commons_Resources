class RR_commons_teleport {
	displayName = "Teleporter";
	collapsed = 1;
	class Attributes {
		class RR_commons_teleport {
			property = "RR_commons_teleport_property";
			displayName = "Aktiviert?";
			tooltip = "Aktiviert oder deaktiviert die Möglichkeit, die Teleport-Funktion zu nutzen";
			control = "CheckboxState";
			expression = "RR_commons_teleport = _value";
			defaultValue = false;
			typeName = "BOOL";
		};
		class RR_commons_teleport_teleporterObjects {
			property = "RR_commons_teleport_teleporterObjects_property";
			displayName = "Teleporter-Objekte";
			tooltip = "Objekte, die den Spielern als Teleporter zur Verfügung stehen sollen. Mit Kommas trennen.";
			expression = "RR_commons_teleport_teleporterObjects = _value";
			control = "EditArray";
			defaultValue = [];
		};
		class RR_commons_teleport_allowTeleportToAI {
			property = "RR_commons_teleport_allowTeleportToAI_property";
			displayName = "Teleport zu KI möglich?";
			tooltip = "Wenn aktiviert, können sich die Spieler auch zu KI-Einheiten derselben Seite teleportieren";
			control = "Checkbox";
			expression = "RR_commons_teleport_allowTeleportToAI = _value";
			defaultValue = false;
			typeName = "BOOL";
		};
		class RR_commons_teleportJIP {
			property = "RR_commons_teleportJIP_property";
			displayName = "Teleport-Menü für JIP?";
			tooltip = "Nachjoinende Spieler bekommen für 3 Minuten die Möglichkeit, den Teleport via Mausradmenü zu nutzen";
			control = "Checkbox";
			expression = "RR_commons_teleportJIP = _value";
			defaultValue = false;
			typeName = "BOOL";
		};
	};
};