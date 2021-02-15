/*
*	Author: 
*	LAxemann
*
*	Desc.: 
*	Extracts a unit's data for template creation.
*
*	Params:
*	0 - Unit <UNIT>
*	1 - ID to be assigned within the template
*
*	Returns:
*	<ARRAY>
*	0 - ID <INTEGER>
*	1 - ClassName <STRING>
*	2 - Rank <STRING>
*	3 - Skill <FLOAT>
*	4 - isLeader <BOOL>
*	5 - Loadout <ARRAY to be used in setUnitLoadOut>
*
*	Example(s):
*	[someUnit,1] call RR_commons_easySpawn_fnc_extractUnitInfo;
*/

#include "_macros.inc"

params ["_unit","_ID"];
private _className = typeOf _unit;

_unit setVariable [format ["%1_easySpawn_templateID",PREFIXQUOTED],_ID];
private _loadOut = getUnitLoadOut _unit;
private _rank = rank _unit;
private _isLeader = (_unit == leader (group _unit));
private _skill = skill _unit;

/* Return */
[_ID,_classname,_rank,_skill,_isLeader,_loadOut];