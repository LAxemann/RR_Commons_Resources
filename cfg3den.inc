#define RR_COMMONS_CONFIGNAME "RR_commons_config"
class Cfg3DEN {
    class Mission {
        class RR_commons_config {
			displayName = "RR Commons Missionsbauerframework";
            class AttributeCategories {			
				#include "3den\feature_teleport.inc"
				#include "3den\feature_dynamicViewDistance.inc"
				#include "3den\feature_initBlackScreen.inc"
				#include "3den\feature_acre_autoRadios.inc"
				#include "3den\feature_acre_babel.inc"
				#include "3den\feature_artilleryComp.inc"
				#include "3den\feature_zoneRestriction.inc"
				#include "3den\feature_habo.inc"
				#include "3den\feature_persistence.inc"
			};
		};
	};
};


class ctrlMenuStrip;
class display3DEN {
	class Controls {
		class MenuStrip: ctrlMenuStrip {
			class Items {
				class Attributes {
					items[] += {"RR_commons_config"};
				};
				class RR_commons_config {
					text = "RR Commons Konfiguration";
					action = "edit3DENMissionAttributes 'RR_commons_config';";
				};
			};
		};
	};
};