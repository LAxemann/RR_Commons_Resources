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
			tooltip = "Sollen Funkger�te auch an Zivilisten vergeben werden?";
			expression = "RR_commons_acre_autoRadios_includeCivilians = _value";
			control = "Checkbox";
			defaultValue = true;
			typeName = "BOOL";
		};
		class RR_commons_feature_acre_autoRadios_148ForGroupLeaders {
			property = "RR_commons_feature_acre_autoRadios_148ForGroupLeaders_property";
			displayName = "AN/PRC-148 für Gruppenführer?";
			tooltip = "Soll ein AN/PRC-148 automatisch an Gruppenführer vergeben werden?";
			expression = "RR_commons_acre_autoRadios_148ForGroupLeaders = _value";
			control = "Checkbox";
			defaultValue = true;
			typeName = "BOOL";
		};
		class RR_commons_feature_acre_autoRadios_117ForAboveLieutenant {
			property = "RR_commons_feature_acre_autoRadios_117ForAboveLieutenant_property";
			displayName = "AN/PRC-117F für Ränge ab Lieutenant?";
			tooltip = "Soll ein AN/PRC-117F automatisch an Spieler ab dem Rang 'Lieutenant' vergeben werden?";
			expression = "RR_commons_acre_autoRadios_117ForAboveLieutenant = _value";
			control = "Checkbox";
			defaultValue = true;
			typeName = "BOOL";
		};
		class RR_commons_feature_acre_autoRadios_unitsWith148 {
			property = "RR_commons_feature_acre_autoRadios_unitsWith148_property";
			displayName = "Liste der Einheiten mit einem AN/PRC-148";
			tooltip = "Alle Einheiten in dieser Liste erhalten ein AN/PRC-148. Mit Kommata trennen.";
			expression = "RR_commons_acre_autoRadios_unitsWith148 = _value";
			control = "EditArray";
			defaultValue = [];
		};
		class RR_commons_feature_acre_autoRadios_unitsWith117 {
			property = "RR_commons_feature_acre_autoRadios_unitsWith117_property";
			displayName = "Liste der Einheiten mit einem AN/PRC-117F";
			tooltip = "Alle Einheiten in dieser Liste erhalten ein AN/PRC-117F. Mit Kommata trennen.";
			expression = "RR_commons_acre_autoRadios_unitsWith117 = _value";
			control = "EditArray";
			defaultValue = [];
		};
	};
};
