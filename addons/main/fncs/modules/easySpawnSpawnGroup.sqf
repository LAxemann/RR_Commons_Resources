/*
*	Author: LAxemann
*
*	Desc: 
*   Handles the easySpawn "spawn Group" module.
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
private _deleteOriginalGroup = _module getVariable ["deleteOriginalGroup",true];
private _customSide = _module getVariable ["customSide",""];
private _noVehicles = _module getVariable ["noVehicles",false];

private _spawnPosOrUnit = getPos _module;

if ((count _syncedUnits) > 0) then {
	private _groups = [];
	{
		private _currentGroup = _x; 
		_groups pushBackUnique _currentGroup;
	} forEach _syncedUnits;

	if ((count _groups) > 1) then {
		["Warning: Tried to spawn easySpawn-template %1 onto more than one group. First group in synced units was taken.",str _templateName] call BIS_fnc_error;
	}; 
	_spawnPosOrUnit = _syncedUnits select 0;
};


_customSide = toLower _customSide;
if (_customSide in ["west","east","resistance","civilian"]) then {
	_customSide = call compile _customSide;
} else {
	_customSide = nil;
};

if (isNil "_customSide") then {
	[_spawnPosOrUnit,_templateName,_deleteOriginalGroup,nil,_noVehicles] call OCFUNC(easySpawn,spawnGroup);
} else {
	[_spawnPosOrUnit,_templateName,_deleteOriginalGroup,_customSide,_noVehicles] call OCFUNC(easySpawn,spawnGroup);
};