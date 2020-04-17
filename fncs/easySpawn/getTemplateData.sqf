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
params ["_templateName"];
private _templateIndex = missionNameSpace getVariable [(format ["RR_commons_easySpawn_templateIndex_%1",_templateName]),-1];
if (_templateIndex == -1) exitWith {hint format ["Easyspawn template %1 not found in cache!",_templateName]};


private _templateData = RR_commons_easySpawn_templateArray param [_templateIndex,[]];

_templateData;