params ["_control","_value"];
private _parentDisplay = (findDisplay 5051);
private _rscTextGroundDist 	= _parentDisplay displayCtrl 1007;
private _rscTextAirDist  	= _parentDisplay displayCtrl 1006;
private _rscSliderGround	= _parentDisplay displayCtrl 1900;
private _rscSliderAir		= _parentDisplay displayCtrl 1901;

if (_control == _rscSliderGround) then {
	RR_commons_dynamicViewdistance_groundViewdistance = _value;
	_rscTextGroundDist ctrlSetText (format ["%1 m",round RR_commons_dynamicViewdistance_groundViewdistance]);
};
if (_control == _rscSliderAir) then {
	RR_commons_dynamicViewdistance_airViewdistance = _value;
	_rscTextAirDist ctrlSetText (format ["%1 m",round RR_commons_dynamicViewdistance_airViewdistance]);

};
if (((vehicle player) isKindOf "Air") && {((getPos player) select 2) >= RR_commons_dynamicViewdistance_heightThreshold}) then {
	setViewDistance RR_commons_dynamicViewdistance_airViewdistance;
} else {
	setViewDistance RR_commons_dynamicViewdistance_groundViewdistance;
};