#define RR_COMMONS_CONFIGNAME "RR_commons_config"

class Cfg3DEN {
    class Mission {
        class RR_commons_config {
			displayName = "RR Commons Missionsbauerframework";
            class AttributeCategories {			
				#include "3den\feature_teleport.hpp"
				#include "3den\feature_dynamicViewDistance.hpp"
				#include "3den\feature_initBlackScreen.hpp"
				#include "3den\feature_acre_autoRadios.hpp"
				#include "3den\feature_acre_babel.hpp"
				#include "3den\feature_artilleryComp.hpp"
				#include "3den\feature_zoneRestriction.hpp"
				#include "3den\feature_habo.hpp"
				#include "3den\feature_persistence.hpp"
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