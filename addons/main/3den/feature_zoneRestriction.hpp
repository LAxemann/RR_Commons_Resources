class RR_commons_zoneRestriction {
	displayName = "Spielbereich einschränken";
	collapsed = 1;
	
	class Attributes {
		
		class RR_commons_zoneRestriction_Text1 {
			property = "RR_commons_zoneRestriction_Text1_Property";
			description = "Hiermit können Trigger als Spielfeldränder definiert werden. Im invertierten Modus müssen sich die Spieler IN den definierten Triggerbereichen aufhalten.";
			control = "StructuredText2";
		};
		class RR_commons_zoneRestriction {
			property = "RR_commons_zoneRestriction_property";
			displayName = "Aktiviert?";
			tooltip = "Aktiviert oder deaktiviert die Einschränkung des Spielbereichs";
			control = "CheckboxState";
			expression = "RR_commons_zoneRestriction = _value";
			defaultValue = false;
			typeName = "BOOL";
		};
		class RR_commons_zoneRestriction_invert {
			property = "RR_commons_zoneRestriction_invert_property";
			displayName = "Invertiert?";
			tooltip = "Ist das Häkchen gesetzt, müssen sich die Spieler IN den Triggern aufhalten, nicht außerhalb.";
			control = "Checkbox";
			expression = "RR_commons_zoneRestriction_invert = _value";
			defaultValue = false;
			typeName = "BOOL";
		};
		class RR_commons_zoneRestriction_triggers {
			property = "RR_commons_zoneRestriction_triggers_Property";
			displayName = "Trigger";
			tooltip = "Hier eingetragene Trigger dienen als Spielfeldbegrenzung (Bzw Spielfeld im invertierten Modus). Trennung durch Kommata";
			expression = "RR_commons_zoneRestriction_triggers = _value";
			control = "EditArray";
			defaultValue = [];
		};
		class RR_commons_zoneRestriction_mode {
			control = "combo";
			property = "RR_commons_zoneRestriction_mode_property";
			displayName = "Modus";
			description = "Beschränkungsmodus";
			expression = "RR_commons_zoneRestriction_mode = _value";
			defaultValue = 0;
			typeName = "NUMBER";
			class Values  {
				class invWall {
					name = "Unsichtbare Wand";
					value = 0;
				};
				class deathWarning {
					name = "Tod mit Warnung";
					value = 1;
				};
				class instantDeath {
					name = "Sofortiger Tod";
					value = 2;
				};
			};
		};
		class RR_commons_zoneRestriction_excludeArray {
			property = "RR_commons_zoneRestriction_excludeArray_Property";
			displayName = "Ausnahmen";
			tooltip = "Einheiten, die von der Begrenzung nicht betroffen sein sollen. Trennung durch Kommata";
			expression = "RR_commons_zoneRestriction_excludeArray = _value";
			control = "EditArray";
			defaultValue = [];
		};
		class RR_commons_zoneRestriction_warningTime {
			property = "RR_commons_zoneRestriction_warningTime_property";
			displayName = "Zeit bis Tod (s)";
			tooltip = "Gilt nur für den Todesmodus mit Warnung";
			expression = "RR_commons_zoneRestriction_warningTime = _value";
			control = "Edit";
			defaultValue = "10";
			typeName = "NUMBER";
		};
		class RR_commons_zoneRestriction_text {
			property = "RR_commons_zoneRestriction_text_property";
			displayName = "Warnungstext";
			tooltip = "Angezeigter Text beim Verlassen des Spielbereiches";
			expression = "RR_commons_zoneRestriction_text = _value";
			control = "Edit";
			defaultValue = "'Achtung! Kehre in den Spielbereich zurück!'";
			typeName = "STRING";
		};
		class RR_commons_zoneRestriction_disableAir {
			property = "RR_commons_zoneRestriction_disableAir_property";
			displayName = "Ausnahme für Flugzeuge?";
			tooltip = "Ist das Häkchen gesetzt, werden Luftfahrzeuge von der Begrenzung ausgenommen.";
			control = "Checkbox";
			expression = "RR_commons_zoneRestriction_disableAir = _value";
			defaultValue = false;
			typeName = "BOOL";
		};
	};
};