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
			tooltip = "Token der Kampagne (15-Stellige Zahl)";
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
	};
};