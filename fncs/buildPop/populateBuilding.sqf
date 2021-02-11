/*
*	Author: LAxemann
*
*	Desc: 
*   Spawns a group of units inside a building, on available positions
*
*	Params:
*	0 - Trigger <Trigger>
*	1 - Side of spawned units <SIDE>
*	2 - Unit classname pool <ARRAY>
*	3 - Nr. of units to spawn <INTEGER> [OPTIONAL, default 0 = random amount]
*	4 - Whether or not dynamicSimulation should be enabled <BOOL> [OPTIONAL, default true]
*	5 - Blacklisted position indizes <ARRAY> [OPTIONAL, default []]
*
*	Returns:
*	0 - Created group, grpNull if failed <GROUP>
*
*	Example(s): 
*	[
*		RR_mission_buildingTrigger_1,
*		west,
*		["CUP_B_BAF_Soldier_RiflemanLite_MTP","CUP_BAF_Soldier_MTP_Base"],
*		10 + (round (random 10)),
*		true,
*		[0,1,2,3,4,18,41,42,43,44,63,64,65,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91]
*	] call RR_commons_buildPop_fnc_populateBuilding;
* =================================================*/

if !(isServer) exitWith {};
params ["_trigger","_side","_unitPool",["_unitCount",0],["_enableDynamicSimulation",true],["_bPosBlacklist",[]]];

private _createdGroup = grpNull;
private _building = nearestBuilding _trigger;
private _buildingPositions = [_building] call BIS_fnc_buildingPositions;
private _usableBuildingPositions = [];
{
	if !(_forEachIndex in _bPosBlacklist) then {
		_usableBuildingPositions pushBack _x;
	};
} forEach _buildingPositions;

private _bPosCount = count _usableBuildingPositions;


if (_bPosCount > 0) then {
	if (_bPosCount < _unitCount) then {
		_unitCount = _bPosCount;
	};
	if (_unitCount == 0) then {
		_unitCount = round (random (_bPosCount max 1));
	};
	_createdGroup = createGroup [_side, true];
	for "_i" from 1 to _unitCount do {
		private _randomClass = selectRandom _unitPool;
		private _randomPos = selectRandom _usableBuildingPositions;
		private _posIndex = _usableBuildingPositions find _randomPos;
		_usableBuildingPositions deleteAt _posIndex;
		private _unit = _createdGroup createUnit [_randomClass, _randomPos, [], 0, "NONE"];
		_unit setSkill 0.1;
		_unit triggerDynamicSimulation false;
		_unit setPos _randomPos;
		doStop _unit;
	
	};
	if (_enableDynamicSimulation) then {
		_createdGroup enableDynamicSimulation true;
	};
};

_createdGroup;