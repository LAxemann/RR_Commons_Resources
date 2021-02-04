/*
*	Author: LAxemann
*
*	Desc: 
*   Sets the max distance of a metaGroup
*
*	Params:
*	0 - metaGroup name, index or array <String / Index /ARRAY>
*	1 - Max distance, default 0 (0 = unlimited) <FLOAT>
*
*	Returns:
*	True if success, false if failure <BOOL>
*
*	Examples: 
*   ["metaGroup1",6000] call RR_commons_habo_fnc_setMetaGroupMaxDistance;
* =================================================*/

#include "_macros.inc"

params ["_metaGroup",["_maxDistance",0]];

private _metaGroupArray = [_metaGroup] call FUNC(getMetaGroupArray);
_metaGroupArray set [PARAM_maxDistance,_maxDistance];

true;