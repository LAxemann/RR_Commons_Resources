class RR_Commons_easySpawn_module_setGroupTemplate: Module_F {
	scope = 2;
	displayName = "EasySpawn - Set Group as template";
	category = "RR_Commons_MissionTools_Category";
	function = "RR_Commons_modules_fnc_easySpawnSetGroupTemplate";
	functionPriority = 1;
	isGlobal = 0;
	isTriggerActivated = 1;
	isDisposable = 1;
	is3den = 0;
	class Arguments: ArgumentsBaseUnits {
		class templateName {
			displayName = "Template name";
			description = "Enter name to be used as an easySpawn template. (String)";
			typeName = "STRING";
			defaultValue = "exampleName";
		};	
		class deleteOriginalGroup {
			displayName = "Delete original group";
			description = "If checked, the original group will be deleted.";
			typeName = "BOOL";
			defaultValue = true;
		};	
	};
};
class RR_Commons_easySpawn_module_spawnGroup: Module_F {
	scope = 2;
	displayName = "EasySpawn - Spawn group from template";
	category = "RR_Commons_MissionTools_Category";
	function = "RR_Commons_modules_fnc_easySpawnSpawnGroup";
	functionPriority = 1;
	isGlobal = 0;
	isTriggerActivated = 1;
	isDisposable = 0;
	is3den = 0;
	class Arguments: ArgumentsBaseUnits {
		class templateName {
			displayName = "Template name";
			description = "Template to spawn (string)";
			typeName = "STRING";
			defaultValue = "exampleName";
		};	
		class deleteOriginalGroup {
			displayName = "Delete original group";
			description = "If checked and synced to a unit, the original group will be deleted.";
			typeName = "BOOL";
			defaultValue = true;
		};	
		class customSide {
			displayName = "Custom side";
			description = "Spawn new group on a custom side. Available: WEST, EAST, RESISTANCE, CIVILIAN";
			typeName = "STRING";
			defaultValue = "";
		};	
		class noVehicles {
			displayName = "Spawn without vehicles";
			description = "If checked, the group will spawn without its vehicles. Crew members will still spawn!";
			typeName = "BOOL";
			defaultValue = false;
		};	
	};
};