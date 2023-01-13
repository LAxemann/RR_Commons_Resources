/*
*	Author: 
*	LAxemann
*
*	Desc.: 
*	Spawns units based ona  saved easySpawn template.
*
*	Params:
*	0 - Unit or Position <UNIT / POSITION>
*	1 - Template name <STRING>
*	2 - Delete original units? <BOOL> [Optional, default: True]
*	3 - Custom Side <SIDE> [Optional, default: nil]
*	4 - Exclude vehicles? <BOOL> [Optional, default: False]
*
*	Returns:
*	Created Group
*
*	Example(s):
*	[Unit,"AssaultSquad"] call RR_commons_easySpawn_fnc_spawnGroup;
*/

#include "_macros.inc"

if !(isServer) exitWith {};

/* Make sure the other templates are registered upon missionStart first */
if (isNil (format ["%1_easySpawn_templateArray",PREFIXQUOTED])) then {
	_this spawn {
		sleep 0.5;
		if (isNil (format ["%1_easySpawn_templateArray",PREFIXQUOTED])) then {
			grpNull
		} else {
			_this call FUNC(spawnGroup);
		};
	};
};

params [
	"_unitOrPos",
	"_templateName",
	["_deleteOriginalUnits",true],
	["_customSide",nil],
	["_excludeVehicles",false]
];

private _templateData = [_templateName] call FUNC(getTemplateData);
if ((count _templateData) == 0) exitWith {};
private _enableDynamicSimulation = false;

/* Wir checken, ob unser Parameter eine Position oder eine Einheit ist */
private _inputIsPos = (_unitOrPos isEqualType []);
private _referencePos = [];
if (_inputIsPos) then {
	_referencePos = _unitOrPos;
} else {
	_referencePos = getPos _unitOrPos;
};
_templateData params [
	"",
	"_side",
	"_unitArray",
	"_vehicleArray"
];


if !(isNil "_customSide") then {_side = _customSide};
private _group = grpNull;
if (_inputIsPos) then {
	_group = createGroup _side;
} else {
	_group = group _unitOrPos;
	_enableDynamicSimulation = dynamicSimulationEnabled _group;
};
if (_excludeVehicles) then {_vehicleArray = []};


/* Get original units and vehicles for later deletion */
private _originalUnits = [] + (units _group);
{
	private _vehicle = (vehicle _x);
	if (_vehicle != _x) then {
		_originalUnits pushBackUnique _vehicle;
	};
} forEach (units _group);


/* Create units according to template */
private _createdUnits = [];
private _createdUnitIDs = [];
{
	_x params [
		"_ID",
		"_className",
		"_rank",
		"_skill",
		"_isLeader",
		"_loadOut"
	];
	private _unit = [_referencePos,_group,_ID,_classname,_rank,_skill,_isLeader,_loadOut] call FUNC(spawnUnit);
	_createdUnits pushBack _unit;
	_createdUnitIDs pushBack _ID;
} forEach _unitArray;



/* Create vehicles according to template */
{
	_x params [
		"_className",
		"_crewArray"
	];
	private _vehicle = [_referencePos,_className,_crewArray,_createdUnits] call FUNC(spawnVehicle);
} forEach _vehicleArray;


/* If desired, delete original units */
if (_deleteOriginalUnits && {(count _originalUnits) > 0}) then {
	{
		deleteVehicle _x;
	} forEach _originalUnits;
	private _newLeader = (leader _group);
	{
		_x doFollow _newLeader;
	} forEach (units _group);
};

if (_enableDynamicSimulation) then {
	_group enableDynamicSimulation true;
};

_group;