/*
*	Author: LAxemann
*
*	Desc: 
*   Checkt, ob ein Fahrzeug vollbesetzt ist.
*
*	Params:
*	0 - Fahrzeug [Vehicle]
*
*	Returns:
*	BOOL - True wenn voll, False wenn freie Plätze
*
*	Example: 
*   [FAHRZEUG] call RR_commons_core_fnc_isVehicleEmpty
* =================================================*/

params ["_vehicle"];
private _isFull = true;
{
	if ((_vehicle emptyPositions _x) > 0) exitWith {_isFull = false};
} count ["Commander","Driver","Gunner","Cargo"];

_isFull;