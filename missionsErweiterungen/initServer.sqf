/* Persistenz */
if (RR_commons_persistence) then {
	if (isNil "RR_commons_persistence_token") then {RR_commons_persistence_token = ""};
	if (isNil "RR_commons_persistence_campaignName") then {RR_commons_persistence_campaignName = "MeineKampagne"};
	if (isNil "RR_commons_persistence_baseTrigger") then {
		RR_commons_persistence_baseTrigger = []
	} else {
		RR_commons_persistence_baseTrigger = [RR_commons_persistence_baseTrigger] call RR_commons_core_fnc_parse3denArray;
	};
	[RR_commons_persistence_Token, RR_commons_persistence_campaignName] call RR_commons_persistence_fnc_initSession;
};
/* HABO */
if (isNil "RR_commons_habo_3denArray") then {
	RR_commons_habo_3denArray = []
} else {
	RR_commons_habo_3denArray = ("[" + RR_commons_habo_3denArray + "]");
	RR_commons_habo_3denArray = call compile RR_commons_habo_3denArray;
	{
		_x call RR_commons_habo_fnc_registerGroups;
	} forEach RR_commons_habo_3denArray;
};