/*
*	Author: LAxemann
*
*	Desc: 
*   Goes through available supporting metaGroups, weighs them against enemy forces, then weighs them again together with the requesting forces
*
*	Params:
*	0 - Requesting MetaGroup <INTEGER / STRING / ARRAY>
*	1 - Enemy combat Info <ARRAY> 
*
*	Returns:
*	0 - MetaGroups selected to provide support <ARRAY>
*
*	Examples: 
*   ["metaGroup1",EnemyCombatInfo] call RR_commons_habo_fnc_requestSupport;
* =================================================*/

#include "_macros.inc"

params ["_requesterMetaGroup","_combatInfoEnemy","_requesterCombatRating",["_alreadySupportingMetaGroups",[]]];
private _fittingSupportsFound = false;

private _requesterMetaGroupArray = [_requesterMetaGroup] call FUNC(getMetaGroupArray);
private _requesterMetaGroupSide = _requesterMetaGroupArray param [PARAM_side];

private _combinedCombatRatingTarget = (abs _requesterCombatRating) * 0.1;
if (GVAR(debug)) then {hint format ["Rating Target:\n%1",_combinedCombatRatingTarget]};

private _validMetaGroups = [];
private _combinedCombatRatings = [];
{
	_currentMetaGroupArray = _x;
	_currentMetaGroupType = _currentMetaGroupArray param [PARAM_metaGroupType];
	_currentMetaGroupType = toLower _currentMetaGroupType;
	_currentMetaGroupSide = _currentMetaGroupArray param [PARAM_side];
	_currentMetaGroupAvailable = _currentMetaGroupArray param [PARAM_available];
	if (_currentMetaGroupAvailable && {_currentMetaGroupType in ["support","both"]} && {_currentMetaGroupSide == _requesterMetaGroupSide} && {[_requesterMetaGroup,_forEachIndex] call FUNC(isMetaGroupInReach)}) then {
		_combinedCombatInfo = [_requesterMetaGroup,([_forEachIndex] + _alreadySupportingMetaGroups)] call FUNC(getCombatInfoFromMetaGroup);
		_combinedcombatRating = [_combinedCombatInfo,_combatInfoEnemy] call FUNC(calculateCombatRating);
	
		_validMetaGroups pushBack _forEachIndex;
		_combinedCombatRatings pushBack _combinedcombatRating;
	};
} forEach GVAR(metaGroups);


private _requestedMetaGroups = [];
private _fittingCombatRatings = [_combinedCombatRatingTarget,_combinedCombatRatings,_combinedCombatRatingTarget] call FUNC(getClosestElements);
if ((count _fittingCombatRatings) > 0) then {
	private _metaGroupIndex = ((_fittingCombatRatings select 0) select 1);
	private _currenttMetaGroup = _validMetaGroups param [_metaGroupIndex];
	_requestedMetaGroups pushBack _currenttMetaGroup;
	_fittingSupportsFound = true;
} else {
	private _lowerCombatRatings = [_combinedCombatRatingTarget,_combinedCombatRatings,nil,_combinedCombatRatingTarget] call FUNC(getClosestElements);
	{	
		_metaGroupIndex = _x param [1];
		private  _currenttMetaGroup = _validMetaGroups param [_metaGroupIndex];
		_requestedMetaGroups pushBack _currenttMetaGroup;
		private _combinedCombatInfo = [_requesterMetaGroup,_requestedMetaGroups + _alreadySupportingMetaGroups] call FUNC(getCombatInfoFromMetaGroup);
		private _combinedcombatRating = [_combinedCombatInfo,_combatInfoEnemy] call FUNC(calculateCombatRating);
		if (_combinedCombatRating >= _combinedCombatRatingTarget) exitWith {
			_fittingSupportsFound = true;
		};
	} forEach _lowerCombatRatings;
};
if (_fittingSupportsFound) then {
	[_requesterMetaGroup,_requestedMetaGroups] call FUNC(sendSupport);
	{
		private _currenttMetaGroup = _x;
		private _currenttMetaGroupArray = [_currenttMetaGroup] call FUNC(getMetaGroupArray);
		_currenttMetaGroupArray set [PARAM_available,false];
	} forEach _requestedMetaGroups;
	
	_requestedMetaGroups;
} else {
	[];
};
