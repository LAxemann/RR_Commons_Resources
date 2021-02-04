/*
*	Author: LAxemann, Schnuckiputz
*
*	Desc: 
*   Takes two combat info arrays and weighs them against each other.
*
*	Params:
*	0 - Combat Info Array <ARRAY>
*	1 - Enemy Combat Info Array <ARRAY>
*
*	Returns:
*	0 - Combat Rating <FLOAT>
*
*	Examples: 
*   [array,array] call RR_commons_habo_fnc_calculateCombatRating;
* =================================================*/

#include "_macros.inc"

params ["_combatInfo","_combatInfoEnemy"];
_combatInfo params [
	"_nrHeli",
	"_nrHeliAA",
	"_nrHeliAT",
	"_nrHeliUnarmed",
	
	"_nrArmored",
	"_nrArmoredAA",
	"_nrArmoredAT",
	"_nrArmoredUnarmed",
	
	"_nrAPC",
	"_nrAPCAA",
	"_nrAPCAT",
	"_nrAPCUnarmed",
	
	"_nrCar",
	"_nrCarAA",
	"_nrCarAT",
	"_nrCarUnarmed",
	
	"_nrInf",
	"_nrInfAA",
	"_nrInfAT",
	"_nrInfUnarmed"
];

_combatInfoEnemy params [
	"_nrHeliEnemy",
	"_nrHeliAAEnemy",
	"_nrHeliATEnemy",
	"_nrHeliUnarmedEnemy",
	
	"_nrArmoredEnemy",
	"_nrArmoredAAEnemy",
	"_nrArmoredATEnemy",
	"_nrArmoredUnarmedEnemy",
	
	"_nrAPCEnemy",
	"_nrAPCAAEnemy",
	"_nrAPCATEnemy",
	"_nrAPCUnarmedEnemy",
	
	"_nrCarEnemy",
	"_nrCarAAEnemy",
	"_nrCarATEnemy",
	"_nrCarUnarmedEnemy",
	
	"_nrInfEnemy",
	"_nrInfAAEnemy",
	"_nrInfATEnemy",
	"_nrInfUnarmedEnemy"
];


//							            								(HELI,	HELIAA,	HELIAT,	ARMORED,	ARMOREDAA,	ARMOREDAT,	APC,		APCAA,		APCAT,		CAR,	CARAA,		CARAT,	INF,	INFAA,	INFAT,	HELIUN,	ARMOREDUN,	APCUN,	CARUN,		INFUN)
private _heliRating 			= _nrHeli			* WEIGHT_HELI 		MACRO_combatInfo(1,		0.10,	0.35,	0,			0,			0,			0,			0,			0,			1,		0,			1,		1,		0.15,	1,		1,		1,			1,		1,			1)
private _heliAARating 			= _nrHeliAA			* WEIGHT_HELI 		MACRO_combatInfo(1,		1,		1,		0.05,		0,			0.05,		0.35,		0.025,		0.25,		1,		0.35,		1,		1,		0.55,	1,		1,		1,			1,		1,			1)
private _heliATRating 			= _nrHeliAT			* WEIGHT_HELI 		MACRO_combatInfo(1,		0.1,	1,		1,			0.85,		1,			1,			0.90,		1,			1,		0.95,		1,		1,		0.85,	1,		1,		1,			1,		1,			1)
private _heliUnarmedRating 		= _nrHeliUnarmed	* WEIGHT_HELI 		MACRO_combatInfo(0,		0,		0,		0,			0,			0,			0,			0,			0,			0,		0,			0,		0,		0,		0,		1,		1,			1,		1,			1)
	
private _armoredRating 			= _nrArmored		* WEIGHT_ARMORED 	MACRO_combatInfo(1,		1,		0,		0.20,		0.10,		0.05,		1, 			0.70,		0.15,		1,		1,			0.65,	1,		1,		1,		1,		1,			1,		1,			1)
private _armoredAARating 		= _nrArmoredAA		* WEIGHT_ARMORED 	MACRO_combatInfo(1,		1,		0.80,	1,			0.45,		0.35,		1, 			1,			0.45,		1,		1,			1,		1,		1,		1,		1,		1,			1,		1,			1)
private _armoredATRating 		= _nrArmoredAT		* WEIGHT_ARMORED 	MACRO_combatInfo(1,		1,		0.20,	1,			1,			1,			1, 			1,			1,			1,		1,			1,		1,		1,		1,		1,		1,			1,		1,			1)
private _armoredUnarmedRating 	= _nrArmoredUnarmed	* WEIGHT_ARMORED 	MACRO_combatInfo(0,		0,		0,		0,			0,			0,			0,			0,			0,			0,		0,			0,		0,		0,		0,		1,		1,			1,		1,			1)

