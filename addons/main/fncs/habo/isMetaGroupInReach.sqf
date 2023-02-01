/*
*	Author: LAxemann
*
*	Desc: 
*   Checks if two metaGroups are within their defined max reach
*
*	Params:
*	0 - metaGroup name, index or array <String / Index /ARRAY>
*	1 - metaGroup name, index or array <String / Index /ARRAY>
*
*	Returns:
*	True if within reach, false if not <BOOL>
*
*	Examples: 
*   ["metaGroup1","metaGroup2"] call RR_commons_habo_fnc_isMetaGroupInReach;
* =================================================*/

#include "_macros.inc"

params ["_metaGroup1","_metaGroup2"];

private _inReach = true;
private _metaGroup1Array = [_metaGroup1] call FUNC(getMetaGroupArray);
private _metaGroup2Array = [_metaGroup2] call FUNC(getMetaGroupArray);

private _metaGroup1MaxDist = _metaGroup1Array param [PARAM_maxDistance];
private _metaGroup2MaxDist = _metaGroup2Array param [PARAM_maxDistance];

if ((_metaGroup1MaxDist == 0) && {_metaGroup2MaxDist == 0}) exitWith {_inReach};

private _distance = [_metaGroup1,_metaGroup2] call FUNC(getRoughMetaGroupDistance);

if (((_metaGroup1MaxDist > 0) && (_distance > _metaGroup1MaxDist)) || ((_metaGroup2MaxDist > 0) && (_distance > _metaGroup2MaxDist))) then {
	_inReach = false;
};

if (GVAR(debug)) then {copyToClipboard str _inReach};

_inReach;

