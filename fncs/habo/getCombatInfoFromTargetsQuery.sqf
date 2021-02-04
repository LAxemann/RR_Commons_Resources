/*
*	Author: LAxemann
*
*	Desc: 
*   Creates a categorized array of enemy targets known to a metaGroup's leaders.
*
*	Params:
*	0 - MetaGroup <INTEGER / STRING / ARRAY>
*
*	Returns:
*	0 - Combat info array <ARRAY>
*
*	Examples: 
*   [myGroup,"metaGroup1"] call RR_commons_habo_fnc_getCombatInfoFromTargetsQuery;
* =================================================*/

#include "_macros.inc"

params ["_metaGroup"];
private _metaGroupArray = [_metaGroup] call FUNC(getMetaGroupArray);

private _groups = _metaGroupArray param [PARAM_groups];

private _combatRole = -1;

private _nrHeli = 0;
private _nrHeliAA = 0;
private _nrHeliAT = 0;
private _nrHeliUnarmed = 0;

private _nrArmored = 0;
private _nrArmoredAA = 0;
private _nrArmoredAT = 0;
private _nrArmoredUnarmed = 0;

private _nrAPC = 0;
private _nrAPCAA = 0;
private _nrAPCAT = 0;
private _nrAPCUnarmed = 0;

private _nrCar = 0;
private _nrCarAA = 0;
private _nrCarAT = 0;
private _nrCarUnarmed = 0;

private _nrInf = 0;
private _nrInfAA = 0;
private _nrInfAT = 0;
private _nrInfUnarmed = 0;

private _varString = "";

private _knownEnemies = [];

{
	private _leader = (leader _x);
	private _targetsQuery = _leader targetsQuery [objNull, sideEnemy, "", [], 0];
	{
		private _object = _x param [1];
		if (alive _object) then {
			private _pushBackResult = _knownEnemies pushBackUnique _object;
			if ((_pushBackResult != -1) && {(side _object) != sideUnknown} && {(side _object) != (side _leader)}) then {
				_variableName = "";
				if (_object isKindOf "Man") then {
					_variableName = "_nrInf";
				} else {
					_vehicleType = ([_object] call BIS_fnc_objectType) param [1];
					_variableName = switch _vehicleType do {
						case "Helicopter": {"_nrHeli"};
						case "Tank": {"_nrArmored"};
						case "TrackedAPC": {"_nrAPC"};
						case "WheeledAPC": {"_nrAPC"};
						default {"_nrCar"};
					};			
				};
				if (_variableName != "") then {
					_combatRole = [_object] call FUNC(getCombatRole);
					_variableName = _variableName + _combatRole;
					call (compile format ["%1 = %1 + 1",_variableName]);
				};
			};
		};
	} forEach _targetsQuery;
} forEach _groups;

private _return = [
	_nrHeli,
	_nrHeliAA,
	_nrHeliAT,
	_nrHeliUnarmed,
	
	_nrArmored,
	_nrArmoredAA,
	_nrArmoredAT,
	_nrArmoredUnarmed,
	
	_nrAPC,
	_nrAPCAA,
	_nrAPCAT,
	_nrAPCUnarmed,
	
	_nrCar,
	_nrCarAA,
	_nrCarAT,
	_nrCarUnarmed,
	
	_nrInf,
	_nrInfAA,
	_nrInfAT,
	_nrInfUnarmed
];

_return;