private _APCRating 				= _nrAPC			* WEIGHT_APC 		MACRO_combatInfo(1,		1,		0.65,	0.2,		0.125,		0.075,		0.35, 		0.25,		0.10,		1,		1,			0.75,	1,		1,		1,		1,		1,			1,		1,			1)
private _APCAARating 			= _nrAPCAA			* WEIGHT_APC 		MACRO_combatInfo(1,		1,		0.95,	1,			0.45,		0.30,		1, 			0.90,		0.35,		1,		1,			1,		1,		1,		1,		1,		1,			1,		1,			1)
private _APCATRating 			= _nrAPCAT			* WEIGHT_APC 		MACRO_combatInfo(0.10,	0.10,	0.15,	1,			1,			0.75,		1, 			1,			0,			1,		1,			1,		1,		1,		1,		1,		1,			1,		1,			1)
private _APCUnarmedRating 		= _nrAPCUnarmed		* WEIGHT_APC 		MACRO_combatInfo(0,		0,		0,		0,			0,			0,			0,			0,			0,			0,		0,			0,		0,		0,		0,		0.85,	0.85,		1,		1,			1)

private _CarRating 				= _nrCar			* WEIGHT_CAR 		MACRO_combatInfo(0.65,	0.50,	0.05,	0.025,		0.01,		0,			0, 			0,			0,			1,		0.75,		0.45,	1,		0.8,	0.25,	1,		1,			1,		1,			1)
private _CarAARating 			= _nrCarAA			* WEIGHT_CAR 		MACRO_combatInfo(1,		1,		1,		0.05,		0,			0,			0.25, 		0.15,		0.05,		1,		1,			0.65,	1,		0.85,	0.25,	1,		1,			1,		1,			1)
private _CarATRating 			= _nrCarAT			* WEIGHT_CAR 		MACRO_combatInfo(0.1,	0.05,	0,		1,			0.85,		0.65,		1, 			0.85,		0.85,		1,		1,			1,		0.25,	0.15,	0.10,	1,		1,			1,		1,			1)
private _CarUnarmedRating 		= _nrCarUnarmed		* WEIGHT_CAR 		MACRO_combatInfo(0,		0,		0,		0,			0,			0,			0,			0,			0,			0,		0,			0,		0,		0,		0,		0.35,	0.20,		0.45,	1,			1)

private _InfRating 				= _nrInf			* WEIGHT_INF 		MACRO_combatInfo(0.03,	0.01,	0.005,	0,			0,			0,			0, 			0,			0,			0.35,	0.25,		0.4,	1,		1,		1,		1,		1,			1,		1,			1)
private _InfAARating 			= _nrInfAA			* WEIGHT_INF 		MACRO_combatInfo(1,		1,		1,		0.1,		0,			0,			0.075, 		0.05,		0.05,		0.55,	0.37,		0.45,	0.85,	1,		1,		1,		1,			1,		1,			1)
private _InfATRating 			= _nrInfAT			* WEIGHT_INF 		MACRO_combatInfo(0.06,	0.005,	0.005,	0.75,		0.85,		0.55,		0.90, 		0.90,		0.75,		1,		1,			1,		0.85,	1,		1,		1,		1,			1,		1,			1)
private _InfUnarmedRating 		= _nrInfUnarmed		* WEIGHT_INF 		MACRO_combatInfo(0,		0,		0,		0,			0,			0,			0,			0,			0,			0,		0,			0,		0,		0,		0,		0.25,	0.05,		0.15,	0.65,		1)

private _combatRating = _heliRating+_heliAARating+_heliATRating+_armoredRating+_armoredAARating+_armoredATRating+_APCRating+_APCAARating+_APCATRating+_CarRating+_CarAARating+_CarATRating+_InfRating+_InfAARating+_InfATRating+_heliUnarmedRating+_armoredUnarmedRating+_APCUnarmedRating+_CarUnarmedRating,_InfUnarmedRating;




