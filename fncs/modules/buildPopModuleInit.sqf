/*
*	Author: LAxemann
*
*	Desc: 
*   Turns every trigger synced to the module into a buildPop trigger
*
*	Params:
*	0 - Module <MODULE>
*	1 - Synced units <ARRAY>
*
*	Returns:
*	nil
* =================================================*/

#include "_macros.inc"

params [
	"_module",
	"_syncedUnits"
];


private _syncedObjects = synchronizedObjects _module;


/* Get synced Triggers */
private _syncedTriggers = [];
{
	private _entity = _x;
	if (_entity isKindOf "emptyDetector") then {
		_syncedTriggers pushBackUnique _entity;
	};
} forEach _syncedObjects;


/* Exit if no synced triggers were found */
if ((count _syncedTriggers) == 0) exitWith {
	["Warning: BuildPop module named %1 is not synced to any triggers. No triggers were initialized.",str _module] call BIS_fnc_error;
};


/* Get buildPop values */
private _side = call compile (_module getVariable ["side",EAST]);
private _unitPool = _module getVariable ["unitPool","O_Soldier_F"];
private _unitCount = _module getVariable ["unitCount",5];
private _enableDynamicSimulation = _module getVariable ["enableDynamicSimulation",true];
private _blackList = _module getVariable ["blackList",""];
private _customCode = _module getVariable ["customCode",""];

_unitPool 	= call compile ("[" + _unitPool + "]");
_blackList 	= call compile ("[" + _blackList + "]");

{
	[_x,_side,_unitPool,_unitCount,_enableDynamicSimulation,_blackList,_customCode] call OCFUNC(buildPop,initBuildPopTrigger);
} forEach _syncedTriggers;

nil;