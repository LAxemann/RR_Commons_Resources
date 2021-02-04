/*
*	Author: LAxemann
*
*	Desc: 
*   Returns a metaGroup's array (same as {RR_commons_habo_metaGroups select _x})
*
*	Params:
*	0 - MetaGroup index, name or array <INTEGER / STRING / Array>
*
*	Returns:
*	0 - true if success, false if failure <BOOL>
*
*	Examples: 
*   ["metaGroup1"] call RR_commons_habo_fnc_setMetaGroupType;
*   [1] call RR_commons_habo_fnc_setMetaGroupType;
* =================================================*/

#include "_macros.inc"

if !(isServer) exitWith {["RR_commons_habo_fnc_setMetaGroupType darf nur auf dem Server ausgeführt werden!",nil] call BIS_fnc_error};

params ["_metaGroup","_type"];
if !(_type in ["Defender","Support","Both"]) exitWith {
	["Gruppentyp ''%1'' existiert nicht. Verfügbare Typen: ''Defender'', ''Support'', ''Both''",_type] call BIS_fnc_error;
	false
};
private _metaGroupArray = [_metaGroup] call FUNC(getMetaGroupArray);
_metaGroupArray set [PARAM_metaGroupType,_type];

true;