//																					 					 (HELI,		HELIAA,	HELIAT,	ARMORED,	ARMOREDAA,	ARMOREDAT,	APC,		APCAA,		APCAT,		CAR,	CARAA,		CARAT,	INF,	INFAA,	INFAT,	HELIUN,	ARMOREDUN,	APCUN,	CARUN,		INFUN)
private _heliRatingEnemy 			= _nrHeliEnemy				* WEIGHT_HELI 		MACRO_combatInfoEnemy(1,		0.10,	0.35,	0,			0,			0,			0,			0,			0,			1,		0,			1,		1,		0.15,	1,		1,		1,			1,		1,			1)
private _heliAARatingEnemy 			= _nrHeliAAEnemy			* WEIGHT_HELI 		MACRO_combatInfoEnemy(1,		1,		1,		0.05,		0,			0.05,		0.35,		0.025,		0.25,		1,		0.35,		1,		1,		0.55,	1,		1,		1,			1,		1,			1)
private _heliATRatingEnemy 			= _nrHeliATEnemy			* WEIGHT_HELI 		MACRO_combatInfoEnemy(1,		0.1,	1,		1,			0.85,		1,			1,			0.90,		1,			1,		0.95,		1,		1,		0.85,	1,		1,		1,			1,		1,			1)
private _heliUnarmedRatingEnemy 	= _nrHeliUnarmedEnemy		* WEIGHT_HELI 		MACRO_combatInfoEnemy(0,		0,		0,		0,			0,			0,			0,			0,			0,			0,		0,			0,		0,		0,		0,		1,		1,			1,		1,			1)
	
private _armoredRatingEnemy 		= _nrArmoredEnemy			* WEIGHT_ARMORED 	MACRO_combatInfoEnemy(1,		1,		0,		0.20,		0.10,		0.05,		1, 			0.70,		0.15,		1,		1,			0.65,	1,		1,		1,		1,		1,			1,		1,			1)
private _armoredAARatingEnemy 		= _nrArmoredAAEnemy			* WEIGHT_ARMORED 	MACRO_combatInfoEnemy(1,		1,		0.80,	1,			0.45,		0.35,		1, 			1,			0.45,		1,		1,			1,		1,		1,		1,		1,		1,			1,		1,			1)
private _armoredATRatingEnemy 		= _nrArmoredATEnemy			* WEIGHT_ARMORED 	MACRO_combatInfoEnemy(1,		1,		0.20,	1,			1,			1,			1, 			1,			1,			1,		1,			1,		1,		1,		1,		1,		1,			1,		1,			1)
private _armoredUnarmedRatingEnemy 	= _nrArmoredUnarmedEnemy	* WEIGHT_ARMORED 	MACRO_combatInfoEnemy(0,		0,		0,		0,			0,			0,			0,			0,			0,			0,		0,			0,		0,		0,		0,		1,		1,			1,		1,			1)

private _APCRatingEnemy 			= _nrAPCEnemy				* WEIGHT_APC 		MACRO_combatInfoEnemy(1,		1,		0.65,	0.2,		0.125,		0.075,		0.35, 		0.25,		0.10,		1,		1,			0.75,	1,		1,		1,		1,		1,			1,		1,			1)
private _APCAARatingEnemy 			= _nrAPCAAEnemy				* WEIGHT_APC 		MACRO_combatInfoEnemy(1,		1,		0.95,	1,			0.45,		0.30,		1, 			0.90,		0.35,		1,		1,			1,		1,		1,		1,		1,		1,			1,		1,			1)
private _APCATRatingEnemy 			= _nrAPCATEnemy				* WEIGHT_APC 		MACRO_combatInfoEnemy(0.10,		0.10,	0.15,	1,			1,			0.75,		1, 			1,			0,			1,		1,			1,		1,		1,		1,		1,		1,			1,		1,			1)
private _APCUnarmedRatingEnemy 		= _nrAPCUnarmedEnemy		* WEIGHT_APC 		MACRO_combatInfoEnemy(0,		0,		0,		0,			0,			0,			0,			0,			0,			0,		0,			0,		0,		0,		0,		0.85,	0.85,		1,		1,			1)

