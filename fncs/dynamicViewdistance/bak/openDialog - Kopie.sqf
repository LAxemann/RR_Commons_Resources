createDialog "RR_commons_viewDistance_dialog";
private _parentDisplay = (findDisplay 5051);

private _rscTextMinDist  	= _parentDisplay displayCtrl 1004;
private _rscTextMaxDist  	= _parentDisplay displayCtrl 1005;
private _rscTextAirDist  	= _parentDisplay displayCtrl 1006;
private _rscTextGroundDist 	= _parentDisplay displayCtrl 1007;
private _rscSliderGround	= _parentDisplay displayCtrl 1900;
private _rscSliderAir		= _parentDisplay displayCtrl 1901;

/* Init the controls */
_rscTextMinDist ctrlSetText (format ["%1 m",RR_commons_viewDistance_min]);
_rscTextMaxDist ctrlSetText (format ["%1 m",RR_commons_viewDistance_max]);
_rscTextGroundDist ctrlSetText (format ["%1 m",round RR_commons_dynamicViewdistance_groundViewdistance]);
_rscTextAirDist    ctrlSetText (format ["%1 m",round RR_commons_dynamicViewdistance_airViewdistance]);

_rscSliderGround sliderSetRange [RR_commons_viewDistance_min,RR_commons_viewDistance_max];
_rscSliderAir    sliderSetRange [RR_commons_viewDistance_min,RR_commons_viewDistance_max];

_rscSliderGround sliderSetPosition RR_commons_dynamicViewdistance_groundViewdistance;
_rscSliderAir    sliderSetPosition RR_commons_dynamicViewdistance_AirViewdistance;