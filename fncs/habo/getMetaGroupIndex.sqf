/*
*	Author: LAxemann
*
*	Desc: 
*   Returns metaGroup index based on metaGroup name
*
*	Params:
*	0 - metaGroup name <STRING>
*
*	Returns:
*	0 - Index of metaGroup in RR_commons_habo_metaGroups, -1 if failed <INTEGER>
*
*	Examples: 
*   ["metaGroup1"] call RR_commons_habo_fnc_getMetaGroupIndex;
* =================================================*/

#include "_macros.inc"

params ["_metaGroupID"];
if (_metaGroupID isEqualType 1) exitWith {_metaGroupID};
private _index = 0;
private _found = false;
{
	_x params [
		"_metaGroupIDSearch"
	];
	if (_metaGroupIDSearch == _metaGroupID) exitWith {_found = true};
	_index = _index + 1;
} forEach GVAR(metaGroups);

[-1,_index] select (_found);