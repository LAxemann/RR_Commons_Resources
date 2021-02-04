/* Prefix (for dev use) */
#define PREFIX RR


/* General Macros */
#define FUNCASSEMBLY(str1,str2,str3) str1##_##str2##_##str3
#define GVARASSEMBLY(str1,str2,str3) str1##_##str2##_##str3
#define FUNC(FUNCNAME) FUNCASSEMBLY(PREFIX,commons_habo_fnc,FUNCNAME)
#define GVAR(GVARNAME) GVARASSEMBLY(PREFIX,commons_habo,GVARNAME)



/* Param Macros */
#define PARAM_metaGroupID 0
#define PARAM_metaGroupType 1
#define PARAM_side 2
#define PARAM_groups 3
#define PARAM_combatInfo 4
#define PARAM_enemyAssessment 5
#define PARAM_combatRatingTracking 6
#define PARAM_supports 7
#define PARAM_available 8
#define PARAM_maxDistance 9


/* Combat rating of own forces vs enemy forces */
#define MACRO_combatInfo(HELI,HELIAA,HELIAT,ARMORED,ARMOREDAA,ARMOREDAT,APC,APCAA,APCAT,CAR,CARAA,CARAT,INF,INFAA,INFAT,HELIUNARMED,ARMOREDUNARMED,APCUNARMED,CARUNARMED,INFUNARMED) \
	* ((HELI * (1 min _nrHeliEnemy)) + (HELIAA * (1 min _nrHeliAAEnemy)) + (HELIAT * (1 min _nrHeliATEnemy)) + \
	(ARMORED * (1 min _nrArmoredEnemy)) + (ARMOREDAA * (1 min _nrArmoredAAEnemy)) + (ARMOREDAT * (1 min _nrArmoredATEnemy)) + \
	(APC * (1 min _nrAPCEnemy)) + (APCAA * (1 min _nrAPCAAEnemy)) + (APCAT * (1 min _nrAPCATEnemy)) + \
	(CAR * (1 min _nrCarEnemy)) + (CARAA * (1 min _nrCarAAEnemy)) + (CARAT * (1 min _nrCarATEnemy)) + \
	(INF * (1 min _nrInfEnemy)) + (INFAA * (1 min _nrInfAAEnemy)) + (INFAT * (1 min _nrInfATEnemy)) + \
	(HELIUNARMED * (1 min _nrHeliUnarmedEnemy)) + (ARMOREDUNARMED * (1 min _nrArmoredUnarmedEnemy)) + \
	(APCUNARMED * (1 min _nrAPCUnarmedEnemy)) + (CARUNARMED * (1 min _nrCarUnarmedEnemy)) + (INFUNARMED * (1 min _nrInfUnarmedEnemy)));


/* Combat rating of enemy forces vs own forces */
#define MACRO_combatInfoEnemy(HELI,HELIAA,HELIAT,ARMORED,ARMOREDAA,ARMOREDAT,APC,APCAA,APCAT,CAR,CARAA,CARAT,INF,INFAA,INFAT,HELIUNARMED,ARMOREDUNARMED,APCUNARMED,CARUNARMED,INFUNARMED) \
	* ((HELI * (1 min _nrHeli)) + (HELIAA * (1 min _nrHeliAA)) + (HELIAT * (1 min _nrHeliAT)) + \
	(ARMORED * (1 min _nrArmored)) + (ARMOREDAA * (1 min _nrArmoredAA)) + (ARMOREDAT * (1 min _nrArmoredAT)) + \
	(APC * (1 min _nrAPC)) + (APCAA * (1 min _nrAPCAA)) + (APCAT * (1 min _nrAPCAT)) + \
	(CAR * (1 min _nrCar)) + (CARAA * (1 min _nrCarAA)) + (CARAT * (1 min _nrCarAT)) + \
	(INF * (1 min _nrInf)) + (INFAA * (1 min _nrInfAA)) + (INFAT * (1 min _nrInfAT)) + \
	(HELIUNARMED * (1 min _nrHeliUnarmed)) + (ARMOREDUNARMED * (1 min _nrArmoredUnarmed)) + \
	(APCUNARMED * (1 min _nrAPCUnarmed)) + (CARUNARMED * (1 min _nrCarUnarmed)) + (INFUNARMED * (1 min _nrInfUnarmed)));
	
/* Weighing values */
#define WEIGHT_HELI 15
#define WEIGHT_ARMORED 31
#define WEIGHT_APC 25
#define WEIGHT_CAR 8
#define WEIGHT_INF 1
	
