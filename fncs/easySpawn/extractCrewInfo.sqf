/*
*	Author: 
*	LAxemann
*
*	Desc.: 
*	Bereitet den FullCrew-Array auf.
*
*	Params:
*	0 - Einheit <UNIT>
*	1 - Rolle <STRING>
*	2 - CargoIndex <NUMBER>
*	3 - TurretPath <ARRAY>
*
*	Returns:
*	<ARRAY>
*	0 - UnitID
*	1 - Rolle <STRING>
*	2 - CargoIndex <NUMBER>
*	3 - TurretPath <ARRAY>
*/

params [
	"_crewUnit",
	"_role",
	"_cargoIndex",
	"_turretPath"
];
private _crewUnitID = _crewUnit getVariable ["RR_commons_easySpawn_templateID",-1];

[_crewUnitID,_role,_cargoIndex,_turretPath];