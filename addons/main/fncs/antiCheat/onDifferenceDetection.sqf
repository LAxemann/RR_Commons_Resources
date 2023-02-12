/*
*	Author: LAxemann
*
*	Desc: 
*   Gibt einen Warnhint aus und beendet die Mission für den Spieler, der unerlaubte Mods mitgeladen hat.
*
*	Params:
*	0 - Network ID des Clients <INTEGER>
*	1 - Name des Spielers <STRING>
*	2 - Zu String konvertierter Array mit unerlaubten Mods <STRING>
*
*	Returns:
*	nil
*
*	Example: 
*   [_clientOwner,_playerName,_differenceAsString] remoteExec ["RR_commons_antiCheat_fnc_onDifferenceDetection",-2];
* =================================================*/

if (isServer) exitWith {};
params ["_clientOwner","_playerName","_differenceAsString"];
private _modArray = _differenceAsString splitString "|";
private _modString = "";
{
	_modString = _modString + _x + "\n";
} forEach _modArray;

// hint format ["!! ACHTUNG !!\n\nSpieler %1 hat folgende, unerlaubte Mods mitgeladen:\n%2",_playerName,_modString];
diag_log format["[Rudel Eye] Spieler %1 hat folgende, unerlaubte Mods mitgeladen:\n%2", _playerName, _modString];

// Auswirkung auf die mitladende Person
/*
if (_clientOwner == clientOwner) then {
	[0, "BLACK", 4, 1,""] spawn BIS_fnc_fadeEffect;
};
*/

nil;