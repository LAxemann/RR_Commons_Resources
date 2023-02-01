createDialog "RR_commons_viewDistance_dialog";
private _parentDisplay = (findDisplay 5051);

private _rscTextMinDist  	= _parentDisplay displayCtrl 1004;
private _rscTextMaxDist  	= _parentDisplay displayCtrl 1005;
private _rscTextAirDist  	= _parentDisplay displayCtrl 1006;
private _rscTextGroundDist 	= _parentDisplay displayCtrl 1007;
private _rscSliderGround	= _parentDisplay displayCtrl 1900;
private _rscSliderAir		= _parentDisplay displayCtrl 1901;

// Object viewdistance update
private _rscCheckBoxOverrideOVD = _parentDisplay displayCtrl 2800;
private _rscCheckBoxGVDOVDRatio = _parentDisplay displayCtrl 2801;
private _rscTextMinDistOVD  	= _parentDisplay displayCtrl 1012;
private _rscTextMaxDistOVD  	= _parentDisplay displayCtrl 1013;
private _rscTextAirDistOVD  	= _parentDisplay displayCtrl 1009;
private _rscTextGroundDistOVD 	= _parentDisplay displayCtrl 1008;
private _rscSliderGroundOVD		= _parentDisplay displayCtrl 1902;
private _rscSliderAirOVD		= _parentDisplay displayCtrl 1903;




/* Init the controls */
_rscTextMinDist ctrlSetText (format ["%1 m",RR_commons_viewDistance_min]);
_rscTextMaxDist ctrlSetText (format ["%1 m",RR_commons_viewDistance_max]);
_rscTextGroundDist ctrlSetText (format ["%1 m",round RR_commons_dynamicViewdistance_groundViewdistance]);
_rscTextAirDist    ctrlSetText (format ["%1 m",round RR_commons_dynamicViewdistance_airViewdistance]);

_rscSliderGround sliderSetRange [RR_commons_viewDistance_min,RR_commons_viewDistance_max];
_rscSliderAir    sliderSetRange [RR_commons_viewDistance_min,RR_commons_viewDistance_max];

_rscSliderGround sliderSetPosition RR_commons_dynamicViewdistance_groundViewdistance;
_rscSliderAir    sliderSetPosition RR_commons_dynamicViewdistance_AirViewdistance;


// Object viewdistance update
if !(RR_commons_dynamicViewdistance_overrideOVD) then {
	{_x ctrlShow false} forEach [
		_rscTextMinDistOVD,
		_rscTextMaxDistOVD,
		_rscTextAirDistOVD,
		_rscTextGroundDistOVD,
		_rscSliderGroundOVD,
		_rscSliderAirOVD
	];
	//setObjectViewDistance 0;
} else {
	_rscCheckBoxOverrideOVD cbSetChecked true;
	_rscTextMaxDistOVD ctrlSetText (format ["%1 m",(RR_commons_dynamicViewdistance_groundViewdistance max RR_commons_dynamicViewdistance_AirViewdistance)]);
	_rscTextAirDistOVD ctrlSetText ([(format ["%1 m",round RR_commons_dynamicViewdistance_airOVD]),"Standard"] select (RR_commons_dynamicViewdistance_airOVD == 0));
	_rscTextGroundDistOVD ctrlSetText ([(format ["%1 m",round RR_commons_dynamicViewdistance_groundOVD]),"Standard"] select (RR_commons_dynamicViewdistance_groundOVD == 0));
	
	_rscSliderGroundOVD sliderSetRange [0,RR_commons_dynamicViewdistance_groundViewdistance];
	_rscSliderAirOVD    sliderSetRange [0,RR_commons_dynamicViewdistance_AirViewdistance];
	_rscSliderGroundOVD sliderSetPosition RR_commons_dynamicViewdistance_groundOVD;
	_rscSliderAirOVD    sliderSetPosition RR_commons_dynamicViewdistance_airOVD;
};


if (RR_commons_dynamicViewdistance_keepRatio) then {
	_rscCheckBoxGVDOVDRatio cbSetChecked true;
};

{_x ctrlShow false} forEach [_rscTextMinDistOVD, _rscTextMaxDistOVD];