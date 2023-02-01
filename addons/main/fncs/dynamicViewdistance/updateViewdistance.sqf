params ["_control","_value"];
private _parentDisplay = (findDisplay 5051);
private _inAir = ((vehicle cameraOn) isKindOf "Air");

private _rscTextGroundDist 	= _parentDisplay displayCtrl 1007;
private _rscTextAirDist  	= _parentDisplay displayCtrl 1006;
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


private _ratioGround 	= (RR_commons_dynamicViewdistance_groundOVD / RR_commons_dynamicViewdistance_groundViewdistance);
private _ratioAir 		= (RR_commons_dynamicViewdistance_airOVD / RR_commons_dynamicViewdistance_airViewdistance);
private _keepRatios  	= RR_commons_dynamicViewdistance_keepRatio;


/* Gelände VD Slider */
if (_control == _rscSliderGround) then {
	RR_commons_dynamicViewdistance_groundViewdistance = _value;
	_rscTextGroundDist ctrlSetText (format ["%1 m",round RR_commons_dynamicViewdistance_groundViewdistance]);
	if (RR_commons_dynamicViewdistance_overrideOVD) then {
		_rscSliderGroundOVD sliderSetRange [0,RR_commons_dynamicViewdistance_groundViewdistance];
		if (_keepRatios) then {
			RR_commons_dynamicViewdistance_groundOVD = (RR_commons_dynamicViewdistance_groundViewdistance * _ratioGround);
		};
		if (RR_commons_dynamicViewdistance_groundViewdistance < RR_commons_dynamicViewdistance_groundOVD) then {
			RR_commons_dynamicViewdistance_groundOVD = RR_commons_dynamicViewdistance_groundViewdistance;
		};
		_rscSliderGroundOVD sliderSetPosition RR_commons_dynamicViewdistance_groundOVD;
	};
};
if (_control == _rscSliderAir) then {
	RR_commons_dynamicViewdistance_airViewdistance = _value;
	_rscTextAirDist ctrlSetText (format ["%1 m",round RR_commons_dynamicViewdistance_airViewdistance]);
	if (RR_commons_dynamicViewdistance_overrideOVD) then {
		_rscSliderAirOVD sliderSetRange [0,RR_commons_dynamicViewdistance_airViewdistance];
		if (_keepRatios) then {
			RR_commons_dynamicViewdistance_airOVD = (RR_commons_dynamicViewdistance_airViewdistance * _ratioAir);
		};
		if (RR_commons_dynamicViewdistance_airViewdistance < RR_commons_dynamicViewdistance_airOVD) then {
			RR_commons_dynamicViewdistance_airOVD = RR_commons_dynamicViewdistance_airViewdistance;
		};
		_rscSliderAirOVD sliderSetPosition RR_commons_dynamicViewdistance_airOVD;
	};
};


/* OVD Slider */
if (_control == _rscSliderGroundOVD) then {
	RR_commons_dynamicViewdistance_groundOVD = _value;
}; 
if (_control == _rscSliderAirOVD) then {
	RR_commons_dynamicViewdistance_airOVD = _value;
}; 



/* Zeige/verberge OVD Interface je nach Kontrollkästchen */
if (_control == _rscCheckBoxOverrideOVD) then {
	if (_value == 1) then {
		RR_commons_dynamicViewdistance_overrideOVD = true;
		if (RR_commons_dynamicViewdistance_firstTime) then {
			RR_commons_dynamicViewdistance_firstTime = false;
			RR_commons_dynamicViewdistance_groundOVD = 0;
			RR_commons_dynamicViewdistance_airOVD = 0;
			
			_rscSliderGroundOVD sliderSetRange [0,RR_commons_dynamicViewdistance_groundViewdistance];
			_rscSliderAirOVD    sliderSetRange [0,RR_commons_dynamicViewdistance_AirViewdistance];
			_rscSliderGroundOVD sliderSetPosition RR_commons_dynamicViewdistance_groundOVD;
			_rscSliderAirOVD sliderSetPosition RR_commons_dynamicViewdistance_airOVD;
		};
		{_x ctrlShow true} forEach [
			_rscTextMinDistOVD,
			_rscTextMaxDistOVD,
			_rscTextAirDistOVD,
			_rscTextGroundDistOVD,
			_rscSliderGroundOVD,
			_rscSliderAirOVD
		];
	} else {
		RR_commons_dynamicViewdistance_overrideOVD = false;
		{_x ctrlShow false} forEach [
			_rscTextMinDistOVD,
			_rscTextMaxDistOVD,
			_rscTextAirDistOVD,
			_rscTextGroundDistOVD,
			_rscSliderGroundOVD,
			_rscSliderAirOVD
		];
	};
};
if (_control == _rscCheckBoxGVDOVDRatio) then {
	if (_value == 1) then {
		RR_commons_dynamicViewdistance_keepRatio = true;
	} else {
		RR_commons_dynamicViewdistance_keepRatio = false;
	};
};






/* Apply changes */
if (((vehicle cameraOn) isKindOf "Air") && {((getPos cameraOn) select 2) >= RR_commons_dynamicViewdistance_heightThreshold}) then {
	setViewDistance RR_commons_dynamicViewdistance_airViewdistance;
	if (RR_commons_dynamicViewdistance_overrideOVD) then {
		setObjectViewDistance RR_commons_dynamicViewdistance_airOVD;
	} else {
		setObjectViewDistance 0;
	};
} else {
	setViewDistance RR_commons_dynamicViewdistance_groundViewdistance;
	if (RR_commons_dynamicViewdistance_overrideOVD) then {
		setObjectViewDistance RR_commons_dynamicViewdistance_groundOVD;
	} else {
		setObjectViewDistance 0;
	};
};
_rscTextMaxDistOVD ctrlSetText (format ["%1 m",(RR_commons_dynamicViewdistance_groundViewdistance max RR_commons_dynamicViewdistance_AirViewdistance)]);
_rscTextGroundDistOVD ctrlSetText ([(format ["%1 m",round RR_commons_dynamicViewdistance_groundOVD]),"Standard"] select (RR_commons_dynamicViewdistance_groundOVD == 0));
_rscTextAirDistOVD ctrlSetText ([(format ["%1 m",round RR_commons_dynamicViewdistance_airOVD]),"Standard"] select (RR_commons_dynamicViewdistance_airOVD == 0));

{_x ctrlShow false} forEach [_rscTextMinDistOVD, _rscTextMaxDistOVD];