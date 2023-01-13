/*
*	Author: 
*	LAxemann
*
*	Desc.: 
*	Zuständig für den Hint in der rechten oberen Ecke. Zeigt den Status der Zielobjekte an.
*	Zu verwenden via PFEH
*
*	Params:
*	None
*
*	Returns:
*	nil
*
*	Example:
*	call RR_commons_pvp_fnc_clientTracking;
*/

private _masterString = "";
{
	private _targetObject = _x;
	
	private _winnerSide   = _targetObject getVariable ["RR_commons_pvp_winner",sideEmpty];
	if (_winnerSide == sideEmpty) then {
		private _endTime = _targetObject getVariable ["RR_commons_pvp_endTime",0];
		if (_endtime > 0) then {
			private _remainingTime 		= [(-(time - _endTime)) max 0, "HH:MM:SS"] call BIS_fnc_secondsToString;
			private _side 				= _targetObject getVariable ["RR_commons_pvp_activeSide",sideEmpty];
			private _sideColor  		= [_side] call RR_commons_pvp_fnc_getSideColor;
			private _sideName 			= _targetObject getVariable [format ["RR_commons_pvp_sideName_%1",_side],"Fehler: Kein Teamname definiert"];
			private _targetObjectName 	= _targetObject getVariable ["RR_commons_pvp_targetObjectName","das Zielobjekt"];
		
			
			private _string = (format ["<t font='PuristaBold' size='1.4' aling='center' >%1</t><br />Beansprucht von <t color=%2>%3</t><br />Verbleibende Zeit: %4<br /><br /><br />",_targetObjectName,str _sideColor,_sideName,_remainingTime]);
			_masterString = _masterString + _string;
		};
	} else {
		private _side 				= _targetObject getVariable ["RR_commons_pvp_activeSide",sideEmpty];
		private _sideColor  		= [_side] call RR_commons_pvp_fnc_getSideColor;
		private _sideName 			= _targetObject getVariable [format ["RR_commons_pvp_sideName_%1",_side],"Fehler: Kein Teamname definiert"];
		private _targetObjectName 	= _targetObject getVariable ["RR_commons_pvp_targetObjectName","das Zielobjekt"];
		private _string = (format ["<t font='PuristaBold' size='1.4' aling='center' >%1</t><br /><t color='#ffcc00'>Gewonnen</t> von <t color=%2>%3</t><br />",_targetObjectName,str _sideColor,_sideName]);
		_masterString = _masterString + _string;
	};
} forEach RR_commons_pvp_targetObjects;

/* Leere die Hintbox */
if ((_masterString == "") && {RR_commons_pvp_clientTrackingLastString != ""}) then {
	hintSilent "";
};

if (_masterString != "") then {
	hintSilent parseText _masterString;
};
RR_commons_pvp_clientTrackingLastString = _masterString;

nil;
