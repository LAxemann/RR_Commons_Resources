/*
 * Author: joko // Jonas // Slight modification(s) by LAxemann
 * Read Value from config and save it in the cache Location and read and save the value if the value does not exist
 * if config entry not exist return the Default Value
 *
 * Arguments:
 * 0: Config Path or Array with Config Path <Config, Array>
 * 1: Variable Name for Saving <String>
 * 2: Default Return <Any> (Default: "")
 *
 * Return Value:
 * Cached Value <Any>
 *
 * Example:
 * ["example"] call RR_commons_habo_fnc_readCacheValue;
 */
 
#include "_macros.inc"
 
params [["_config", configNull, [configNull, []]], ["_varName", "", [""]], ["_default", ""]];
if (_varName isEqualTo "") exitWith { _default };

private _var = GVAR(weaponNameSpace) getVariable _varName;
if (isNil "_var") then {
    if (_config isEqualType []) then {
        _path = configFile;
        {
            _path = _path >> _x;
        } count _config;
        _config = _path;
    };
    _var = call {
        if (isText _config) exitWith {
            getText _config;
        };
        if (isNumber _config) exitWith {
            getNumber _config;
        };
        if (isArray _config) exitWith {
            getArray _config;
        };
        _default
    };
    GVAR(weaponNameSpace) setVariable [_varName, _var];
};

_var;
