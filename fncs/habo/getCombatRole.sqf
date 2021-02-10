/*
*	Author: LAxemann
*
*	Desc: 
*   Categorizes a unit or vehicle into AA, AT or nothing specific based on available weaponry.
*	Values are cached for quicker processing.
*
*	Params:
*	0 - Entity <UNIT / VEHICLE>
*
*	Returns:
*	0 - Combat role, default "" <STRING>
*
*	Examples: 
*   [Harry] call RR_commons_habo_fnc_getCombatRole;
*   [myTank] call RR_commons_habo_fnc_getCombatRole;
* =================================================*/

#include "_macros.inc"

params ["_entity"];
private _weapons = weapons _entity;
private _largestAmmoUsageFlag = 0;
private _combatRole = "";
private _debugString = "";
{
	private _weapon = _x;
	private _aiAmmoUsageFlags = GVAR(weaponNameSpace) getVariable [format ["%1_habo_largestAIUsageFlagInWeaponMagazines_%2",PREFIXQUOTED,_weapon],-1];
	if (_aiAmmoUsageFlags == -1) then {
		private _cachedVarName = format ["_%1", _weapon];
		private _config = configFile >> "cfgWeapons" >> _weapon;
		private _magazines = [(_config >> "magazines"), "magazines" + _cachedVarName] call FUNC(readCacheValues);
		{	
			private _magazine = _x;
			_cachedVarName = format ["_%1", _magazine];
			_config = configFile >> "cfgMagazines" >> _magazine;
			private _magazineAmmoType = [(_config >> "ammo"), "ammo" + _cachedVarName] call FUNC(readCacheValues);
			private _ammoConfig = configFile >> "cfgAmmo" >> _magazineAmmoType;
			_cachedVarName = format ["_%1", _magazineAmmoType];
			private _hit = [(_ammoConfig >> "hit"), "hit" + _cachedVarName] call FUNC(readCacheValues);
			_aiAmmoUsageFlags = [(_ammoConfig >> "aiAmmoUsageFlags"), "aiAmmoUsageFlags" + _cachedVarName] call FUNC(readCacheValues);	
			if (_aiAmmoUsageFlags isEqualType "") then {
				if (_aiAmmoUsageFlags == "") then {
					_aiAmmoUsageFlags = 0;
				} else {
					_aiAmmoUsageFlags = _aiAmmoUsageFlags splitString " + ";
					_aiAmmoUsageFlags = _aiAmmoUsageFlags apply {parseNumber _x};
					_aiAmmoUsageFlags sort false;
					if (_hit < 40 && {(count _aiAmmoUsageFlags) > 1}) then {
						_aiAmmoUsageFlags = _aiAmmoUsageFlags select 1;
					} else {
						_aiAmmoUsageFlags = _aiAmmoUsageFlags select 0;
					};
				};
			};
		} forEach _magazines;
		GVAR(weaponNameSpace) setVariable [format ["%1_habo_largestAIUsageFlagInWeaponMagazines_%2",PREFIXQUOTED,_weapon],_aiAmmoUsageFlags];
	};
	_largestAmmoUsageFlag = [_largestAmmoUsageFlag,_aiAmmoUsageFlags] select (_aiAmmoUsageFlags > _largestAmmoUsageFlag);
} forEach _weapons;

_combatRole = switch _largestAmmoUsageFlag do {
	case 64:  {""};		// "Regular" guns
	case 128: {""};		// "Regular" guns
	case 256: {"AA"};	// AA
	case 512: {"AT"};	// AT
	default {"Unarmed"};
};

_combatRole;
