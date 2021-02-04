/*
*	Author: LAxemann
*
*	Desc: 
*   Categorizes each unit and vehicle of a metaGroup into an array.
*
*	Params:
*	0 - MetaGroup <INTEGER / STRING / ARRAY>
*	1 - Additional MetaGroups <ARRAY> [Optional]
*
*	Returns:
*	0 - Combat info array <ARRAY>
*
*	Examples: 
*   ["metaGroup1"] call RR_commons_habo_fnc_getCombatInfoFromMetaGroup;
*   ["metaGroup1",["anotherMetaGroup","yetAnotherMetaGroup"]] call RR_commons_habo_fnc_getCombatInfoFromMetaGroup;
* =================================================*/


#include "_macros.inc"

params ["_metaGroup",["_additionalMetaGroups",[]]];

private _metaGroupArray = [_metaGroup] call FUNC(getMetaGroupArray);
private _metaGroupID = _metaGroupArray param [PARAM_metaGroupID];
private _groups = [] + (_metaGroupArray param [PARAM_groups]);

{
	private _currentMetaGroup = _x;
	_currentMetaGroupArray = [_currentMetaGroup] call FUNC(getMetaGroupArray);
	private _currentGroups = _currentMetaGroupArray param [PARAM_groups];
	_groups append _currentGroups;
	
} forEach _additionalMetaGroups;

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

private _metaGroupVehicles = [];


{
	private _currentGroup = _x;
	{
		if (alive _x) then {
			_currentUnit = _x;
			_unitVehicle = (vehicle _currentUnit);
			_inVehicle = (_unitVehicle != _currentUnit);
			_entityToRegister = _currentUnit;
			private _variableName = "";
			if (_inVehicle) then {
				_cargoIndex = _unitVehicle getCargoIndex _currentUnit;
				_isCargo = [true,false] select (_cargoIndex == -1);
				if (_isCargo) then {
					_variableName = "_nrInf";
				} else {
					_pushBackIndex = _metaGroupVehicles pushBackUnique _unitVehicle;
					if ((_pushBackIndex != -1) && {alive _unitVehicle}) then {
						_variableName = [_unitVehicle] call FUNC(getVehicleVariableName);
						_entityToRegister = _unitVehicle;
					};
				};
			} else {
				_assignedVehicle = assignedVehicle _currentUnit;
				_assignedVehicleRole = assignedVehicleRole _currentUnit;
				if (count _assignedVehicleRole == 0) then {
					_assignedVehicleRole = "";
				} else {
					_assignedVehicleRole = _assignedVehicleRole param [0];
				};
				if ((isNull _assignedVehicle) || (_assignedVehicleRole == "cargo")) then {
					_variableName = "_nrInf";
				} else {
					_pushBackIndex = _metaGroupVehicles pushBackUnique _assignedVehicle;
					if ((_pushBackIndex != -1) && {alive _assignedVehicle}) then {
						_variableName = [_assignedVehicle] call FUNC(getVehicleVariableName);
						_entityToRegister = _assignedVehicle;
					};
				};
			};
			
			if (_variableName != "") then {
				_combatRole = [_entityToRegister] call FUNC(getCombatRole);
				_variableName = _variableName + _combatRole;
				call (compile format ["%1 = %1 + 1",_variableName]);
			};
		};
	} forEach (units _currentGroup);
} forEach _groups;


/* Return */
[
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

