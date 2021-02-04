/*
*	Author: LAxemann
*
*	Desc: 
*   Main routine, checks state of metaGroups in defined interval.
*	Waits for a specific time to pass, then goes through all current metaGroups (one per Frame)
*
*	Params:
*	None
*
*	Returns:
*	nil
*
*	Examples: 
*   call GVAR(fnc_mainRoutine;
* =================================================*/

#include "_macros.inc"

if (time >= GVAR(nextCheck)) then {
	if !(GVAR(isChecking)) then {
		GVAR(isChecking) = true;
		GVAR(checkGroupCount) = count GVAR(metaGroups);
		GVAR(currentCheckIndex) = 0;
	};
	[GVAR(currentCheckIndex)] call FUNC(updateMetaGroupState);
	if (GVAR(currentCheckIndex) == (GVAR(checkGroupCount) - 1)) then {
		GVAR(isChecking) = false;
		GVAR(nextCheck) = time + GVAR(checkInterval);
	} else {
		GVAR(currentCheckIndex) = GVAR(currentCheckIndex) + 1;
	};
};

nil;