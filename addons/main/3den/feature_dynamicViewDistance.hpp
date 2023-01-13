class RR_commons_feature_dynamicViewDistance {
	displayName = "Sichtweiten-Einstellung";
	collapsed = 1;
	class Attributes {
		class RR_commons_feature_dynamicViewDistance_Text1 {
			property = "RR_commons_feature_dynamicViewDistance_Text1_Property";
			description = "Erlaubt es den Spielern, ihre Sichtweite via Mausradmenü einzustellen. Überschreibt die Einstellungen der init.sqf. Werden keine Werte eingegeben, wird die Standardsichtweite des Servers benutzt.";
			control = "StructuredText3";
		};
		/* Generelle Sichtweite */
		class RR_commons_feature_viewDistance {
			property = "RR_commons_feature_viewDistance_property";
			displayName = "Erlaube Sichtweitenmenü?";
			tooltip = "Aktiviert oder deaktiviert das Sichtweiten-Menü";
			control = "CheckboxState";
			expression = "RR_commons_viewdistance = _value";
			defaultValue = false;
			typeName = "BOOL";
		};
		class RR_commons_feature_viewDistance_min {
			property = "RR_commons_feature_viewDistance_min_property";
			displayName = "Mindestsichtweite (m)";
			tooltip = "Mindestsichtweite im Sichtweiten-Menü";
			control = "Edit";
			expression = "RR_commons_viewDistance_min = _value";
			defaultValue = "0";
			typeName = "NUMBER";
		};
		class RR_commons_feature_viewDistance_max {
			property = "RR_commons_feature_viewDistance_max_property";
			displayName = "Maximalsichtweite (m)";
			tooltip = "Maximalsichtweite im Sichtweiten-Menü";
			control = "Edit";
			expression = "RR_commons_viewDistance_max = _value";
			defaultValue = "0";
			typeName = "NUMBER";
		};
		class RR_commons_feature_dynamicViewDistance_heightThreshold {
			property = "RR_commons_feature_dynamicViewDistance_heightThreshold_property";
			displayName = "Höhe für Sichtweitenwechsel (m)";
			tooltip = "Ab welcher Höhe switched die Sichtweite in Luftfahrzeugen automatisch?";
			expression = "RR_commons_dynamicViewdistance_heightThreshold = _value";
			control = "Edit";
			defaultValue = "20";
			typeName = "NUMBER";
		};
		class RR_commons_feature_dynamicViewDistance {
			property = "RR_commons_feature_dynamicViewDistance_property";
			displayName = "FPS-Boost in der Luft";
			tooltip = "Senkt den Geländedetailgrad, wenn man sich ab der definierten Höhe in Luftfahrzeugen befindet.";
			control = "Checkbox";
			expression = "RR_commons_dynamicViewdistance = _value";
			defaultValue = true;
			typeName = "BOOL";
		};
	};
};