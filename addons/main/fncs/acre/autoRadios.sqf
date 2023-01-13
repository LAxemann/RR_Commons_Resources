/*
*	Author: LAxemann
*
*	Desc: 
*   Vergibt Funkgeräte zu Missionsstart an Spieler. 
*
*	Params:
*	None
*
*	Returns:
*	Nil
*
*	Example: 
*   call RR_commons_acre_fnc_autoRadios
* =================================================*/
if (RR_commons_acre_autoRadios) then {
	if ((side player == civilian) && {!RR_commons_acre_autoRadios_includeCivilians}) exitWith {};
	private _has148  = false;
	private _has117F = false;

	/* Füge 148er zu Gruppenleitern und 117F zu Einheiten mit einem Rang ab "Captain" hinzu */
	if (RR_commons_acre_autoRadios_148ForGroupLeaders && {player == (leader (group player))}) then {
		player addItem "ACRE_PRC148";
		_has148 = true;
	};
	if (RR_commons_acre_autoRadios_117ForAboveLieutenant && {[player] call RR_commons_core_fnc_isLeader}) then {
		player addItem "ACRE_PRC117F";
		_has117F = true;
	};

	
	private _148Array = [];
	private _117Array = [];
	RR_commons_acre_autoRadios_unitsWith148 select {
		private _unit = _x;
		if (typeName _unit == "STRING") then {
			_unit = call compile _unit;
		};
		_148Array pushBack _unit;
		true;
	};
	RR_commons_acre_autoRadios_unitsWith117 select {
		private _unit = _x;
		if (typeName _unit == "STRING") then {
			_unit = call compile _unit;
		};
		_117Array pushBack _unit;
		true;
	};

	/* Checke, ob die Einheit in der forcierten Funkgerätzuweisung auftaucht */
	if (player in _148Array && {!(_has148)}) then {
		player addItem "ACRE_PRC148";
	};
	if (player in _117Array && {!(_has117F)}) then {
		player addItem "ACRE_PRC117F";
	};
};

nil;