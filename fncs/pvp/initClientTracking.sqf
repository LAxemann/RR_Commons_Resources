/*
*	Author: 
*	LAxemann
*
*	Desc.: 
*	Initialisiert das Clienttracking und den PFH
*
*	Params:
*	None
*
*	Returns:
*	nil
*
*	Example:
*	call RR_commons_pvp_fnc_initClientTracking;
*/

if !(isNil "RR_commons_pvp_clientTrackingInitialized") exitWith {};
RR_commons_pvp_clientTrackingInitialized = true;
RR_commons_pvp_clientTrackingLastString = "";

/* Füge den perFrameHandler hinzu */
[] spawn {
	waitUntil {sleep 0.5; time > 0};
	RR_commons_pvp_clientTrackingPFH = [{
		call RR_commons_pvp_fnc_clientTracking;
	}, 1, []] call CBA_fnc_addPerFrameHandler;
};

nil;