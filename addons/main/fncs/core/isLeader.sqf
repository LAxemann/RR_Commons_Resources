/*
*	Author: LAxemann
*
*	Desc: 
*   Checkt, ob ein Charakter den Rang "Lieutenant" oder höher hat.
*
*	Params:
*	0 - Figur [Charakter]
*
*	Returns:
*	BOOL - Charakter hat Rang "Lieutenant" oder höher
*
*	Example: 
*   [someUnit] call RR_commons_core_fnc_isLeader
* =================================================*/

params ["_unit"];
private _isLeader = ((rank _unit) in ["LIEUTENANT","CAPTAIN","MAJOR","COLONEL"]);

_isLeader;
