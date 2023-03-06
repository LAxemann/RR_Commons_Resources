/*
*	Author: LAxemann
*
*	Desc: 
*   Befüllt eine Kiste mit einer zufälligen Anzahl an definiertem Equipment.
* 	Alle Zahlenangaben können als echte Zahl, als [min,max] oder als 
*	[min,mid,max] angegeben werden.
*	(Siehe: https://community.bistudio.com/wiki/random)
*
*	Params:
*	0 - Behälter <Object>
*	1 - Vorherigen Inhalt leeren? <BOOL>
*	2 - (Zufällige) Anzahl an Magazinen für die Waffen <Zahl oder Array, optional>
*	3 - (Zufällige) Anzahl an Waffen <Zahl oder Array, optional>
*	4 - Waffen <Array, gewichtet oder ungewichtet, optional>
*	5 - (Zufällige) Anzahl an Magazinen <Zahl oder Array, optional>
*	6 - Magazine <Array, gewichtet oder ungewichtet, optional>
*	7 - (Zufällige) Anzahl an Rucksäcken <Zahl oder Array, optional>
*	8 - Rucksäcke <Array, gewichtet oder ungewichtet, optional>
*	9 - Items <Array im Format: [["className",Anzahl],["className",Anzahl"]...]>
*
*	Returns:
*	<ARRAY>
*	[
*		0 zugefügte Waffen
*		1 zugefügte Waffenmagazine
*		2 zugefügte Magazine
*		3 zugefügte Rucksäcke
*		4 zugefügte Items
*	];
*
*	Example: 
*   [someUnit] call RR_commons_core_fnc_isLeader
* =================================================*/


params [
	"_crate",
	"_keepContent",
	["_addWeaponMagsMinMax",[0,0]],
	["_weaponsMinMax",[1,1]],
	["_weaponsArray",[]],
	["_magazinesMinMax",[1,1]],
	["_magazinesArray",[]],
	["_backpacksMinMax",[1,1]],
	["_backpacksArray",[]],
	["_itemsArray",[]]						// Format: [["className",amount],["className",amount"]...]
];
/* Scope variable and return declaration */
private ["_weaponsMid","_weaponsAmount","_weaponMagsMid","_weaponMagsAmount","_magazinesMid","_magazinesAmount","_backpacksMid","_backpacksAmount"];
private _addedWeapons = [];
private _addedWeaponMagazines = [];
private _addedMagazines = [];
private _addedbackpacks = [];
private _addedItems = [];


/* Soll bisheriger Inhalt gelöscht werden? */
if !(_keepContent) then {
	clearWeaponCargoGlobal _crate;
	clearMagazineCargoGlobal _crate;
	clearItemCargoGlobal _crate;
	clearbackpackCargoGlobal _crate;
};


/* Get and add weapons */
if (_weaponsMinMax isEqualType 0) then {
	_weaponsAmount = _weaponsMinMax;
} else {
	_weaponsMinMax params ([["_weaponsMin","_weaponsMax"],["_weaponsMin","_weaponsMid","_weaponsMax"]] select ((count _weaponsMinMax) == 3));
	if (isNil "_weaponsMid") then {_weaponsMid = ((_weaponsMin + _weaponsMax) / 2)};
	_weaponsAmount = [round (random [_weaponsMin,_weaponsMid,_weaponsMax]),0] select ((count _weaponsArray) == 0);
};
private _weaponsArrayWeighted = (((count _weaponsArray) > 1) && {(_weaponsArray select 1) isEqualType 0});


if (_addWeaponMagsMinMax isEqualType 0) then {
	_weaponMagsAmount = _addWeaponMagsMinMax;
} else {
	_addWeaponMagsMinMax params ([["_weaponMagsMin","_weaponMagsMax"],["_weaponMagsMin","_weaponMagsMid","_weaponMagsMax"]] select ((count _addWeaponMagsMinMax) == 3));
	if (isNil "_weaponMagsMid") then {_weaponMagsMid = ((_weaponMagsMin + _weaponMagsMax) / 2)};
	_weaponMagsAmount = [round (random [_weaponMagsMin,_weaponMagsMid,_weaponMagsMax]),0] select ((count _weaponsArray) == 0);
};

if (_weaponsAmount > 0) then {
	for "_i" from 0 to _weaponsAmount step 1 do {
		private _weapon = [selectRandom _weaponsArray,selectRandomWeighted _weaponsArray] select _weaponsArrayWeighted;
		_crate addWeaponCargoGlobal [_weapon,1];
		_addedWeapons pushBack _weapon;
		private _compatibleMagazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
		if (_weaponMagsAmount > 0) then {
			for "_y" from 0 to _weaponMagsAmount do {
				private _weaponMag = (selectRandom _compatibleMagazines);
				_crate addMagazineCargoGlobal [_weaponMag,1];
				_addedWeaponMagazines pushBack _weaponMag;
			};
		};
	};
};


/* Get and add magazines */
if (_magazinesMinMax isEqualType 0) then {
	_magazinesAmount = _magazinesMinMax;
} else {
	_magazinesMinMax params ([["_magazinesMin","_magazinesMax"],["_magazinesMin","_magazinesMid","_magazinesMax"]] select ((count _magazinesMinMax) == 3));
	if (isNil "_magazinesMid") then {_magazinesMid = ((_magazinesMin + _magazinesMax) / 2)};
	_magazinesAmount = [round (random [_magazinesMin,_magazinesMid,_magazinesMax]),0] select ((count _magazinesArray) == 0);
};
private _magazinesArrayWeighted = (((count _magazinesArray) > 1) && {(_magazinesArray select 1) isEqualType 0});
if (_magazinesAmount > 0) then {
	for "_i" from 0 to _magazinesAmount step 1 do {
		private _magazine = [selectRandom _magazinesArray, selectRandomWeighted _magazinesArray] select _magazinesArrayWeighted;
		_crate addMagazineCargoGlobal [_magazine,1];
		_addedMagazines pushBack _magazine;
	};
};


/* Get and add backpacks */
if (_backpacksMinMax isEqualType 0) then {
	_backpacksAmount = _backpacksMinMax;
} else {
	_backpacksMinMax params ([["_backpacksMin","_backpacksMax"],["_backpacksMin","_backpacksMid","_backpacksMax"]] select ((count _backpacksMinMax) == 3));
	if (isNil "_backpacksMid") then {_backpacksMid = ((_backpacksMin + _backpacksMax) / 2)};
	_backpacksAmount = [round (random [_backpacksMin,_backpacksMid,_backpacksMax]),0] select ((count _backpacksArray) == 0);
};

private _backpacksArrayWeighted = (((count _backpacksArray) > 1) && {(_backpacksArray select 1) isEqualType 0});
if (_backpacksAmount > 0) then {
	for "_i" from 0 to _backpacksAmount step 1 do {
		private _backpack = [selectRandom _backpacksArray, selectRandomWeighted _backpacksArray] select _backpacksArrayWeighted;
		_crate addbackpackCargoGlobal [_backpack,1];
		_addedbackpacks pushBack _backpack;
	};
};


/* Get and add items */
_itemsArray select {
	_x params ["_item","_amount"];
	_crate addItemCargoGlobal [_item,_amount];
	for "_z" from 0 to _amount do {
		_addedItems pushBack _item;
	};
	true;
};


/* Return array */
[_addedWeapons,_addedWeaponMagazines,_addedMagazines,_addedbackpacks,_addedItems];
