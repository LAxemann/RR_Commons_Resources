/*
*	Author: LAxemann
*
*	Desc: 
*   Initializes HABO variables and creates the perFrameHandler
*
*	Params:
*	None
*
*	Returns:
*	nil
*
*	Examples: 
*   call GVAR(fnc_init;
* =================================================*/

#include "_macros.inc"

/* CBA dependency */
private _isCBARunning = (isClass (configFile >> "CfgPatches" >> "cba_main"));
private _fnc_addPerFrameHandler = if (_isCBARunning) then {CBA_fnc_addPerFrameHandler} else {LIB_Core_fnc_addPerFrameHandler};
private _fnc_createNameSpace = if (_isCBARunning) then {CBA_fnc_createNameSpace} else {OCFUNC(CORE,createNameSpace)};

GVAR(weaponNameSpace) = call _fnc_createNameSpace;
GVAR(metaGroups) = [];
GVAR(currentCheckIndex) = 0;
GVAR(checkGroupCount) = 0;
GVAR(nextCheck) = 0;
GVAR(checkInterval) = 2;
GVAR(supportsCheckInterval) = 10;
GVAR(isChecking) = false;

if (isNil (format ["%1_habo_debug",PREFIXQUOTED])) then {
	GVAR(debug) = false;
};

GVAR(pfh) = [
	{
		call FUNC(mainRoutine);
	}, 0, []
] call _fnc_addPerFrameHandler;

GVAR(lambsEnabled) = (isClass(configfile >> "CfgPatches" >> "lambs_main"));

nil;