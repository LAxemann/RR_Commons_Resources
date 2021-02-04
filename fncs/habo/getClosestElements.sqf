/*
*	Author: LAxemann
*
*	Desc: 
*   Takes a value and sorts an array of elements based on how close they are;
*
*	Params:
*	0 - Target value <FLOAT>
*	1 - Array of values <ARRAY>
*	2 - Floor, default nil <FLOAT>
*	3 - Ceiling, default nil <FLOAT>
*
*	Returns:
*	0 - Array of format [[_difference,_index,_originalValue],[...]...[...]]
*
*	Examples: 
*   [4,[-12,0,3,7]] call RR_commons_habo_fnc_getClosestElements
*   [4,[-12,0,3,7],0,6] call RR_commons_habo_fnc_getClosestElements

* =================================================*/

#include "_macros.inc"

params ["_targetValue","_valueArray",["_floor",nil],["_ceiling",nil]];
private _array = [];
{
	_value = _x;
	_continue = true;
	if !(isNil "_floor") then {
		if (_value < _floor) then {
			_continue = false;
		};
	};
	if !(isNil "_ceiling") then {
		if (_value > _ceiling) then {
			_continue = false;
		};
	};		
	if (_continue) then {
		_diff = abs(_value - _targetValue);
		_array pushBack [_diff,_forEachIndex,_value];
	};
} forEach _valueArray;
_array sort true;

_array;