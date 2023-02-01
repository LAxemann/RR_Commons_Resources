/*
*	Author: 
*	LAxemann
*
*	Desc.: 
*	Adds a template to the easySpawn template array
*
*	Params:
*	0 - Unit or Group <UNIT GROUP>
*	1 - Template-Name <STRING>
*	2 - Delete original group? <BOOL> [Optional, default: True]
*
*	Returns:
*	nil
*
*	Example:
*	[SomeGroup,"AssaultSquad",false] call RR_commons_easySpawn_fnc_setGroupTemplate;
*/

#include "_macros.inc"

/* Take input. If input is a unit, convert input to unit's group */
if !(isServer) exitWith {};
params [
	"_group",
	"_templateName",
	["_deleteGroup",true]
];

if (isNil (format ["%1_easySpawn_templateArray",PREFIXQUOTED])) then {
	GVAR(templateArray) = []
};

if !(typeName _group == "GROUP") then {_group = group _group};

private _previousTemplateIndex = missionNameSpace getVariable [format ["%1_easySpawn_templateIndex_%2",PREFIXQUOTED,_templateName],-1];
private _overwrite = (_previousTemplateIndex != -1);


/* Create variables */
private _unitArray = [];
private _vehicleArray = [];
private _groupVehicles = [];
private _currentUnitID = 0;
private _currentVehicleID = 0;
private _side = side _group;


/* Index units */
{
	private _unit = _x;
	private _dataArray = [_unit,_currentUnitID] call FUNC(extractUnitInfo);
	_unitArray pushBack _dataArray;
	private _vehicle = vehicle _unit;
	if (_vehicle != _unit) then {
		private _unique = _groupVehicles pushBackUnique _vehicle;
		if (_unique != -1) then {
			_vehicle setVariable [format ["%1_easySpawn_vehicleID",PREFIXQUOTED],_currentVehicleID];
			_currentVehicleID = _currentVehicleID + 1;
		};
	};
	_currentUnitID = _currentUnitID + 1;
} forEach (units _group);


/* Index vehicles and add unit-IDs to them */
{
	private _vehicle = _x;
	private _vehicleClass = typeOf _vehicle;
	private _vehicleCrewArray = [];
	{
		private _crewDataArray = _x call FUNC(extractCrewInfo);
		_vehicleCrewArray pushBack _crewDataArray;
	} forEach (fullCrew _vehicle);
	_vehicleArray pushBack [_vehicleClass,_vehicleCrewArray];
} forEach _groupVehicles;


/* Hand data over to main array, overwrite existing data set if required */
private _handOverArray = [
	_templateName,
	_side,
	_unitArray,
	_vehicleArray
];
if (_overwrite) then {
	GVAR(templateArray) set [
		_previousTemplateIndex,
		_handOverArray
	];

} else {
	GVAR(templateArray) pushBack _handOverArray;
};
private _templateIndex = [(count GVAR(templateArray)) - 1,_previousTemplateIndex] select _overwrite;
missionNameSpace setVariable [(format ["%1_easySpawn_templateIndex_%2",PREFIXQUOTED,_templateName]),_templateIndex];


/* Delete original units if desired */
if (_deleteGroup) then {
	{
		deleteVehicle _x;
	} forEach (_groupVehicles + (units _group));
	deleteGroup _group;
};

nil;