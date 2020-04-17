/*
*	Author: LAxemann
*
*	Desc: 
*   Setzt die vier verschiedenen Fraktionen standardmäßig auf unterschiedliche Funk-Presets.
*	Dadurch wird vermieden, dass sich zwei Fraktionen zufällig "dazwischenfunken".
*
*	Params:
*	None
*
*	Returns:
*	Nil
*
*	Example: 
*   call RR_commons_acre_fnc_acreInit
* =================================================*/

if (isDedicated || !(hasInterface)) exitWith {};
private _side = side player;

/* Definiert unterschiedliche Presets für unterschiedliche Seiten */
switch (_side) do {
	case west: {
		["ACRE_PRC343", 	"default"] call acre_api_fnc_setPreset;
		["ACRE_PRC148", 	"default"] call acre_api_fnc_setPreset;
		["ACRE_PRC152", 	"default"] call acre_api_fnc_setPreset;
		["ACRE_PRC77", 		"default"] call acre_api_fnc_setPreset;
		["ACRE_PRC117F", 	"default"] call acre_api_fnc_setPreset;
	};
	case east: {
		["ACRE_PRC343", 	"default2"] call acre_api_fnc_setPreset;
		["ACRE_PRC148", 	"default2"] call acre_api_fnc_setPreset;
		["ACRE_PRC152", 	"default2"] call acre_api_fnc_setPreset;
		["ACRE_PRC77", 		"default2"] call acre_api_fnc_setPreset;
		["ACRE_PRC117F", 	"default2"] call acre_api_fnc_setPreset;
	};
	case resistance: {
		["ACRE_PRC343", 	"default3"] call acre_api_fnc_setPreset;
		["ACRE_PRC148", 	"default3"] call acre_api_fnc_setPreset;
		["ACRE_PRC152", 	"default3"] call acre_api_fnc_setPreset;
		["ACRE_PRC77", 		"default3"] call acre_api_fnc_setPreset;
		["ACRE_PRC117F", 	"default3"] call acre_api_fnc_setPreset;
	};
	case civilian: {
		["ACRE_PRC343", 	"default4"] call acre_api_fnc_setPreset;
		["ACRE_PRC148", 	"default4"] call acre_api_fnc_setPreset;
		["ACRE_PRC152", 	"default4"] call acre_api_fnc_setPreset;
		["ACRE_PRC77", 		"default4"] call acre_api_fnc_setPreset;
		["ACRE_PRC117F", 	"default4"] call acre_api_fnc_setPreset;
	};
};

nil;
