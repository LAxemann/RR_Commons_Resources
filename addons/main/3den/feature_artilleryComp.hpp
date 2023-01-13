class RR_commons_artilleryComp {
	displayName = "Artilleriecomputer";
	collapsed = 1;
	class Attributes {
		class RR_commons_artilleryComp {
			property = "RR_commons_artilleryComp_property";
			displayName = "Aktiviert?";
			tooltip = "Aktiviert oder deaktiviert den Mapclick-Artilleriecomputer";
			control = "CheckboxState";
			expression = "RR_commons_artilleryComp = _value";
			defaultValue = false;
			typeName = "BOOL";
		};
	};
};