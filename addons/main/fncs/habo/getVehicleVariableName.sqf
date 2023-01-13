/*
*	Author: LAxemann
*
*	Desc: 
*   Assigns a fitting variable name to vehicle based on vehicleType
*
*	Params:
*	0 - Vehicle <VEHICLE>
*
*	Returns:
*	0 - Variablename, default "_nrCar" <STRING>
*
*	Examples: 
*   [myTank] call RR_commons_habo_fnc_getVehicleVariableName;
* =================================================*/

#include "_macros.inc"

params ["_vehicle"];
private _vehicleType = ([_vehicle] call BIS_fnc_objectType) param [1];
private _variableName = switch _vehicleType do {
	case "Helicopter": {"_nrHeli"};
	case "Tank": {"_nrArmored"};
	case "TrackedAPC": {"_nrAPC"};
	case "WheeledAPC": {"_nrAPC"};
	default {"_nrCar"};
};

_variableName;