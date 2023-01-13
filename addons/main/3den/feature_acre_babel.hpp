class RR_commons_feature_acre_babel {
	displayName = "ACRE: Spieler sprechen unterschiedliche Sprachen";
	collapsed = 1;
	class Attributes {
		class RR_commons_feature_acre_babel_Text1 {
			property = "RR_commons_feature_acre_babel_Text1_Property";
			description = "Durch das Aktivieren erhalten alle Fraktionen ihre 'eigene Sprache' in ACRE. Spieler unterschiedlicher Fraktionen können sich dann nicht mehr verstehen.";
			control = "StructuredText2";
		};
		class RR_commons_feature_acre_babel {
			property = "RR_commons_feature_acre_babel_property";
			displayName = "Aktiviert?";
			tooltip = "Aktiviert oder deaktiviert die Vergabe unterschiedlicher Sprachen an Fraktionen";
			control = "CheckboxState";
			expression = "RR_commons_acre_babel = _value";
			defaultValue = false;
			typeName = "BOOL";
		};
		/* Sprachen */
		class RR_commons_feature_acre_babel_Text2 {
			property = "RR_commons_feature_acre_babel_Text2_Property";
			description = "Wie sollen die verwendeten Sprachen heißen?";
			control = "StructuredText1";
		};
		class RR_commons_feature_acre_babel_bluforLanguage {
			property = "RR_commons_feature_acre_babel_bluforLanguage_property";
			displayName = "Name der BLUFOR-Sprache";
			tooltip = "Wie heißt die Sprache, die BLUFOR-Einheiten sprechen?";
			//expression = "['RR_commons_acre_babel_bluforLanguage',_value] call RR_commons_core_fnc_apply3denAttribute";
			expression = "RR_commons_acre_babel_bluforLanguage = _value";
			control = "Edit";
			defaultValue = "'BLUEFOR-Sprache'";
			typeName = "STRING";
		};
		class RR_commons_feature_acre_babel_redforLanguage {
			property = "RR_commons_feature_acre_babel_redforLanguage_property";
			displayName = "Name der REDFOR-Sprache";
			tooltip = "Wie heißt die Sprache, die REDFOR-Einheiten sprechen?";
			expression = "RR_commons_acre_babel_redforLanguage = _value";
			control = "Edit";
			defaultValue = "'REDFOR-Sprache'";
			typeName = "STRING";
		};
		class RR_commons_feature_acre_babel_greenforLanguage {
			property = "RR_commons_feature_acre_babel_greenforLanguage_property";
			displayName = "Name der GREENFOR-Sprache";
			tooltip = "Wie heißt die Sprache, die GREENFOR-Einheiten sprechen?";
			expression = "RR_commons_acre_babel_greenforLanguage = _value";
			control = "Edit";
			defaultValue = "'GREENFOR-Sprache'";
			typeName = "STRING";
		};
		class RR_commons_feature_acre_babel_civilLanguage {
			property = "RR_commons_feature_acre_babel_civilLanguage_property";
			displayName = "Name der Zivil-Sprache";
			tooltip = "Wie heißt die Sprache, die Zivilisten sprechen?";
			expression = "RR_commons_acre_babel_civilLanguage = _value";
			control = "Edit";
			defaultValue = "'Zivil-Sprache'";
			typeName = "STRING";
		};
		/* Übersetzer */
		class RR_commons_feature_acre_babel_Text3 {
			property = "RR_commons_feature_acre_babel_Text3_Property";
			description = "Übersetzer: Hier können Einheiten definiert werden, die unabhängig ihrer eigenen Sprache weitere Sprachen sprechen.";
			control = "StructuredText2";
		};
		class RR_commons_feature_acre_babel_bluforLanguageTranslators {
			property = "RR_commons_feature_acre_babel_bluforLanguageTranslators_Property";
			displayName = "Übersetzer BLUFOR-Sprache";
			tooltip = "Hier eingetragene Einheiten werden in der Lage sein, die BLUFOR-Sprache zu sprechen";
			expression = "RR_commons_feature_acre_babel_bluforLanguageTranslators = _value";
			control = "EditArray";
			defaultValue = [];
		};
		class RR_commons_feature_acre_babel_redforLanguageTranslators {
			property = "RR_commons_feature_acre_babel_redforLanguageTranslators_Property";
			displayName = "Übersetzer REDFOR-Sprache";
			tooltip = "Hier eingetragene Einheiten werden in der Lage sein, die REDFOR-Sprache zu sprechen";
			expression = "RR_commons_feature_acre_babel_redforLanguageTranslators = _value";
			control = "EditArray";
			defaultValue = [];
		};
		class RR_commons_feature_acre_babel_greenforLanguageTranslators {
			property = "RR_commons_feature_acre_babel_greenforLanguageTranslators_Property";
			displayName = "Übersetzer GREENFOR-Sprache";
			tooltip = "Hier eingetragene Einheiten werden in der Lage sein, die GREENFOR-Sprache zu sprechen";
			expression = "RR_commons_feature_acre_babel_greenforLanguageTranslators = _value";
			control = "EditArray";
			defaultValue = [];
		};
		class RR_commons_feature_acre_babel_civilLanguageTranslators {
			property = "RR_commons_feature_acre_babel_civilLanguageTranslators_Property";
			displayName = "Übersetzer Zivil-Sprache";
			tooltip = "Hier eingetragene Einheiten werden in der Lage sein, die Zivil-Sprache zu sprechen";
			expression = "RR_commons_feature_acre_babel_civilLanguageTranslators = _value";
			control = "EditArray";
			defaultValue = [];
		};
	};
};