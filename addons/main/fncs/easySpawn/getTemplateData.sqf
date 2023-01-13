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

#include "_macros.inc"

/* Wir finden den gespeicherten, zum Template-Namen passenden Index */
params ["_templateName",["_showError",true]];
private _templateIndex = missionNameSpace getVariable [(format ["%1_easySpawn_templateIndex_%2",PREFIXQUOTED,_templateName]),-1];
if (_templateIndex == -1) exitWith {
	if (_showError) then {
		["Easyspawn Template namens %1 nicht gefunden!",str _templateName] call BIS_fnc_error;
	};
};

private _templateData = GVAR(templateArray) param [_templateIndex,[]];

_templateData;