/*
*	Author: LAxemann
*
*	Desc: 
*   Schickt entweder die Anzahl der geladenen Patches oder einen String der
*	geladenen Patches an den Server.
*
*	Params:
*	0 - Sende die Patches als String mit <BOOL> (Optional, default false)
*
*	Returns:
*	nil
*
*	Example: 
*   [True] call RR_commons_antiCheat_fnc_clientSendInfoToServer
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