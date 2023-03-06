/*
*	Author: 
*	LAxemann
*
*	Desc.: 
*	Setzt ein Objekt als PvP-Zielobjekt. Attached Aktionen via addAction.
*
*	Params:
*	0 - Zielobjekt <OBJECT>
*	1 - Radius, in welchem sich Spieler aufhalten müssen <Number>
*	2 - Timer-Zeit <Number>
*	3 - Eigener Text zum Auslösen des Timers <STRING> [Optional]
*	4 - Verteidigende Seite (Wenn hier eine Seite gesetzt werden, können nur andere Seiten die Aktion auslösen) [Optional]
*	5 - Eigene Seitennamen, Format [[west,"Team Blau"],[east,"Team Buxtehude"]...[civilian,"Team Drei"]] <ARRAY>
*
*	Returns:
*	nil
*
*	Example:
*	[RR_mission_laptop,20,133] call RR_commons_pvp_fnc_initTargetObject;
*
*	Example 2:
*	[
*		RR_mission_laptop,		// Zielobjekt
*		20,						// Radius
*		133,					// Timer
*		"Bombe scharfmachen",	// Eigener Text für die Aktion
*		west,					// Verteidigende Seite
*		[[west,"Team Blau"],[east,"Team Buxtehude"]]  // Eigene Seitennamen
*	] call RR_commons_pvp_fnc_initTargetObject;
*/

params [
	"_targetObject",
	"_radius",
	"_delay",
	["_customActionText","Zielobjekt beanspruchen"],
	["_defendingSide",sideEmpty], 
	["_sideTextArray",[[west,"Team Blau"],[east,"Team Rot"],[resistance,"Team Grün"],[civilian,"Team Lila"]]]
];


/* Falls nicht vorhanden, erstelle einen Array mit allen Zielobjekten und pushe das aktuelle Objekt rein */
if (isNil "RR_commons_pvp_targetObjects") then {
	RR_commons_pvp_targetObjects = [];
	if (isNil "RR_commons_pvp_westWins") 		then {RR_commons_pvp_westWins = 0};
	if (isNil "RR_commons_pvp_eastWins") 		then {RR_commons_pvp_eastWins = 0};
	if (isNil "RR_commons_pvp_resistanceWins") 	then {RR_commons_pvp_resistanceWins = 0};
	if (isNil "RR_commons_pvp_civilianWins") 	then {RR_commons_pvp_civilianWins = 0};
};
RR_commons_pvp_targetObjects pushBackUnique _targetObject;


/* Weise dem Objekt Variablen zu */
_targetObject setVariable ["RR_commons_pvp_targetObjectDelay",_delay];
_targetObject setVariable ["RR_commons_pvp_targetObjectRadius",_radius];
_targetObject setVariable ["RR_commons_pvp_defendingSide",_defendingSide];
if ((_targetObject getVariable ["RR_commons_pvp_targetObjectName",""]) == "") then {
	_targetObject setVariable ["RR_commons_pvp_targetObjectName",format ["Zielobjekt %1",count RR_commons_pvp_targetObjects]];
};


/* Greife selbstdefinierte Seitennamen ab */
private _allSides = [west,east,resistance,civilian];
{
	_x params ["_side","_text"];
	_allSides = _allSides - [_side];
	_targetObject setVariable [format ["RR_commons_pvp_sideName_%1",_side],_text]

} forEach _sideTextArray;
/* Ergänze, falls nötig, durch die standard-Teamnamen */
{
	private _side = _x;
	private _text = switch (_side) do {
		case west: { "Team Blau" };
		case east: { "Team Rot" };
		case resistance: { "Team Grün" };
		case civilian: { "Team Lila" };
	};
	_targetObject setVariable [format ["RR_commons_pvp_sideName_%1",_side],_text]
} forEach _allSides;


/* Client Init */
if (hasInterface) then {
	call RR_commons_pvp_fnc_initClientTracking;
	private _targetObjectAction = _targetObject addAction [
		_customActionText, 
		{
			params ["_target", "_caller", "_actionId", "_arguments"];
			[_target,_caller] call RR_commons_pvp_fnc_claimTargetObject;
		},
		[],
		10, 
		true, 
		true, 
		"",
		"
			(side _this) != (_originalTarget getVariable ['RR_commons_pvp_activeSide',sideEmpty]) &&
			{(side _this) != (_originalTarget getVariable ['RR_commons_pvp_defendingSide',sideEmpty])}
		",
		5
	];
	private _targetObjectDefenderAction = _targetObject addAction [
		"Timer stoppen", 
		{
			params ["_target", "_caller", "_actionId", "_arguments"];
			[_target,_caller] call RR_commons_pvp_fnc_claimTargetObject;
		},
		[],
		10, 
		true, 
		true, 
		"",
		"
			((_originalTarget getVariable ['RR_commons_pvp_activeSide',sideEmpty]) != sideEmpty) &&
			{(side _this) == (_originalTarget getVariable ['RR_commons_pvp_defendingSide',sideEmpty])}
		",
		5
	];	

};


/* Server Init */
if (isServer) then {
	call RR_commons_pvp_fnc_serverLoopInit;
};
