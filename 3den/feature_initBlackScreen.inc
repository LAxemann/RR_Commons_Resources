class RR_commons_initBlackScreen {
	displayName = "Initialisierungsbildschirm";
	collapsed = 1;
	class Attributes {
		class RR_commons_initBlackScreen_editorText {
			property = "RR_commons_initBlackScreen_editorText_Property";
			description = "Durch das Aktivieren sehen die Spieler zu Missionsbeginn einen schwarzen Bildschirm und k√∂nnen sich nicht bewegen. In dieser Zeit kann sich ArmA in Ruhe initialisieren.";
			control = "StructuredText2";
		};
		class RR_commons_initBlackScreen {
			property = "RR_commons_initBlackScreen_property";
			displayName = "Aktiviert?";
			tooltip = "Aktiviert oder deaktiviert den Initialisierungsbildschirm";
			control = "CheckboxState";
			expression = "RR_commons_initBlackScreen = _value";
			defaultValue = false;
			typeName = "BOOL";
		};
		class RR_commons_initBlackScreen_time {
			property = "RR_commons_initBlackScreen_time_property";
			displayName = "Initialisierungszeit (s)";
			tooltip = "Wie lange soll der schwarze Bildschirm anhalten?";
			control = "Edit";
			expression = "RR_commons_initBlackScreen_time = _value";
			defaultValue = "12";
			typeName = "NUMBER";
		};
		class RR_commons_initBlackScreen_text {
			property = "RR_commons_initBlackScreen_text_property";
			displayName = "Angezeigter Text";
			tooltip = "Welcher Text soll im Initialisierungsbildschirm angezeigt werden?";
			control = "Edit";
			expression = "RR_commons_initBlackScreen_text = _value";
			defaultValue = "'Mission wird initialisiert.'";
			typeName = "STRING";
		};			
		class RR_commons_initBlackScreen_allowForJIP {
			property = "RR_commons_initBlackScreen_allowForJIP_property";
			displayName = "Aktiviert f√ºr JIPler?";
			tooltip = "Bei Aktivierung bekommen auch sp‰ter dazustoﬂende Spieler den Initialisierungsbildschirm angezeigt";
			control = "Checkbox";
			expression = "RR_commons_initBlackScreen_allowForJIP = _value";
			defaultValue = true;
			typeName = "BOOL";
		};
		class RR_commons_initBlackScreen_allowForSP {
			property = "RR_commons_initBlackScreen_allowForSP_property";
			displayName = "Aktiviert im Editor?";
			tooltip = "Bei Aktivierung wird der Bildschirm auch im Editor w‰hrend 'Im Einzel-/Mehrspieler spielen' angezeigt";
			control = "Checkbox";
			expression = "RR_commons_initBlackScreen_allowForSP = _value";
			defaultValue = false;
			typeName = "BOOL";
		};
	};
};
