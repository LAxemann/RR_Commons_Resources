/*
*	Author: LAxemann
*
*	Desc: 
*   Removes a metaGroup array out of the main array. Delays the operation if current main routine is checking
*
*	Params:
*	0 - metaGroup name or index <STRING / INTEGER>
*
*	Returns:
*	0 - true if success, false if failure <BOOL>
*
*	Examples: 
*   ["metaGroup1"] call RR_commons_habo_fnc_deleteMetaGroup;
* =================================================*/

#include "_macros.inc"

params ["_metaGroupName"];
private _index = [_metaGroupName] call FUNC(getMetaGroupIndex);
[_index] spawn {
	params ["_index"];
	if (GVAR(isChecking)) then {
		waitUntil {!GVAR(RR_commons_habo_isChecking)};
	};
	GVAR(metaGroups) deleteAt _index;
};