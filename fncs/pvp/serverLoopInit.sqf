/*
*	Author: 
*	LAxemann
*
*	Desc.: 
*	Initialisiert den Serverloop und den PFH
*
*	Params:
*	None
*
*	Returns:
*	nil
*
*	Example:
*	call RR_commons_pvp_fnc_initServerLoop;
*/

if !(isNil "RR_commons_pvp_serverLoopInitialized") exitWith {};
RR_commons_pvp_serverLoopInitialized = true;

[] spawn {
	waitUntil {sleep 0.5; time > 0};
	RR_commons_pvp_serverLoopPFH = [{
		call RR_commons_pvp_fnc_serverLoop;
	}, 1, []] call CBA_fnc_addPerFrameHandler;
};