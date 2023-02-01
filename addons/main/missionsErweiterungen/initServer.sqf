/* Persistenz */
if (RR_commons_persistence) then {
	if (isNil "RR_commons_persistence_token") then {RR_commons_persistence_token = ""};
	if (isNil "RR_commons_persistence_campaignName") then {RR_commons_persistence_campaignName = "MeineKampagne"};
	if (isNil "RR_commons_persistence_customSaveFunction") then {RR_commons_persistence_customSaveFunction = ""};
	if (isNil "RR_commons_persistence_customLoadFunction") then {RR_commons_persistence_customLoadFunction = ""};
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
/* buildPop */
[] spawn {
	waitUntil {sleep 0.1; time > 0.2};
	call RR_commons_buildPop_fnc_init3denTriggers;
};



/* AntiCheat */
/*
[] spawn {
	waitUntil {sleep 0.1; time > 0};
	RR_Commons_antiCheat_serverMods = call RR_Commons_antiCheat_fnc_createLocalModList;
	addMissionEventHandler ["PlayerConnected", {
		params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
		if (_jip) then {
			remoteExecCall ["RR_Commons_antiCheat_fnc_clientAnswerServer",_owner];
		};
	}];

	[] spawn {
		{
			if !(isNull _x) then {
				remoteExecCall ["RR_Commons_antiCheat_fnc_clientSendStringToServer",(owner _x)];
			};
			sleep 0.5;
		} forEach allPlayers;
	};
};
*/