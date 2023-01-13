class RR_commons_feature_acre_autoRadios {
	displayName = "ACRE: Automatische Vergabe von Funkgeräten";
	collapsed = 1;
	class Attributes {
		class RR_commons_feature_acre_autoRadios {
			property = "RR_commons_feature_acre_autoRadios_property";
			displayName = "Aktiviert?";
			tooltip = "Aktiviert oder deaktiviert die automatische Vergabe von ACRE-Funkgeräten an Einheiten";
			control = "CheckboxState";
			expression = "RR_commons_acre_autoRadios = _value";
			defaultValue = false;
			typeName = "BOOL";
		};
		class RR_commons_feature_acre_autoRadios_includeCivilians {
			property = "RR_commons_feature_acre_autoRadios_includeCivilians_property";
			displayName = "Auto-Vergabe auch an Zivilisten?";
			tooltip = "Soll ein 148er automatisch an Gruppenführer vergeben werden?";
			expression = "RR_commons_acre_autoRadios_includeCivilians = _value";
			control = "Checkbox";
			defaultValue = true;
			typeName = "BOOL";
		};
		class RR_commons_feature_acre_autoRadios_148ForGroupLeaders {
			property = "RR_commons_feature_acre_autoRadios_148ForGroupLeaders_property";
			displayName = "148 für Gruppenführer?";
			tooltip = "Soll ein 148er automatisch an Gruppenführer vergeben werden?";
			expression = "RR_commons_acre_autoRadios_148ForGroupLeaders = _value";
			control = "Checkbox";
			defaultValue = true;
			typeName = "BOOL";
		};
		class RR_commons_feature_acre_autoRadios_117ForAboveLieutenant {
			property = "RR_commons_feature_acre_autoRadios_117ForAboveLieutenant_property";
			displayName = "117 für Ränge ab Lieutenant?";
			tooltip = "Soll ein 117er automatisch an Spieler ab dem Rang 'Lieutenant' vergeben werden?";
			expression = "RR_commons_acre_autoRadios_117ForAboveLieutenant = _value";
			control = "Checkbox";
			defaultValue = true;
			typeName = "BOOL";
		};
		class RR_commons_feature_acre_autoRadios_unitsWith148 {
			property = "RR_commons_feature_acre_autoRadios_unitsWith148_property";
			displayName = "Einheiten mit 148er";
			tooltip = "Alle Einheiten in der Liste erhalten ein 148er. Mit Kommas trennen.";
			expression = "RR_commons_acre_autoRadios_unitsWith148 = _value";
			control = "EditArray";
			defaultValue = [];
		};
		class RR_commons_feature_acre_autoRadios_unitsWith117 {
			property = "RR_commons_feature_acre_autoRadios_unitsWith117_property";
			displayName = "Einheiten mit 117er";
			tooltip = "Alle Einheiten in der Liste erhalten ein 117er. Mit Kommas trennen.";
			expression = "RR_commons_acre_autoRadios_unitsWith117 = _value";
			control = "EditArray";
			defaultValue = [];
		};
	};
};