/*
*	Author: LAxemann
*
*	Desc: 
*   Erhält die Modliste eines Spielers als String, formatiert sie in einen Array und prüft sie gegen. 
*	Wendet weitere Schritte ein, falls ein Mismatch gefunden wurde.
*
*	Params:
*	0 - Network ID des Clients <INTEGER>
*	1 - Name des Spielers <STRING>
*	2 - ModListe des Clients als String <STRING>
*
*	Returns:
*	
*
*	Example: 
*   ["stringWithMods"] remoteExecCall ["RR_commons_antiCheat_fnc_serverReceiveStringFromClient",2];
* =================================================*/

params ["_clientOwner","_playerName","_clientPatchesCount",["_clientPatchesString",""]];
private _clientModArray = _clientMods splitString "|";
private _difference = [];

/* Erste Initialisierung */
if (isNil "RR_Commons_antiCheat_serverPatches") then {
	call RR_commons_antiCheat_fnc_initWhiteList;
	RR_Commons_antiCheat_serverPatches = "true" configClasses (configFile >> "CfgPatches") apply {configName _x};
	RR_Commons_antiCheat_serverPatches = RR_Commons_antiCheat_serverPatches - RR_commons_antiCheat_serverExclusivePatches;
	RR_Commons_antiCheat_serverPatchesCount = count RR_Commons_antiCheat_serverPatches;
	
	/* Server log */
	Diag_Log "Rudel Eye Server Initialisierung:";
	Diag_Log format ["Init: Server und Clients teilen sich %1 CfgPatches.",RR_Commons_antiCheat_serverPatchesCount];
};



/* Überprüfung */
// Phase 1
if (_clientPatchesString == "") then {
	if (_clientPatchesCount != RR_Commons_antiCheat_serverPatchesCount) then {
		Diag_Log format ["ACHTUNG: CfgPatches Mismatch. Spieler %1 lädt %2 Patches, Server lädt %3",_playerName,_clientPatchesCount,RR_Commons_antiCheat_serverPatchesCount];
		[true] remoteExecCall ["RR_Commons_antiCheat_fnc_clientSendInfoToServer"];
	};
} else {
	// Phase 2
	private _clientPatches = _clientPatchesString splitString "|";
	private _difference = [];
	{
		if !(_x in RR_Commons_antiCheat_serverPatches) then {
			_difference pushBack _x;
		};
	} forEach _clientPatches;
	private _differenceAsString = "";
	if ((count _difference) > 0) then {
		_differenceAsString = _difference joinString "|";
		Diag_Log format ["ACHTUNG: Spieler %1 lädt folgende unauthorisiserte Addons:",_playerName];
		{
			Diag_Log _x;
		} forEach _difference;
	};	
	[_clientOwner,_playerName,_differenceAsString] remoteExec ["RR_commons_antiCheat_fnc_onDifferenceDetection",-2];
};
