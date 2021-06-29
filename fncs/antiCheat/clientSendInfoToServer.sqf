/*
*	Author: LAxemann
*
*	Desc: 
*   Schickt die lokale Modliste an den Server
*
*	Params:
*	0 - Sende die Patches mit <BOOL> (Optional, default false)
*
*	Returns:
*	nil
*
*	Example: 
*   call RR_commons_antiCheat_fnc_clientSendStringToServer
* =================================================*/
params [["_sendPatches",false]];
call RR_commons_antiCheat_fnc_initWhiteList;

/* Errechne die Zahl der mitgeladenen cfgPatches */
private _clientPatches = "true" configClasses (configFile >> "CfgPatches") apply {configName _x};
_clientPatches = _clientPatches - RR_commons_antiCheat_clientPatchesWhitelist;
private _clientPatchesCount = count _clientPatches;

/* Falls vom Server gefordert, wandle die Patches in einen String um */
_clientPatchesString = "";
if (_sendPatches) then {
	_clientPatchesString = _clientPatches joinString "|";
};

[clientOwner,profileName,_clientPatchesCount,_clientPatchesString] remoteExecCall ["RR_commons_antiCheat_fnc_serverReceiveStringFromClient",2];

nil;