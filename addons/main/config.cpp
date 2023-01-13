class CfgPatches {
	class ADDON {	
		author = "LAxemann";
		name = "main";
		requiredVersion = 0.1;
		requiredAddons[]= {
			"A3_Functions_F",
			"A3_Anims_F",
			"ACE_Main",
			"ACE_common",
			"CBA_MAIN",
			"CBA_Extended_EventHandlers",
			"RR_Audio"
		};
		units[] = {};
        weapons[] = {};
	};
};

#include "CfgFactionClasses.hpp"
#include "CfgMoves.hpp"
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"

#include "dialoge\dialoge.hpp"
#include "cfg3den.hpp"

/* CBA XEH */
class Extended_PreInit_EventHandlers {
    RR_resources_preInit = "call compile preprocessFileLineNumbers '\z\RR_commons\addons\main\preInit.sqf'";
};

class Extended_PostInit_EventHandlers {
	RR_resources_postInit = "call compile preProcessFileLineNumbers '\z\RR_commons\addons\main\postInit.sqf'";
};