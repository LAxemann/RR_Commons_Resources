/*
*	Author: LAxemann
*
*	Desc: 
*   Checks whether or not an object is within range to registered as a threat
*
*	Params:
*	0 - Object <OBJECT>
*	1 - Object2 <OBJECT>
*
*	Returns:
*	0 - Is within range <BOOL>
*
*	Examples: 
*   [someObject,someOtherObject] call RR_commons_habo_fnc_isObjectInRegisterRange;
* =================================================*/

#include "_macros.inc"

params ["_object","_otherObject"];

private _registerRange = _object getVariable [format ["%1_habo_registerRange",PREFIXQUOTED],-1];
if (_registerRange == -1) then {
	private _objectType = "";
	{
		if (_object isKindOf _x) exitWith {_objectType = _x};
	} forEach ["Man","LandVehicle","Air"];
	
	_registerRange = switch _objecttype do {
		case "Man": {DR_man};
		case "LandVehicle": {DR_landVehicle};
		case "Air": {DR_air};
		default {DR_man};
	};
	_object setVariable [format ["%1_habo_registerRange",PREFIXQUOTED],_registerRange];
};

((_object distance _otherObject) <= _registerRange);