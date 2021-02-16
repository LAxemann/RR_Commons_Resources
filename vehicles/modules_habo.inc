class RR_Commons_habo_module_registerGroups: Module_F {
	scope = 2;
	displayName = "HABO - Register Groups as metaGroup";
	category = "RR_Commons_MissionTools_Category";
	function = "RR_Commons_modules_fnc_haboRegisterGroups";
	functionPriority = 1;
	isGlobal = 0;
	isTriggerActivated = 1;
	isDisposable = 1;
	is3den = 0;
	class Arguments: ArgumentsBaseUnits {
		class metaGroupName {
			displayName = "MetaGroup name";
			description = "Desired name of the metaGroup";
			typeName = "STRING";
			defaultValue = "exampleName";
		};	
		class isDefender {
			displayName = "Register as defender";
			description = "If checked, the metaGroup will be able to request metaGroups of type ''Support''";
			typeName = "BOOL";
			defaultValue = true;
		};
		class isSupport {
			displayName = "Register as support";
			description = "If checked, the metaGroup will be able to support metaGroups of type ''Defender''";
			typeName = "BOOL";
			defaultValue = false;
		};
		class range {
			displayName = "Defend/Support radius";
			description = "Maximum distance in which the group can either request or provide support from. 0 = No limit.";
			typeName = "NUMBEER";
			defaultValue = 0;
		};	
		class maxSupports {
			displayName = "Max. supports";
			description = "Maximum amount of ''Support'' groups the metaGroup can call in. Default 256.";
			typeName = "NUMBEER";
			defaultValue = 256;
		};	
	};
};