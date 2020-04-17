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

params ["_unit","_ID"];
private _className = typeOf _unit;

_unit setVariable ["RR_commons_easySpawn_templateID",_ID];
private _loadOut = getUnitLoadOut _unit;
private _rank = rank _unit;
private _isLeader = (_unit == leader (group _unit));
private _skill = skill _unit;

/* Return */
[_ID,_classname,_rank,_skill,_isLeader,_loadOut];