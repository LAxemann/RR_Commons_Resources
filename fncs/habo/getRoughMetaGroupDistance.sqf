/*
*	Author: LAxemann
*
*	Desc: 
*   Gets a rough distance between two metaGroups by comparing the distances between group leaders.
*
*	Params:
*	0 - metaGroup name, index or array <String / Index /ARRAY>
*	1 - metaGroup name, index or array <String / Index /ARRAY>
*
*	Returns:
*	Closest distance, -1 if one group was empty <FLOAT>
*
*	Examples: 
*   ["metaGroup1","metaGroup2"] call RR_commons_habo_fnc_getRoughMetaGroupDistance;
* =================================================*/

#include "_macros.inc"

params ["_metaGroup1","_metaGroup2"];
private _closestDistance = -1;

private _metaGroup1Array = [_metaGroup1] call FUNC(getMetaGroupArray);
private _metaGroup2Array = [_metaGroup2] call FUNC(getMetaGroupArray);

private _metaGroup1Groups = _metaGroup1Array param [PARAM_groups];
private _metaGroup2Groups = _metaGroup2Array param [PARAM_groups];

private _metaGroup1Leaders = [];
private _metaGroup2Leaders = [];
{
	_metaGroup1Leaders pushBackUnique (leader _x);
} forEach _metaGroup1Groups;
{
	_metaGroup2Leaders pushBackUnique (leader _x);
} forEach _metaGroup2Groups;


private _distances = [];
{
	_currentLeader = _x;
	{
		_distance = _currentLeader distance _x;
		_distances pushBack _distance;
	
	} forEach _metaGroup2Leaders;
} forEach _metaGroup1Leaders;

if ((count _distances) > 0) then {
	_distances sort true;
	_closestDistance = _distances select 0;
};

_closestDistance;