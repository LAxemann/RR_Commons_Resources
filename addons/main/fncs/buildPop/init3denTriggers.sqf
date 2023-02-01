if !(isNil "RR_commons_buildPop_3denTriggers") then {
	{
		private _trigger = _x;
		private _side = _trigger getVariable ["RR_commons_buildPop_3denSide",EAST];
		private _unitPool = _trigger getVariable ["RR_commons_buildPop_3denUnitPool",["O_Soldier_F"]];
		private _unitCount = _trigger getVariable ["RR_commons_buildPop_3denUnitCount",0];
		private _dynamicSumulationEnabled = _trigger getVariable ["RR_commons_buildPop_3denDynamicSimulation",true];
		private _blackList = _trigger getVariable ["RR_commons_buildPop_3denBlacklist",[]];
		private _code = _trigger getVariable ["RR_commons_buildPop_3denCode",""];
		
		[_trigger,_side,_unitPool,_unitCount,_dynamicSumulationEnabled,_blackList,_code] call RR_commons_buildPop_fnc_initBuildPopTrigger;
	} forEach RR_commons_buildPop_3denTriggers;
};