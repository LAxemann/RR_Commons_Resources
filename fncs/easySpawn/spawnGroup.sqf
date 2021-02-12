/*
*	Author: 
*	LAxemann
*
*	Desc.: 
*	Spawned Einheiten basierend auf einem gespeicherten Template.
*
*	Params:
*	0 - Einheit oder Position <UNIT / POSITION>
*	1 - Name des Templates <STRING>
*	2 - Originaleinheiten löschen? <BOOL> [Optional, Standard: Ja]
*	3 - Seite überschreiben? <SIDE> [Optional, Standard: Nein, String ""]
*	4 - Fahrzeuge auslassen? <BOOL> [Optional, Standard: Nein]
*
*	Returns:
*	Gruppe, die erstellt wurde.
*
*	Example:
*	[EINHEIT,"AssaultSquad"] call RR_commons_easySpawn_fnc_spawnGroup;
*/
if !(isServer) exitWith {};
params [
	"_unitOrPos",
	"_templateName",
	["_deleteOriginalUnits",true],
	["_customSide",nil],
	["_excludeVehicles",false]
];

private _templateData = [_templateName] call RR_commons_easySpawn_fnc_getTemplateData;
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
private _originalUnits = (units _group);
{
	private _vehicle = (vehicle _x);
	if (_vehicle != _x) then {
		_originalUnits pushBackUnique _vehicle;
	};
} forEach (units _group);


/* Create units according to template */
private _createdUnits = [];
{
	_x params [
		"_ID",
		"_className",
		"_rank",
		"_skill",
		"_isLeader",
		"_loadOut"
	];
	private _unit = [_referencePos,_group,_ID,_classname,_rank,_skill,_isLeader,_loadOut] call RR_commons_easySpawn_fnc_spawnUnit;
	_createdUnits pushBack _unit;
	_createdUnitIDs pushBack _ID;
} forEach _unitArray;



/* Create vehicles according to template */
{
	_x params [
		"_className",
		"_crewArray"
	];
	private _vehicle = [_referencePos,_className,_crewArray,_createdUnits] call RR_commons_easySpawn_fnc_spawnVehicle;
} forEach _vehicleArray;


/* If desired, delete original units */
if (_deleteOriginalUnits) then {
	{
		deleteVehicle _x;
	} forEach _originalUnits;
	{
		_x doFollow (leader _group);
	} forEach (units _group);
};

if (_enableDynamicSimulation) then {
	_group enableDynamicSimulation true;
};

_group;