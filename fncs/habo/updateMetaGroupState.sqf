/*
*	Author: LAxemann
*
*	Desc: 
*   Updates the state of a metaGroup, including own and enemy assessment, requesting support etc.
*
*	Params:
*	0 - MetaGroup <INTEGER / STRING / ARRAY>
*
*	Returns:
*	nil
*
*	Examples: 
*   ["metaGroup1"] call RR_commons_habo_fnc_updateMetaGroupState;
*   [2] call RR_commons_habo_fnc_updateMetaGroupState;
* =================================================*/

#include "_macros.inc"

params ["_metaGroup"];
private _metaGroupArray = [_metaGroup] call FUNC(getMetaGroupArray);
private _supportingMetaGroups = [];

/* Check if metaGroup is of type Defender or both, proceed if so */
private _groupType = _metaGroupArray param [PARAM_metaGroupType];
if (_groupType in ["Defender","Both"]) then {
	private _supports = _metaGroupArray param [PARAM_supports];
	_supports params [
		"_supportsIncoming",
		"_supportsArray",
		"_nextSupportsCheck"
	];
	
	/* Check if support is required if no supports are currently incoming */
	if !(_supportsIncoming) then {
		private _combatInfo = [_metaGroupArray] call FUNC(getCombatInfoFromMetaGroup);
		private _combatInfoEnemy = [_metaGroupArray] call FUNC(getCombatInfoFromTargetsQuery);
		
		private _combatRating = [_combatInfo,_combatInfoEnemy] call FUNC(calculateCombatRating);
		
		private _combatRatingTracking = _metaGroupArray param [PARAM_combatRatingTracking];
		_combatRatingTracking params [
			"_lastCombatRatingCheck",
			"_lastCombatRating",
			"_howLongDangerous"
		];
		private _timeSinceLastCombatRatingCheck = time - _lastCombatRatingCheck;
		if (_lastCombatRating < 0) then {
			_howLongDangerous = _howLongDangerous + _timeSinceLastCombatRatingCheck;
			if (_howLongDangerous >= 10) then {
				_supportingMetaGroups = [_metaGroup,_combatInfoEnemy,_combatRating] call FUNC(requestSupport);
			};
		} else {
			_howLongDangerous = 0;
		};		
		if ((count _supportingMetaGroups) > 0) then {
			_supportsIncoming = true;
			_metaGroupArray set [PARAM_supports,[true,_supportingMetaGroups,time + GVAR(supportsCheckInterval)]];
			_metaGroupArray set [PARAM_available,false];
			if (GVAR(debug)) then {[format ["%1 requested help from %2",str _metaGroup,str _supportingMetaGroups],10] spawn RR_commons_core_fnc_infoText};
		};
		_metaGroupArray set [PARAM_combatRatingTracking,[time,_combatRating,_howLongDangerous]];
	} else {
		if (time >= _nextSupportsCheck) then {
			private _maxSupportGroups = _metaGroupArray param [PARAM_maxSupportGroups];
			private _combinedCombatInfo = [_metaGroupArray,_supportsArray] call FUNC(getCombatInfoFromMetaGroup);
			private _combatInfoEnemy = [_metaGroupArray] call FUNC(getCombatInfoFromTargetsQuery);
			private _combinedCombatRating = [_combinedCombatInfo,_combatInfoEnemy] call FUNC(calculateCombatRating);
			private _newSupports = [];
			if (_combinedCombatRating < 0 && {(count _supportsArray) < _maxSupportGroups}) then {
				_newSupports = [_metaGroup,_combatInfoEnemy,_combinedCombatRating,_supportsArray] call FUNC(requestSupport);
			};
			_metaGroupArray set [PARAM_supports,[true,_supportsArray + _newSupports,time + GVAR(supportsCheckInterval)]];
		};	
	};
};

nil;
