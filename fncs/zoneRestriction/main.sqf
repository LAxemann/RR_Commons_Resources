if (isNull player) exitWith {};
if (player in RR_commons_zoneRestriction_excludeArray) exitWith {};
private _inZone = false;
private _currentUnit = vehicle cameraOn;
if (RR_commons_zoneRestriction_disableAir && {_currentUnit isKindOf "AIR"}) exitWith {};

/* Checke, ob sich die aktuelle Spielereinheit in der Zone aufhält */
{
	if (_currentUnit inArea _x) exitWith {_inZone = true};
} forEach RR_commons_zoneRestriction_triggers;


/* Prüfe, ob der Modus invertiert ist und packe die Maßnahmen aus */
if ((RR_commons_zoneRestriction_invert && !_inZone) || (!RR_commons_zoneRestriction_invert && _inZone)) then {
	if (RR_commons_debug) then {hintSilent "InZone"};
	private _lastSafePos = _currentUnit getVariable ["RR_commons_zoneRestriction_lastSafePos",(getPos _currentUnit)];

	/* Modus 0 - Unsichtbare Wand */
	if (RR_commons_zoneRestriction_mode == 0) then {
		_currentUnit setPos _lastSafePos;
		if ((time - RR_commons_zoneRestriction_lastWarning) >= 3) then {
			["Ende des Spielbereichs erreicht!",5] spawn RR_commons_core_fnc_infotext;
			RR_commons_zoneRestriction_lastWarning = time;
		};
	} else {
		/* Modus 1, Tod mit Warnung */
		if (RR_commons_zoneRestriction_mode == 1) then {
			if (RR_commons_zoneRestriction_canBeWarned) then {
				[RR_commons_zoneRestriction_text,5] spawn RR_commons_core_fnc_infotext;
				RR_commons_zoneRestriction_killTime = time + RR_commons_zoneRestriction_warningTime;
				RR_commons_zoneRestriction_canBeWarned = false;
			};
			if (time >= RR_commons_zoneRestriction_killTime) then {
				_currentUnit setDamage 1;
			};
		} else {
			/* Modus 2, sofortiger Tod */
			_currentUnit setDamage 1;
		};
	};
} else {
	_currentUnit setVariable ["RR_commons_zoneRestriction_lastSafePos",(getPos _currentUnit)];
	if !(RR_commons_zoneRestriction_canBeWarned) then {
		RR_commons_zoneRestriction_canBeWarned = true;
		if (RR_commons_zoneRestriction_mode == 1) then {
			["Du bist zurück in der Zone",5] spawn RR_commons_core_fnc_infotext;
		};
	};
};