/*
*	Author: 
*	LAxemann
*
*	Desc.: 
*	Prepares the FullCrew-Array
*
*	Params:
*	0 - Unit <UNIT>
*	1 - Role <STRING>
*	2 - CargoIndex <NUMBER>
*	3 - TurretPath <ARRAY>
*
*	Returns:
*	<ARRAY>
*	0 - UnitID
*	1 - Role <STRING>
*	2 - CargoIndex <NUMBER>
*	3 - TurretPath <ARRAY>
*/

#include "_macros.inc"

params [
	"_crewUnit",
	"_role",
	"_cargoIndex",
	"_turretPath"
];
private _crewUnitID = _crewUnit getVariable [(format ["%1_easySpawn_templateID",PREFIXQUOTED]),-1];

/* Return */
[_crewUnitID,_role,_cargoIndex,_turretPath];