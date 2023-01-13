/*
*	Author: LAxemann
*
*	Desc: 
*   Handles the easySpawn "set Group Template" module.
*
*	Params:
*	0 - Module <MODULE>
*	1 - Synced units <ARRAY>
*
*	Returns:
*	nil
* =================================================*/

#include "_macros.inc"

params [
	"_module",
	"_syncedUnits"
];

private _templateName = _module getVariable ["templateName","exampleName"];
private _deleteUnits = _module getVariable ["deleteOriginalGroup",true];

private _groups = [];
{
	private _currentGroup = _x; 
	_groups pushBackUnique _currentGroup;
} forEach _syncedUnits;

if ((count _groups) > 1) then {
	["Warning: Tried to register easySpawn-template %1 to units belonging to more than one group. First group in synced units was taken.",str _templateName] call BIS_fnc_error;
}; 

private _group = _groups select 0;

[_group,_templateName,_deleteUnits] call OCFUNC(easySpawn,setGroupTemplate);