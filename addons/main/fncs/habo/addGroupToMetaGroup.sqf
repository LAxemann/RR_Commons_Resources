/*
*	Author: LAxemann
*
*	Desc: 
*   Uniquely pushes a provided group into the metaGroupArray.
*
*	Params:
*	0 - Group <GROUP>
*	1 - metaGroup name <STRING>
*
*	Returns:
*	0 - Index of added group in RR_commons_habo_metaGroups
*
*	Examples: 
*   [myGroup,"metaGroup1"] call RR_commons_habo_fnc_addGroupToMetaGroup;
* =================================================*/

#include "_macros.inc"

params [
	"_group",
	"_metaGroupID"
];

private _index = [_metaGroupID] call FUNC(getMetaGroupIndex);
if (_index == -1) exitWith {["Meta Group name not found!",nil] call BIS_fnc_error};

private _metaGroupArray = GVAR(metaGroups) param [_index];

private _groups = _metaGroupArray param [PARAM_groups];

private _groupIndex = _groups pushBackUnique _group;

private _metaGroupArray = GVAR(metaGroups) select _index;
_metaGroupArray set [PARAM_groups,_groups];

_groupIndex;

