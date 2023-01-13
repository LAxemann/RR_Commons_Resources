class EmptyDetector {
	class Attributes {
		class RR_commons_buildPop_Active {
			displayName = "buildPop: Aktiviere buildPop";
			control = "Checkbox";
			property = "RR_commons_buildPop_Active_property";
			expression = "if (_value) then {if (isNil 'RR_commons_buildPop_3denTriggers') then {RR_commons_buildPop_3denTriggers = []}; RR_commons_buildPop_3denTriggers pushBackUnique _this;};";
			defaultValue = false;
			tooltip = "Wandelt den Trigger in einen RR buildPop Trigger um. Mehr Infos im internen Discord!";
		};
		class RR_commons_buildPop_side {
			displayName = "buildPop: Seite";
			control = "EditShort";
			property = "RR_commons_buildPop_side_property";
			expression = "_this setVariable ['RR_commons_buildPop_3denSide',[_value,'Side'] call RR_commons_core_fnc_parseAnyControlType]";
			defaultValue = "EAST";
			tooltip = "Mögliche Seiten: WEST, EAST, RESISTANCE, CIVILIAN";
		};
		class RR_commons_buildPop_unitPool {
			displayName = "buildPop: Klassennamen";
			control = "Edit";
			property = "RR_commons_buildPop_unitPool_property";
			expression = "_this setVariable ['RR_commons_buildPop_3denUnitPool',[_value,'StringToArray'] call RR_commons_core_fnc_parseAnyControlType]";
			defaultValue = "''";
			tooltip = "Zu verwendende Einheitenklassen ODER EASYSPAWN-TEMPLATENAME. Um eine Klasse zu erhalten, Rechtsklick auf die Einheit >> Log >> Log Classes as String to Clipboard";
		};
		class RR_commons_buildPop_unitCount {
			displayName = "buildPop: Einheitenzahl (opt)";
			control = "EditShort";
			property = "RR_commons_buildPop_unitCount_property";
			expression = "_this setVariable ['RR_commons_buildPop_3denUnitCount',[_value,'Number'] call RR_commons_core_fnc_parseAnyControlType]";
			defaultValue = "0";
			tooltip = "Anzahl zu spawnender Einheiten";
		};
		class RR_commons_buildPop_dynamicSimulation {
			displayName = "buildPop: Dynamic Simulation (opt)";
			control = "Checkbox";
			property = "RR_commons_buildPop_dynamicSimulation_property";
			expression = "_this setVariable ['RR_commons_buildPop_3denDynamicSimulation',_value]";
			defaultValue = true;
			tooltip = "Soll Dynamic Simulation standardmäßig aktiviert sein?";
		};
		class RR_commons_buildPop_blackList {
			displayName = "buildPop: Blacklist (opt)";
			control = "EditArray";
			property = "RR_commons_buildPop_blackList_property";
			expression = "_this setVariable ['RR_commons_buildPop_3denBlacklist',[_value,'Array'] call RR_commons_core_fnc_parseAnyControlType]";
			defaultValue = "[]";
			tooltip = "Indizes der Gebäudepositionen, die nicht verwendet werden sollen. Trennung durch Kommata";
		};
		class RR_commons_buildPop_code {
			displayName = "buildPop: Custom Code (opt)";
			control = "Edit";
			property = "RR_commons_buildPop_code_property";
			expression = "_this setVariable ['RR_commons_buildPop_3denCode',[_value,'String'] call RR_commons_core_fnc_parseAnyControlType]";
			defaultValue = "nil";
			tooltip = "Code (als String), der für die gespawnete GRUPPE ausgeführt werden soll. Gruppe wird mit _createdGroup angesprochen.";
		};
	};
};