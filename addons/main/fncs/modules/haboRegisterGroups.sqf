/*
*	Author: LAxemann
*
*	Desc: 
*   Handles the habo "Register Groups" Editor module.
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

/* Get module variables */
private _metaGroupName 	= _module getVariable ["metaGroupName","exampleName"];
private _isDefender 	= _module getVariable ["isDefender",true];
private _isSupport 		= _module getVariable ["isSupport",false];
private _range 			= _module getVariable ["range",0];
private _maxSupports 	= _module getVariable ["maxSupports",256];

private _groups = [];
private _sides = [];
{
	private _currentGroup = _x; 
	_groups pushBackUnique _currentGroup;
} forEach _syncedUnits;


/* Make sure all groups belong to the same side */
{
	_sides pushBackUnique (side _x);
} forEach _groups;

if (count _sides > 1) exitWith {
	["Warning: Tried to register MetaGroup %1 with units belonging to more than one side. Registration failed.",str _metaGroupName] call BIS_fnc_error;
};


/* Determine group type based on input */
private _groupType = "Defender";
if (_isDefender && _isSupport) then {
	_groupType = "Both"
} else {
	_groupType = ["Support","Defender"] select _isDefender;
};


/* Prevent registering no units/empty groups (however that could realistically happen :S */
if ((count _syncedUnits) == 0) then {
	["Warning: Tried to register MetaGroup %1 with no synced units. Sync units in editor to add their group to the metaGroup!",str _metaGroupName] call BIS_fnc_error;
};

[_groups,_metaGroupName,_groupType,_range,_maxSupports] call OCFUNC(habo,registerGroups);

nil;