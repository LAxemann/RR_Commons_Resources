/*
*	Author: LAxemann
*
*	Desc: 
*   Switcht Sichtweite und Terraingrid ab einer gewissen Höhe in Luftfahrzeugen.
*
*	Params:
*	None
*
*	Returns:
*	Nil
*
*	Example: 
*   call RR_commons_dynamicViewdistance_fnc_handleTerrainGrid
* =================================================*/

if !(RR_commons_viewdistance) exitWith {};
private _unit = cameraOn;
if !(isNull _unit) then {
	private _pos = getPos _unit;
	private _posZ = _pos param [2,0];
	private _terrainGrid = getTerrainGrid;
	private _groundTerraingrid = 12.5;
	private _airTerraingrid = 50;
	private _inForceList = [_pos] call RR_commons_dynamicViewDistance_fnc_checkForceList;
	private _viewDistance = viewDistance;
	private _objectViewDistance = getObjectviewDistance param [0];
	private _adaptionStepsM = 200;

	/* In air */
	if ((((vehicle _unit) isKindOf "Air") && {_posZ >= RR_commons_dynamicViewdistance_heightThreshold}) || _inForceList) then {
		if (_viewDistance != RR_commons_dynamicViewdistance_airViewDistance) then {
			if ((time - RR_commons_lastVDChange) >= 0.25) then {
				RR_commons_lastVDChange = time;
				if (viewDistance != RR_commons_dynamicViewdistance_airViewDistance) then {
					setViewDistance ((viewDistance + 400) min RR_commons_dynamicViewdistance_airViewDistance);
				};
			};
		};
		if (RR_commons_dynamicViewdistance && {_terrainGrid != _airTerraingrid}) then {
			setTerrainGrid _airTerraingrid;
		};
		if (RR_commons_dynamicViewdistance_overrideOVD && {_objectViewDistance != RR_commons_dynamicViewdistance_airOVD}) then {
			setObjectViewDistance RR_commons_dynamicViewdistance_airOVD;
		};

	/* Ground */
	} else {
		if (_viewDistance != RR_commons_dynamicViewdistance_groundViewDistance) then {
			setViewDistance RR_commons_dynamicViewdistance_groundViewDistance;
		};
		if (RR_commons_dynamicViewdistance && {_terrainGrid != _groundTerraingrid}) then {
			setTerrainGrid _groundTerraingrid;
		};
		if (RR_commons_dynamicViewdistance_overrideOVD && {_objectViewDistance != RR_commons_dynamicViewdistance_groundOVD}) then {
			setObjectViewDistance RR_commons_dynamicViewdistance_groundOVD;
		};
	};
};

nil;