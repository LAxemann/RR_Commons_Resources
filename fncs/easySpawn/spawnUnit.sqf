/*
*	Author: 
*	LAxemann
*
*	Desc.: 
*	Spawns a unit based on the easySpawn input data
*
*	Params:
*
*	Returns:
*
*/

#include "_macros.inc"

params [
	"_referencePos",
	"_group",
	"_ID",
	"_classname",
	"_rank",
	"_skill",
	"_isLeader",
	"_loadOut"
];

private _unit = _group createUnit [_className,_referencePos,[],2,"NONE"];
_unit setSkill _skill;
_unit setRank _rank;
_unit setUnitLoadout _loadOut;
_unit setVariable [format ["%1_easySpawn_ID",PREFIXQUOTED],_ID];
_unit triggerDynamicSimulation false;
if (_isLeader) then {_group selectLeader _unit};

_unit;