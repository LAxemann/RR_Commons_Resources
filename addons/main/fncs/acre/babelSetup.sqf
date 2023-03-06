/*
*	Author: LAxemann
*
*	Desc: 
*   Sofern Babel aktiviert ist, vergibt das Script die definierten Sprachen an Spieler.
*	Config via Editor.
*
*	Params:
*	None
*
*	Returns:
*	Nil
*
*	Example: 
*   call RR_commons_acre_fnc_babelSetup
* =================================================*/

if !(RR_commons_acre_babel) exitWith {};

/* Definiert die Standardsprachen */
["BF",RR_commons_acre_babel_bluforLanguage] 	call acre_api_fnc_babelAddLanguageType;
["RF",RR_commons_acre_babel_redforLanguage] 	call acre_api_fnc_babelAddLanguageType;
["GF",RR_commons_acre_babel_greenforLanguage] 	call acre_api_fnc_babelAddLanguageType;
["CV",RR_commons_acre_babel_civilLanguage] 		call acre_api_fnc_babelAddLanguageType;
RR_commons_acre_languagesBLUFOR   = ["BF"];
RR_commons_acre_languagesREDFOR   = ["RF"];
RR_commons_acre_languagesGREENFOR = ["GF"]; // <- GREENFOR können also ihre eigene und die Zivilsprache
RR_commons_acre_languagesCivs 	  = ["CV"];

private _side = side player;

/* Vergebe die Standardsprachen an Spieler */
RR_commons_spokenLanguages = switch (_side) do {
	case west: {
		RR_commons_acre_languagesBLUFOR;
	};
	case east: {
		RR_commons_acre_languagesREDFOR;
	};
	case resistance: {
		RR_commons_acre_languagesGREENFOR;
	};
	case civilian: {
		RR_commons_acre_languagesCivs;
	};
};

/* Checke, ob der Spieler Übersetzer ist */
private _bfTranslators = RR_commons_feature_acre_babel_bluforLanguageTranslators   apply {call compile _x};
private _rfTranslators = RR_commons_feature_acre_babel_redforLanguageTranslators   apply {call compile _x};
private _gfTranslators = RR_commons_feature_acre_babel_greenforLanguageTranslators apply {call compile _x};
private _cvTranslators = RR_commons_feature_acre_babel_civilLanguageTranslators    apply {call compile _x};
{
	_x params ["_unitArray","_language"];
	if (player in _unitArray) then {
		RR_commons_spokenLanguages pushBackUnique _language;
	};
} forEach [[_bfTranslators,"BF"],[_rfTranslators,"RF"],[_gfTranslators,"GF"],[_cvTranslators,"CV"]];

/* Weise die Sprachen zu */
RR_commons_spokenLanguages call acre_api_fnc_babelSetSpokenLanguages;

nil;
