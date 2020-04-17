/*
*	Author: 
*	LAxemann
*
*	Desc.: 
*	Routine für den Server. Setzt vor Allem den Status zurück, wenn Spieler tot oder im ACE-Herzstillstand sind.
*	Setzt zudem Sieges-Variablen.
*	Auszuführen via PFEH.
*
*	Params:
*	None
*
*	Returns:
*	nil
*
*	Example:
*	call RR_commons_pvp_fnc_serverLoop;
*/

{
	private _targetObject = _x;
	
	private _side 		  = _targetObject getVariable ["RR_commons_pvp_activeSide",sideEmpty];
	private _winnerSide   = _targetObject getVariable ["RR_commons_pvp_winner",sideEmpty];
	if (_winnerSide == sideEmpty) then {
		if (_side != sideEmpty) then {
			
			/* Checke, ob sich Einheiten im gewünschten Radius befinden... */
			private _radius  = _targetObject getVariable ["RR_commons_pvp_targetObjectRadius",_radius];
			private _endTime = _targetObject getVariable ["RR_commons_pvp_endTime",0];
			private _playersInRadius = ({
				((_x distance _targetObject) <= _radius) &&
				((side _x) == _side) &&
				{!(_x getVariable ["ace_medical_incardiacarrest",false])} &&
				{!(_x getVariable ["ace_isunconscious",false])}
			} count allPlayers) > 0;
			if !(_playersInRadius) then {
				/* ...wenn nein, setze die Werte zurück */
				_targetObject setVariable ["RR_commons_pvp_endTime",0,true];
				_targetObject setVariable ["RR_commons_pvp_activeSide",_sideEmpty,true];
				private _targetObjectName = _targetObject getVariable ["RR_commons_pvp_targetObjectName","das Zielobjekt"];		
				private _hintString = (format ["<t font='PuristaBold' size='1.6' aling='center' >%1</t><br />ist wieder frei!<t/>",_targetObjectName]);
				[_hintString,15] remoteExec ["RR_commons_core_fnc_infoText",0];		
			} else {
				/* Wenn ja, dann checke, ob der Countdown abgelaufen ist. */
				if (time >= _endTime) then {
					_targetObject setVariable ["RR_commons_pvp_winner",_side,true];
					private _sideColor  = [_side] call RR_commons_pvp_fnc_getSideColor;
					private _sideName 	= _targetObject getVariable [format ["RR_commons_pvp_sideName_%1",_side],"Fehler: Kein Teamname definiert"];
					private _targetObjectName = _targetObject getVariable ["RR_commons_pvp_targetObjectName","das Zielobjekt"];			
					private _hintString = (format ["<t font='PuristaBold' size='1.6' aling='center' >%1</t><br />wurde von <t color=%2>%3</t> <t color='#ffcc00'>gewonnen<t/>!",_targetObjectName,str _sideColor,_sideName]);
					[_hintString,15] remoteExec ["RR_commons_core_fnc_infoText",0];	
					/* Setze die Siegesvariable */
					switch (_side) do {
						case west: {RR_commons_pvp_westWins = RR_commons_pvp_westWins + 1; publicVariable "RR_commons_pvp_westWins"};
						case east: {RR_commons_pvp_eastWins = RR_commons_pvp_eastWins + 1; publicVariable "RR_commons_pvp_eastWins"};
						case resistance: {RR_commons_pvp_resistanceWins = RR_commons_pvp_resistanceWins + 1; publicVariable "RR_commons_pvp_resistanceWins"};
						case civilian: {RR_commons_pvp_civilianWins = RR_commons_pvp_civilianWins + 1; publicVariable "RR_commons_pvp_civilianWins"};
					};
				};
			};
		};
	};
} forEach RR_commons_pvp_targetObjects;

nil;

