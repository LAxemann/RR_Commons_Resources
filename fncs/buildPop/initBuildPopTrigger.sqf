/*
*	Author: LAxemann
*
*	Desc: 
*   Sets up a trigger for the building population system.
*
*	Params:
*	0 - Trigger <Trigger>
*	1 - Side of spawned units <SIDE>
*	2 - Unit classname pool <ARRAY ODER EASYSPAWN-TEMPLATESTRING>
*	3 - Nr. of units to spawn <INTEGER> [OPTIONAL, default 0 = random amount]
*	4 - Whether or not dynamicSimulation should be enabled <BOOL> [OPTIONAL, default true]
*	5 - Blacklisted position indizes <ARRAY> [OPTIONAL, default []]
*	6 - Custom code to execute on the spawned GROUP <String> [OPTIONAL, default ""]
*
*	Returns:
*	nil
*
*	Example(s): 
*	[
*		RR_commons_buildPop_buildingTrigger_1,
*		west,
*		["CUP_B_BAF_Soldier_RiflemanLite_MTP","CUP_BAF_Soldier_MTP_Base"],
*		10 + (round (random 10)),
*		true,
*		[0,1,2,3,4,18,41,42,43,44,63,64,65,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91],
*		"Hint 'yay, spawned!'"
*	] call RR_commons_buildPop_fnc_initBuildPopTrigger;
* =================================================*/

if !(isServer) exitWith {};
params ["_trigger","_side","_unitPool",["_unitCount",0],["_enableDynamicSimulation",true],["_bPosBlacklist",[]],["_customCodeAsString",""]];

_trigger setTriggerInterval 2;
_trigger setVariable ["RR_commons_buildPop_buildingPopulationArray",[_trigger,_side,_unitPool,_unitCount,_enableDynamicSimulation,_bPosBlacklist]];

_trigger setTriggerActivation ["ANYPLAYER", "PRESENT", false];
_trigger setTriggerStatements ["this && isServer", "
	private _triggerArray = thisTrigger getVariable ['RR_commons_buildPop_buildingPopulationArray',[]];
	private _createdGroup = grpNull;
	if ((count _triggerArray) > 0) then {
		_createdGroup = _triggerArray call RR_commons_buildPop_fnc_populateBuilding;
	};" + _customCodeAsString, 
""];

nil;