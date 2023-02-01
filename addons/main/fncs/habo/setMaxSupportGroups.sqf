/*
*	Author: LAxemann
*
*	Desc: 
*   Sets the maximum amount of support metaGroups that can be called
*
*	Params:
*	0 - metaGroup name, index or array <String / Index /ARRAY>
*	1 - Max amount of support metaGroups, default 256 <INTEGER>
*
*	Returns:
*	True if success, false if failure <BOOL>
*
*	Examples: 
*   ["metaGroup1",15] call RR_commons_habo_fnc_setMaxSupportGroups;
* =================================================*/

#include "_macros.inc"

params ["_metaGroup","_maxSupportGroupsNr"];

private _metaGroupArray = [_metaGroup] call FUNC(getMetaGroupArray);
_metaGroupArray set [PARAM_maxSupportGroups,_maxSupportGroupsNr];

true;