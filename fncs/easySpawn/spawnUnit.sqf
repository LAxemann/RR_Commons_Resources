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
_unit setVariable ["RR_commons_easySpawn_ID",_ID];
_unit triggerDynamicSimulation false;
if (_isLeader) then {_group selectLeader _unit};

_unit;