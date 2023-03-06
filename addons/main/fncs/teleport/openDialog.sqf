/*
*	Author: LAxemann
*
*	Desc: 
*   Öffnet den Teleport-Dialog, füllt, sortiert und speichert Werte.
*
*	Params:
*	None
*
*	Returns:
*	Nil
*
*	Example: 
*   call RR_commons_teleport_fnc_openDialog
* =================================================*/

/* Wir checken am Anfang, ob wir teleportieren dürfen. Verhindert, dass das Interface beim Teleport erneut aufgerufen wird */
if (!(RR_commons_teleport_canTeleport)) exitWith {};
private ["_name","_stringAdd","_unit"];

/* Wir rufen den "Dialog", also das Menü, auf und weisen den ComboBoxen variablen zu */
createDialog "RR_commons_teleport_dialog";
private _parentDisplay = (findDisplay 5050);
private _comboSide  = _parentDisplay displayCtrl 2100;
private _comboGroup = _parentDisplay displayCtrl 2101;
private _comboMisc  = _parentDisplay displayCtrl 2102;

/* Wir initialisieren die Arrays und checken ja nach Einstellung, ob KI berücksichtigt wird */
private _sortedArray = [];
private _sideUnits   = [];
private _groupUnits  = [];
private _miscObjects = [];
private _baseArray   = [allPlayers,allUnits] select (RR_commons_teleport_allowTeleportToAI);

/* Wir erstellen einen Array mit dem Format ["Einheiten Name",Einheit] um ihn alphabetisch sortieren zu können */
_baseArray select {
	if (_x != player) then {
		_name = name _x;
		_sortedArray pushBack [_name,_x];
	};
	true;
};
_sortedArray sort true; // <- Sortiert den Array

/* Wir befüllen die Comboboxen. Zusätzlich fügen wir Text hinzu, wenn sich das Ziel in einem Fahrzeug befindet oder es unser Gruppenleiter ist */
_sortedArray select {
	_name = _x select 0;
	_unit = _x select 1;
	_stringAdd = "";
	
	if ((vehicle _unit) != _unit) then {
		_stringAdd = [" (Im Fahrzeug)"," (Im vollen Fahrzeug)"] select ([vehicle _unit] call RR_commons_core_fnc_isVehicleFull);
	};
	
	if (_unit == (leader (group player))) then {_stringAdd = _stringAdd + " [Leader]"};
	_name = format ["%1%2",_name,_stringAdd];
	if ((side _unit) == (side player)) then {
		_sideUnits pushBack _unit;
		_comboSide lbAdd _name;
	};
	if (_unit in (units group player)) then {
		_groupUnits pushBack _unit;
		_comboGroup lbAdd _name;		
	};
	true
};
if (isNil "RR_commons_teleport_teleportTargetObjects") then {RR_commons_teleport_teleportTargetObjects = []};
RR_commons_teleport_teleportTargetObjects select {
	_comboMisc lbAdd (_x select 0);
	_miscObjects pushBack (_x select 1);
	true;
};
/* Die Comboboxen bekommen Variablen mit den Einheiten zugewiesen */
_comboGroup setVariable ["RR_commons_teleport_ctrlUnits",_groupUnits];
_comboSide  setVariable ["RR_commons_teleport_ctrlUnits",_sideUnits];
_comboMisc  setVariable ["RR_commons_teleport_ctrlUnits",_miscObjects];

nil;
