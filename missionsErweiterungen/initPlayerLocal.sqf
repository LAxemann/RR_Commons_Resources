/* Sichtweiten Kram */
if (isNil "RR_commons_viewdistance") then {RR_commons_viewdistance = false};
if (isNil "RR_commons_viewDistance_min") then {RR_commons_viewDistance_min = viewDistance};
if (isNil "RR_commons_viewDistance_max") then {RR_commons_viewDistance_max = (viewDistance * 2)};
RR_commons_dynamicViewdistance_groundViewdistance = RR_commons_viewDistance_min;
RR_commons_dynamicViewdistance_airViewDistance    = RR_commons_viewDistance_max;
RR_commons_dynamicViewdistance_nextCheck    	  = 0;
if (isNil "RR_commons_dynamicViewdistance_heightThreshold") then {RR_commons_dynamicViewdistance_heightThreshold = 20};
RR_commons_dynamicViewdistance_overrideOVD = false;
RR_commons_dynamicViewdistance_keepRatio = true;
RR_commons_dynamicViewdistance_groundOVD = getObjectViewDistance param [0];
RR_commons_dynamicViewdistance_airOVD = getObjectViewDistance param [0];
RR_commons_dynamicViewdistance_firstTime = true;
if (RR_commons_viewdistance) then {
	private _vdActionID = player addAction["<t color='#FF0000'>Sichtweite</t>",RR_commons_dynamicViewDistance_fnc_openDialog,[],-99,false,false,"",''];
};



/* ACRE */
if (isNil "RR_commons_acre_babel_bluforLanguage") 	then {RR_commons_acre_babel_bluforLanguage = "BLUFOR-Sprache"};
if (isNil "RR_commons_acre_babel_redforLanguage") 	then {RR_commons_acre_babel_redforLanguage = "REDFOR-Sprache"};
if (isNil "RR_commons_acre_babel_greenforLanguage") then {RR_commons_acre_babel_greenforLanguage = "GREENFOR-Sprache"};
if (isNil "RR_commons_acre_babel_civilLanguage") 	then {RR_commons_acre_babel_civilLanguage = "ZIVIL-Sprache"};
call RR_commons_acre_fnc_babelSetup;
call RR_commons_acre_fnc_autoRadios;


/* Teleporter */
RR_commons_teleport_canTeleport  = true;
if (RR_commons_teleport) then {
	call RR_commons_teleport_fnc_addAction;
	
	[] spawn {
		waitUntil {!isNull player};
		if (RR_commons_teleportJIP && didJIP) then {
			call RR_commons_teleport_fnc_addActionJIP;
		};
	};
};


/* Init Blackscreen */
if (isNil "RR_commons_initBlackScreen_time") then {RR_commons_initBlackScreen_time = 12};
if (isNil "RR_commons_initBlackScreen_text") then {RR_commons_initBlackScreen_text = "Mission wird initialisiert"};
if (RR_commons_initBlackScreen) then {[] spawn RR_commons_initBlackScreen_fnc_initBlackScreen};


/* Artilleriecomputer */
if !(RR_commons_artilleryComp) then {
	enableEngineArtillery false; 
};


/* Zonerestriction */
if (isNil "RR_commons_zoneRestriction_warningTime") then {RR_commons_zoneRestriction_warningTime = 10};
if (isNil "RR_commons_zoneRestriction_mode") then {RR_commons_zoneRestriction_mode = 0};
if (isNil "RR_commons_zoneRestriction_text") then {RR_commons_zoneRestriction_text = "Achtung! Kehre in den Spielbereich zurÃ¼ck!"};
RR_commons_zoneRestriction_canBeWarned = true;
RR_commons_zoneRestriction_killTime = 0;
RR_commons_zoneRestriction_nextCheck = 0;
RR_commons_zoneRestriction_lastWarning = -3;
RR_commons_zoneRestriction_triggers 	= RR_commons_zoneRestriction_triggers   	apply {call compile _x};
RR_commons_zoneRestriction_excludeArray = RR_commons_zoneRestriction_excludeArray   apply {call compile _x};
RR_commons_lastVDChange = 0;


/* Anti Cheat */
if (isMultiplayer) then {
	[] spawn {
		private _randomTime = 8 + (random 20);
		waitUntil {sleep 0.5; time > _randomTime};
		call RR_commons_antiCheat_fnc_clientSendInfoToServer;
	};
};




/* Persistence */
if (RR_commons_persistence) then {
	if (isNil "RR_commons_persistence_customSaveFunction") then {RR_commons_persistence_customSaveFunction = ""};
	if (isNil "RR_commons_persistence_customLoadFunction") then {RR_commons_persistence_customLoadFunction = ""};
};

/* Master PFH */
[{
	/* Dyn. viewDistance */
	private _currentTime = time;
	if (RR_commons_viewdistance && {_currentTime >= RR_commons_dynamicViewdistance_nextCheck}) then {
		call RR_commons_dynamicViewdistance_fnc_handleTerrainGrid;
		RR_commons_dynamicViewdistance_nextCheck = _currentTime + 0.5;
	};
	
	/* zoneRestriction */
	if (RR_commons_zoneRestriction && {_currentTime >= RR_commons_zoneRestriction_nextCheck}) then {
		call RR_commons_zoneRestriction_fnc_main;
		RR_commons_zoneRestriction_nextCheck = _currentTime + 0.5;
	};
	clearRadio
}, 0] call CBA_fnc_addPerFrameHandler;



/* Briefingfunktion - prüft ob eine briefing Datei im Missionsroot vorhanden ist, Prüfung auf Inhalt momentan von BI noch nicht als Funktion integriert */
waitUntil {!(isNull Player)}; //könnte unnötig sein, da die initPlayerLocal bereits von Hause aus JIP kompatibel ist? Unsicher.

if (fileExists /briefing.sqf) then {

	"" call RR_commons_briefing_briefingCore;
	"" call RR_commons_briefing_briefingCredits;

} else {

	exitWith {};

};
