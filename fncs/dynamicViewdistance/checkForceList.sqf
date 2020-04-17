/*
*	Author: LAxemann
*
*	Desc: 
*   Forciert die erh�hte Sichtweite in festgelegten Arealen.
*
*	Params:
*	0 - Position
*
*	Returns:
*	Ob sich die Position in einem zu pr�fenden Bereich befindet [BOOL]
*
*	Example: 
*   [getPos player] call RR_commons_dynamicViewdistance_fnc_checkForceList
* =================================================*/

params [
	"_position"
];
private _inForceList = false;
if (isNil "RR_commons_dynamicViewdistance_forceList") then {RR_commons_dynamicViewdistance_forceList = []};
{
	if (_position inArea _x) exitWith {_inForceList = true};
} count RR_commons_dynamicViewdistance_forceList;

_inForceList;