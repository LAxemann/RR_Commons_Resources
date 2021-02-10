/*
*	Author: LAxemann
*
*	Desc: 
*   Gives each group within a supporting metaGroup a SAD waypoint on a random enemie's position, based on the
*	requesting group's targetsQuery
*
*	Params:
*	0 - Requesting MetaGroup <INTEGER / STRING / ARRAY>
*	1 - Supporting MetaGroups <ARRAY> 
*
*	Returns:
*	nil
*
*	Examples: 
*   ["metaGroup1",["anotherMetaGroup","yetAnotherMetaGroup"]] call RR_commons_habo_fnc_sendSupport;
* =================================================*/

#include "_macros.inc"

params ["_requesterMetaGroup","_summarizedMetaGroups"];
private _requesterMetaGroupArray = [_requesterMetaGroup] call FUNC(getMetaGroupArray);
private _groups = _requesterMetaGroupArray param [PARAM_groups];

private _knownEnemies = [];
private _requesterGroupLeader = objNull;

{
	private _leader = (leader _x);
	_requesterGroupLeader = (leader _x);
	private _targetsQuery = _leader targetsQuery [objNull, sideEnemy, "", [], 0];
	{
		private _object = _x param [1];
		_knownEnemies pushBack _object;
	} forEach _targetsQuery;
} forEach _groups;


private _allSupporterGroups = [];
{
	private _currentMetaGroupArray = [_x] call FUNC(getMetagroupArray);
	private _currentGroups = _currentMetaGroupArray param [PARAM_groups];
	{	
		private _currentGroup = _x;
		_currentGroup enableDynamicSimulation false;
		_currentGroup setVariable ["lambs_danger_disableGroupAI",true];
		private _randomTargetPos = [0,0,0];
		if ((count _knownEnemies) > 0) then {
			_randomTargetPos = getPos (selectRandom _knownEnemies);
		} else {
			_randomTargetPos = getPos _requesterGroupLeader;
		};
		private _currentLeader = leader _currentGroup;
		{
			_x doFollow _currentLeader;
		} forEach (units _currentGroup);
		if ((_currentLeader distance _randomTargetPos) < 150) then {
			{
				private _unit = _x;
				private _assignedVehicleRole = assignedVehicleRole _unit;
				if (count _assignedVehicleRole == 0) then {
					_assignedVehicleRole = "";
				} else {
					_assignedVehicleRole = _assignedVehicleRole param [0];
				};
				if (_assignedVehicleRole != "cargo") then {
					[_unit] orderGetIn true;
				};
				_x doFollow _currentLeader;
			} forEach (units _currentGroup);
		};
		
		
		_currentGroup setBehaviour "SAFE";
		_currentGroup setSpeedMode "FULL";
		
		private _waypoint = _currentGroup addWaypoint [_randomTargetPos, 0];
		_waypoint setWaypointType "MOVE";
		_currentGroup setCurrentWaypoint _waypoint;
		[_currentGroup,_randomTargetPos] spawn {
			params ["_currentGroup","_randomTargetPos"];
			sleep 10;
			private _waypoint = _currentGroup addWaypoint [_randomTargetPos, 0];
			_waypoint setWaypointType "MOVE";
			_currentGroup setCurrentWaypoint _waypoint;
		};
		//(units _currentGroup) doMove _randomTargetPos;
	} forEach _currentGroups;
} forEach _summarizedMetaGroups;

nil;