/*
*	Author: LAxemann
*
*	Desc: 
*   Zeigt einen schwarzen Bildschirm mit Text an, setzt den Spieler als 
*	captive, verhindert Sound.
*
*	Params:
*	0 - Position
*
*	Returns:
*	Ob sich die Position in einem zu prüfenden Bereich befindet [BOOL]
*
*	Example: 
*   [getPos player] call RR_commons_dynamicViewdistance_fnc_checkForceList
* =================================================*/

/* Init stuff */
if (didJIP && !(RR_commons_initBlackScreen_allowForJIP)) exitWith {};
if ((!isMultiplayer) && (!RR_commons_initBlackScreen_allowForSP)) exitWith {};
private ["_fuel","_playerVehicle"];
waitUntil {time > 0};
private _wasCaptive = captive player;
private _preventFromFiringAction = player addAction ["", {},nil,0,false,true,"defaultAction"];
private _isInVehicle = (vehicle player == player);

if (_isInVehicle) then {
	_playerVehicle = (vehicle player);
	if (local _playerVehicle) then {
		_fuel = fuel _playerVehicle;
		_playerVehicle setFuel 0;
	};
} else {	
	player switchMove "HubSpectator_standu";
};

/* Set player captive, disable sound, display black text */
player setCaptive true;
[0] call acre_api_fnc_setGlobalVolume;
ace_hearing_disableVolumeUpdate = true; 
0 fadeSound 0;
cutText [RR_commons_initBlackScreen_text, "BLACK OUT",0.001];

sleep RR_commons_initBlackScreen_time;

/* Fade in, set values again */
cutText [RR_commons_initBlackScreen_text, "BLACK IN",5];

if (_isInVehicle) then {
	if (local _playerVehicle) then {
		_playerVehicle setFuel _fuel;
	};
} else {
	player switchMove "";
};

player removeAction _preventFromFiringAction;
if !(_wasCaptive) then {player setCaptive false};
[0] call acre_api_fnc_setGlobalVolume;
ace_hearing_disableVolumeUpdate = false;
5 fadeSound 1;