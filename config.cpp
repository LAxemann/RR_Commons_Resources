class CfgPatches {
	class RR_resources {	
		author = "LAxemann";
		requiredVersion = 0.1;
		requiredAddons[]= {
			"A3_Functions_F",
			"A3_Anims_F",
			"ACE_Main",
			"ACE_common",
			"CBA_MAIN",
			"CBA_Extended_EventHandlers"
		};
		units[] = {};
        weapons[] = {};
	};
};

#include "_cfgMoves.inc"
#include "_cfgWeapons.inc"
#include "_cfgVehicles.inc"

#include "dialoge\dialoge.hpp"
#include "cfg3den.inc"

/* CBA XEH */
class Extended_PreInit_EventHandlers {
    RR_resources_preInit = "call compile preprocessFileLineNumbers '\RR_commons_resources\preInit.sqf'";
};

class Extended_PostInit_EventHandlers {
	RR_resources_postInit = "call compile preProcessFileLineNumbers '\RR_commons_resources\postInit.sqf'";
};