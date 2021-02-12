/*
*	Author: 
*	LAxemann
*
*	Desc.: 
*	Fügt dem easySpawn-Framework ein Template hinzu.
*
*	Params:
*	0 - Einheit oder Gruppe <OBJECT, GROUP>
*	1 - Template-Name <STRING>
*	2 - Soll die Originalgruppe gelöscht werden? <BOOL> [Optional]
*
*	Returns:
*	nil
*
*	Example:
*	[SomeGroup,"AssaultSquad",false] call RR_commons_easySpawn_fnc_setGroupTemplate;
*/

/* Übernehme den Input. Falls der Input eine Einheit ist, nehme stattdessen ihre Gruppe */
if !(isServer) exitWith {};
params [
	"_group",
	"_templateName",
	["_deleteGroup",true]
];
if !(typeName _group == "GROUP") then {_group = group _group};

private _previousTemplateIndex = missionNameSpace getVariable [(format ["RR_commons_easySpawn_templateIndex_%1",_templateName]),-1];
private _overwrite = (_previousTemplateIndex != -1);



/* Erstelle Variablen */
private _unitArray = [];
private _vehicleArray = [];
private _groupVehicles = [];
private _currentUnitID = 0;
private _currentVehicleID = 0;
private _side = side _group;


/* Indexiere Einheiten */
{
	private _unit = _x;
	private _dataArray = [_unit,_currentUnitID] call RR_commons_easySpawn_fnc_extractUnitInfo;
	_unitArray pushBack _dataArray;
	private _vehicle = vehicle _unit;
	if (_vehicle != _unit) then {
		private _unique = _groupVehicles pushBackUnique _vehicle;
		if (_unique != -1) then {
			_vehicle setVariable ["RR_commons_easySpawn_vehicleID",_currentVehicleID];
			_currentVehicleID = _currentVehicleID + 1;
		};
	};
	_currentUnitID = _currentUnitID + 1;
} forEach (units _group);


/* Indexiere Fahrzeuge und weise ihnen Einheiten-IDs zu */
{
	private _vehicle = _x;
	private _vehicleClass = typeOf _vehicle;
	private _vehicleCrewArray = [];
	{
		private _crewDataArray = _x call RR_commons_easySpawn_fnc_extractCrewInfo;
		_vehicleCrewArray pushBack _crewDataArray;
	} forEach (fullCrew _vehicle);
	_vehicleArray pushBack [_vehicleClass,_vehicleCrewArray];
} forEach _groupVehicles;


/* Übergebe die Daten zum Speichern an die "Hauptverwaltung", überschreibe falls notwendig */
private _handOverArray = [
	_templateName,
	_side,
	_unitArray,
	_vehicleArray
];
if (_overwrite) then {
	RR_commons_easySpawn_templateArray set [
		_previousTemplateIndex,
		_handOverArray
	];

} else {
	RR_commons_easySpawn_templateArray pushBack _handOverArray;
};
private _templateIndex = [(count RR_commons_easySpawn_templateArray) - 1,_previousTemplateIndex] select _overwrite;
missionNameSpace setVariable [(format ["RR_commons_easySpawn_templateIndex_%1",_templateName]),_templateIndex];


/* Lösche Originaleinheiten falls gewünscht */
if (_deleteGroup) then {
	{
		deleteVehicle _x;
	} forEach (_groupVehicles + (units _group));
	deleteGroup _group;
};

nil;