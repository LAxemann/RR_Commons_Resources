/*
*	Author: 
*	LAxemann
*
*	Desc.: 
*
*	Params:
*
*	Returns:
*
*/

#include "_macros.inc"

params [
	"_referencePos",
	"_className",
	"_crewArray",
	"_createdUnits"
];

private _spawnPos =  _referencePos findEmptyPosition [5,100,_className];
private _vehicle = _className createVehicle _spawnPos;

{
	_x params [
		"_unitID",
		"_role",
		"_cargoIndex",
		"_turretPath"
	];
	private _unit = _createdUnits param [_unitID];
	_role = toLower _role;
	switch (_role) do {
		case "driver": 		{_unit moveinDriver _vehicle};
		case "commander": 	{_unit moveinCommander _vehicle};
		case "gunner": 		{_unit moveinGunner _vehicle};
		case "cargo": 		{_unit moveinCargo [_vehicle,_cargoIndex]};
		case "turret": 		{_unit moveinTurret [_vehicle,_turretPath]};
	};
} forEach _crewArray;