private _CarRatingEnemy 			= _nrCarEnemy				* WEIGHT_CAR 		MACRO_combatInfoEnemy(0.65,		0.50,	0.05,	0.025,		0.01,		0,			0, 			0,			0,			1,		0.75,		0.45,	1,		0.8,	0.25,	1,		1,			1,		1,			1)
private _CarAARatingEnemy 			= _nrCarAAEnemy				* WEIGHT_CAR 		MACRO_combatInfoEnemy(1,		1,		1,		0.05,		0,			0,			0.25, 		0.15,		0.05,		1,		1,			0.65,	1,		0.85,	0.25,	1,		1,			1,		1,			1)
private _CarATRatingEnemy 			= _nrCarATEnemy				* WEIGHT_CAR 		MACRO_combatInfoEnemy(0.1,		0.05,	0,		1,			0.85,		0.65,		1, 			0.85,		0.85,		1,		1,			1,		0.25,	0.15,	0.10,	1,		1,			1,		1,			1)
private _CarUnarmedRatingEnemy 		= _nrCarUnarmedEnemy		* WEIGHT_CAR 		MACRO_combatInfoEnemy(0,		0,		0,		0,			0,			0,			0,			0,			0,			0,		0,			0,		0,		0,		0,		0.35,	0.20,		0.45,	1,			1)

private _InfRatingEnemy 			= _nrInfEnemy				* WEIGHT_INF 		MACRO_combatInfoEnemy(0.03,		0.01,	0.005,	0,			0,			0,			0, 			0,			0,			0.35,	0.25,		0.4,	1,		1,		1,		1,		1,			1,		1,			1)
private _InfAARatingEnemy 			= _nrInfAAEnemy				* WEIGHT_INF 		MACRO_combatInfoEnemy(1,		1,		1,		0.1,		0,			0,			0.075, 		0.05,		0.05,		0.55,	0.37,		0.45,	0.85,	1,		1,		1,		1,			1,		1,			1)
private _InfATRatingEnemy 			= _nrInfATEnemy				* WEIGHT_INF 		MACRO_combatInfoEnemy(0.06,		0.005,	0.005,	0.75,		0.85,		0.35,		0.90, 		0.90,		0.55,		1,		1,			1,		0.85,	1,		1,		1,		1,			1,		1,			1)
private _InfUnarmedRatingEnemy 		= _nrInfUnarmedEnemy		* WEIGHT_INF 		MACRO_combatInfoEnemy(0,		0,		0,		0,			0,			0,			0,			0,			0,			0,		0,			0,		0,		0,		0,		0.25,	0.05,		0.15,	0.65,		1)

private _combatRatingEnemy = _heliRatingEnemy+_heliAARatingEnemy+_heliATRatingEnemy+_armoredRatingEnemy+_armoredAARatingEnemy+_armoredATRatingEnemy+_APCRatingEnemy+_APCAARatingEnemy+_APCATRatingEnemy+_CarRatingEnemy+_CarAARatingEnemy+_CarATRatingEnemy+_InfRatingEnemy+_InfAARatingEnemy+_InfATRatingEnemy+_heliUnarmedRatingEnemy+_armoredUnarmedRatingEnemy+_APCUnarmedRatingEnemy+_CarUnarmedRatingEnemy,_InfUnarmedRatingEnemy;


private _combatRatingDiff = _combatRating - _combatRatingEnemy;

_combatRatingDiff;





//hintSilent format ["Own: %1\nEnemy: %2",_combatRating,_combatRatingEnemy];
//hintSilent format ["Own: %1\nEnemy: %2",_armoredRating,_armoredRatingEnemy];
/*
hintSilent format [
	"
		Inf\n%1   %2\n\n
		InfAA\n%3   %4\n\n
		InfAT\n%5   %6\n\n
		Arm\n%7   %8\n\n
		ArmAA\n%9   %10\n\n
		ArmAT\n%11   %12\n\n
		
	",
	_InfRating,_InfRatingEnemy,
	_InfAARating,_InfAARatingEnemy,
	_InfATRating,_InfATRatingEnemy,
	_armoredRating,_armoredRatingEnemy,
	_armoredAARating,_armoredAARatingEnemy,
	_armoredATRating,_armoredATRatingEnemy
];
*/


