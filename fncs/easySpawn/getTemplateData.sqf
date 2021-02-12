/*
*	Author: 
*	LAxemann
*
*	Desc.: 
*
*	Params:
*
*	Returns:
*
*/

/* Wir finden den gespeicherten, zum Template-Namen passenden Index */
params ["_templateName",["_showError",true]];
private _templateIndex = missionNameSpace getVariable [(format ["RR_commons_easySpawn_templateIndex_%1",_templateName]),-1];
if (_templateIndex == -1) exitWith {
	if (_showError) then {
		["Easyspawn Template namens %1 nicht gefunden!",str _templateName] call BIS_fnc_error;
	};
};


private _templateData = RR_commons_easySpawn_templateArray param [_templateIndex,[]];

_templateData;