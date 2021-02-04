/*
*	Author: LAxemann
*
*	Desc: 
*   Returns the name of a metaGroup based on Index, Array or name
*
*	Params:
*	0 - MetaGroup index, name or array <INTEGER / STRING / ARRAY>
*
*	Returns:
*	0 - MetaGroup Name <STRING>
*
*	Examples: 
*   [0] call RR_commons_habo_fnc_getMetaGroupName
* =================================================*/

#include "_macros.inc"

params ["_input"];
private _metaGroupArray = [_input] call FUNC(getmetaGroupArray);
private _metaGroupName = _metaGroupArray param [PARAM_metaGroupID];

_metaGroupName;