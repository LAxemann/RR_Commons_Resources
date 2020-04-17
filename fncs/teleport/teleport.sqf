/*
*	Author: LAxemann
*
*	Desc: 
*   Teleportiert eine Einheit zum Ziel.
*	Falls das Ziel ein Fahrzeug ist, versucht das Script,
*	die Einheit im Fahrzeug unterzubringen.
*
*	Params:
*	0 - Name der geänderten Combobox [ctrl]
*	1 - Index des neuen Eintrags [Number]
*
*	Returns:
*	True
*
*	Example: 
*   [(findDisplay 5050) displayCtrl 2100,2] spawn RR_commons_teleport_fnc_openDialog
* =================================================*/

closeDialog 0;
params ["_control","_index"];
private ["_emptyPosition","_teleportPos"];
private _moveInSuccess = false;
private _unitArray = _control getVariable ["RR_commons_teleport_ctrlUnits",[]];
private _target    = _unitArray select _index;
if (isNull _target) exitWith {hint "Achtung!\nDie Figur befindet sich nicht mehr im Spiel."};
RR_commons_teleport_canTeleport = false;

private _actionID = player getVariable ["RR_commons_teleport_id",-1];
if (_actionID != -1) then {player removeAction _actionID};
player setVariable ["RR_commons_teleport_id",-1];

player allowDamage false;
[0, "BLACK", 0.2, 1] spawn BIS_fnc_fadeEffect;
sleep 0.3;
if ((vehicle _target) != _target) then {
	_moveInSuccess = player moveInAny (vehicle _target);
	if !(_moveinSuccess) then {
		_emptyPosition = (getPos _target) findEmptyPosition [0,15];
		_teleportPos = [getPos _target,_emptyPosition] select ((count _emptyPosition) > 0);
		player setPos _teleportPos;
	};
} else {
	_teleportPos = (getPos _target);
	player setPos _teleportPos;
};
[1, "BLACK", 0.2, 1] spawn BIS_fnc_fadeEffect;
sleep 1;
player allowDamage true;
RR_commons_teleport_canTeleport = true;
true;