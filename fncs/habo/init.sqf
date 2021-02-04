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

GVAR(weaponNameSpace) = call CBA_fnc_createNamespace;
GVAR(metaGroups) = [];
GVAR(currentCheckIndex) = 0;
GVAR(checkGroupCount) = 0;
GVAR(nextCheck) = 0;
GVAR(checkInterval) = 2;
GVAR(supportsCheckInterval) = 10;
GVAR(isChecking) = false;

if (isNil "GVAR(debug") then {
	GVAR(debug) = false;
};

GVAR(pfh) = [
	{
		call FUNC(mainRoutine);
	}, 0, []
] call CBA_fnc_addPerFrameHandler;

nil;