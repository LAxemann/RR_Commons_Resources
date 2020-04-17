#define DEC(CATEGORY,FNCNAME) RR_commons_##CATEGORY##_fnc_##FNCNAME = compile preprocessFileLineNumbers '\RR_commons_resources\fncs\##CATEGORY##\##FNCNAME##.sqf';
// C O R E
/* Checke, ob die Einheit einen Rang ab "Lieutenant" hat */
DEC(core,isLeader)

/* Checke, ob das Fahrzeug vollbesetzt ist */
DEC(core,isVehicleFull)

/* Wende die 3den Attribute an */
DEC(core,apply3denAttribute)

/* Checke, ob die Einheit einen Rang ab "Lieutenant" hat */
DEC(core,fillCrate)

/* Checke, ob die Einheit einen Rang ab "Lieutenant" hat */
DEC(core,infoText)


// D Y N A M I C  V I E W D I S T A N C E
/* Dynamic TerrainGrid */
DEC(dynamicViewDistance,handleTerrainGrid)
DEC(dynamicViewDistance,checkForceList)
DEC(dynamicViewDistance,openDialog)
DEC(dynamicViewDistance,updateViewdistance)



// A C R E
/* ACRE Init */
DEC(acre,acreInit)

/* ACRE Babel Setup */
DEC(acre,babelSetup)

/* ACRE Funkgerätvergabe */
DEC(acre,autoRadios)



// T E L E P O R T
/* Teleportdialog öffnen */
DEC(teleport,openDialog)

/* Teleport-Funktion */
DEC(teleport,teleport)

/* Fügt die Aktion hinzu */
DEC(teleport,addAction)

/* Fügt die Aktion für JIPler hinzu */
DEC(teleport,addActionJIP)



// InitBlackScreen
DEC(initBlackScreen,initBlackScreen)


// EasySpawn
DEC(easySpawn,extractCrewInfo)
DEC(easySpawn,extractUnitInfo)
DEC(easySpawn,getTemplateData)
DEC(easySpawn,setGroupTemplate)
DEC(easySpawn,spawnGroup)
DEC(easySpawn,spawnUnit)
DEC(easySpawn,spawnVehicle)


// PvPGameMode
DEC(pvp,claimTargetObject)
DEC(pvp,clientTracking)
DEC(pvp,getSideColor)
DEC(pvp,initClientTracking)
DEC(pvp,initTargetObject)
DEC(pvp,serverLoop)
DEC(pvp,serverLoopInit)


/* Zone Restriction */
DEC(zoneRestriction,main)
