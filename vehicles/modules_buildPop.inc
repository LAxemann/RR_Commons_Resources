class RR_Commons_buildPop_module_initBuildPop: Module_F {
	scope = 2;
	displayName = "BuildPop - Init synced Triggers";
	category = "RR_Commons_MissionTools_Category";
	function = "RR_Commons_modules_fnc_buildPopModuleInit";
	functionPriority = 1;
	isGlobal = 0;
	isTriggerActivated = 0;
	isDisposable = 1;
	is3den = 0;
	class Arguments: ArgumentsBaseUnits {
		class side {
			displayName = "Side";
			description = "Which side to spawn the units in";
			typeName = "STRING";
			defaultValue = "EAST";
		};	
		class unitPool {
			displayName = "Unitpool";
			description = "Unit classnames to be used (separated by , ) OR easySpawn template name.";
			typeName = "STRING";
			defaultValue = """O_soldier_F""";
		};	
		class unitCount {
			displayName = "Unit count";
			description = "How many units to spawn inside the building(s)";
			typeName = "NUMBER";
			defaultValue = 5;
		};	
		class enableDynamicSimulation {
			displayName = "Enable dynamic simulation";
			description = "Whether or not spawned units should make use of Dynamic Simulation";
			typeName = "BOOL";
			defaultValue = true;
		};	
		class blackList {
			displayName = "Index blacklist";
			description = "Indizes of building positions which should not be used, separated by , .";
			typeName = "STRING";
			defaultValue = "";
		};	
		class customCode {
			displayName = "Custom code";
			description = "Code which is executed when the group spawns. Group is handed over as _createdGroup.";
			typeName = "STRING";
			defaultValue = "";
		};	
	};
};