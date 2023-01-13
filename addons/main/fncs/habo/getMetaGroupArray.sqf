/*
*	Author: LAxemann
*
*	Desc: 
*   Returns a metaGroup's array (same as {RR_commons_habo_metaGroups select _x})
*
*	Params:
*	0 - MetaGroup index, name or array <INTEGER / STRING / ARRAY>
*
*	Returns:
*	0 - MetaGroup Array <ARRAY>
*
*	Examples: 
*   ["metaGroup1"] call RR_commons_habo_fnc_getMetaGroupArray;
*   [3] call RR_commons_habo_fnc_getMetaGroupArray;
* =================================================*/

#include "_macros.inc"

params ["_indexOrNameOrArray"];
private _originalInput = _indexOrNameOrArray;
if (_indexOrNameOrArray isEqualType []) exitWith {_indexOrNameOrArray};
if (_indexOrNameOrArray isEqualType "") then {
	_indexOrNameOrArray = [_indexOrNameOrArray] call FUNC(getMetaGroupIndex);
};
if (_indexOrNameOrArray isEqualType 1 && {_indexOrNameOrArray == -1}) then {
	["MetaGruppe ''%1'' nicht gefunden!",_originalInput] call BIS_fnc_error;
};
private _metaGroupArray = GVAR(metaGroups) param [_indexOrNameOrArray];

_metaGroupArray;