/*
*	Author: 
*	LAxemann
*
*	Desc.: 
*	Lässt eine Einheit/Seite das Zielobjekt beanspruchen. Setzt entsprechende Variablen und gibt einen Hint 
*	an andere Spieler aus.
*
*	Params:
*	0 - Zielobjekt <OBJEKT>
*	1 - Einheit <EINHEIT>
*
*	Returns:
*	Seite der Einheit <SIDE>
*
*	Example:
*	[OBJEKT,Einheit] call RR_commons_pvp_fnc_claimTargetObject;
*/

params [
	"_targetObject",
	"_claimer"
];
private _side 		= side _claimer;
private _defender   = (_side == (_targetObject getVariable ["RR_commons_pvp_defendingSide",sideEmpty]));
private _endTime 	= time + (_targetObject getVariable ["RR_commons_pvp_targetObjectDelay",0]);

/* Setze globale variablen für das Zielobjekt */
if (_defender) then {
	_targetObject setVariable ["RR_commons_pvp_activeSide",sideEmpty,true];
	_targetObject setVariable ["RR_commons_pvp_endTime",0,true];
} else {
	_targetObject setVariable ["RR_commons_pvp_activeSide",_side,true];
	_targetObject setVariable ["RR_commons_pvp_endTime",_endTime,true];
};


/* Gebe Meldung an alle Spieler aus */
private _sideColor  = [_side] call RR_commons_pvp_fnc_getSideColor;
private _sideName 	= _targetObject getVariable [format ["RR_commons_pvp_sideName_%1",_side],"Fehler: Kein Teamname definiert"];
private _targetObjectName = _targetObject getVariable ["RR_commons_pvp_targetObjectName","das Zielobjekt"];
private _hintString = "";
private _hintString = [
	format ["<t font='PuristaBold' size='1.6' color=%1>%2</t><br /><t font='PuristaBold' size='1.6'>hat %3 für sich beansprucht!</t>",str _sideColor,_sideName,_targetObjectName],
	format ["<t font='PuristaBold' size='1.6' color=%1>%2</t><br /><t font='PuristaBold' size='1.6'>hat den Timer von %3 gestoppt!</t>",str _sideColor,_sideName,_targetObjectName]
] select _defender;
[_hintString,7] remoteExec ["RR_commons_core_fnc_infoText",0];

_side;