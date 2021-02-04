/*
*	Author: LAxemann
*
*	Desc: 
*   Registers a group or an array of groups into the system as part of a metagroup.
*	Creates a metagroup if a metaGroup of the same name does not already exist.
*
*	Params:
*	0 - Group or array of groups <GROUP / ARRAY>
*	1 - metaGroup name <STRING>
*	2 - metaGroup type, default "Both" <STRING> [Optional]
*
*	Returns:
*	0 - Array of indizes of added groups in RR_commons_habo_metaGroups
*
*	Examples: 
*   [myGroup,"metaGroup1","Defender"] call RR_commons_habo_fnc_registerMetaGroup;
*   [[myGroup,mySecondGroup],"metaGroup1","Defender"] call RR_commons_habo_fnc_registerMetaGroup;
* =================================================*/

#include "_macros.inc"

if !(isServer) exitWith {};

params [
	"_inputData",
	"_metaGroupID",
	["_groupType","Both"]
];

if !(isServer) exitWith {["RR_commons_habo_fnc_registerGroups darf nur auf dem Server ausgeführt werden!",nil] call BIS_fnc_error};
if !(_groupType in ["Defender","Support","Both"]) exitWith {["Gruppentyp ''%1'' existiert nicht. Verfügbare Typen: ''Defender'', ''Support'', ''Both''",_groupType] call BIS_fnc_error};
if (isNil "RR_commons_habo_metaGroups") then {
	call FUNC(init);
};


private _checkArray = [[_inputData],_inputData] select (_inputData isEqualType []);
private _groupsToAdd = [];
{
	if (_x isEqualType grpNull) then {
		_groupsToAdd pushBackUnique _x;
	} else {
		if (_x isEqualType objNull) then {
			_groupsToAdd pushBackUnique (group _x) ;
		} else {
			["Ein Element für die Gruppe %1 ist weder vom Typ ''Gruppe'' noch ''Einheit''. MetaGruppe %1 wurde nicht erstellt!",_metaGroupID] call BIS_fnc_error;
		};
	};
} forEach _checkArray;

private _side = side (_groupsToAdd param [0]);

private _index = [_metaGroupID] call FUNC(getMetaGroupIndex);
if (_index == -1) then {
	GVAR(metaGroups) pushBack [
		_metaGroupID,	// PARAM_metaGroupID
		_groupType,		// PARAM_metaGroupType
		_side,			// PARAM_side
		[],				// PARAM_groups
		[],				// PARAM_combatInfo
		[],				// PARAM_enemyAssessment
		[0,0,0],		// PARAM_combatRatingTracking
		[false,[],0],	// PARAM_supports
		true			// PARAM_available
	];
};

private _returnIndexArray = [];
{
	private _returnIndex = [_x,_metaGroupID] call FUNC(addGroupToMetaGroup);
	_returnIndexArray pushBack _returnIndex;
} forEach _groupsToAdd;

_returnIndexArray;
