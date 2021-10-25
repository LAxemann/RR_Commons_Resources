class RR_commons_persistence {
	displayName = "Persistenz-System";
	collapsed = 1;
	class Attributes {
		class RR_commons_persistence {
			property = "RR_commons_persistence_property";
			displayName = "Aktiviert?";
			tooltip = "Aktiviert oder deaktiviert die Datenbankabfrage für das Persistenz-System";
			control = "CheckboxState";
			expression = "RR_commons_persistence = _value";
			defaultValue = false;
			typeName = "BOOL";
		};
		class RR_commons_persistence_token {
			property = "RR_commons_persistence_token_property";
			displayName = "Token";
			tooltip = "Token der Kampagne (15-Stelliger Code)";
			expression = "RR_commons_persistence_Token = _value";
			control = "Edit";
			defaultValue = "''";
			typeName = "STRING";
		};
		class RR_commons_persistence_campaignName {
			property = "RR_commons_persistence_campaignName_property";
			displayName = "Kampagnenname";
			tooltip = "Name der Kampagne (Unbedingt ändern!)";
			expression = "RR_commons_persistence_campaignName = _value";
			control = "Edit";
			defaultValue = "'MeineKampagne'";
			typeName = "STRING";
		};
		class RR_commons_persistence_baseTrigger {
			property = "RR_commons_persistence_baseTrigger_property";
			displayName = "Speichertrigger";
			tooltip = "Trigger, deren Inhalte persistent abgespeichert werden. Trennung durch Kommata.";
			expression = "RR_commons_persistence_baseTrigger = _value";
			control = "EditArray";
			defaultValue = [];
		};
		class RR_commons_persistence_customSaveFunction {
			property = "RR_commons_persistence_customSaveFunction_property";
			displayName = "Zusaetzliche Speicherfunktion";
			tooltip = "Name der Funktion, welche für das Speichern benutzt werden soll.";
			expression = "RR_commons_persistence_customSaveFunction = _value";
			control = "Edit";
			defaultValue = "''";
			typeName = "STRING";
		};
		class RR_commons_persistence_customLoadFunction {
			property = "RR_commons_persistence_customLoadFunction_property";
			displayName = "Zusaetzliche Ladefunktion";
			tooltip = "Name der Funktion, welche für das Laden benutzt werden soll.";
			expression = "RR_commons_persistence_customLoadFunction = _value";
			control = "Edit";
			defaultValue = "''";
			typeName = "STRING";
		};
		class RR_commons_persistence_disablePositionLoading {
			property = "RR_commons_persistence_disablePositionLoading_property";
			displayName = "Deaktiviere Positionloading";
			tooltip = "Deaktiviert das Laden der Spielerpositionen.";
			control = "Checkbox";
			expression = "RR_commons_persistence_disablePositionLoading = _value";
			defaultValue = false;
			typeName = "BOOL";
		};
	};
};