class RR_commons_teleport_dialog {
	idd = 5050;
	movingEnable = 0;
	class ControlsBackground {
		class RR_commons_teleport_rscBackGround: RscText
		{
			idc = 1000;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.165 * safezoneH;
			colorBackground[] = {0,0.3,0.6,1};
		};
		class RR_commons_teleport_rscTitleText: RscText
		{
			idc = 1001;
			text = "Teleport-Ziel wählen"; 
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.066 * safezoneH;
		};
		class RR_commons_teleport_rscTextSide: RscText
		{
			idc = 1002;
			text = "Einheiten auf Seite"; 
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.066 * safezoneH;
		};
		class RR_commons_teleport_rscTextGroup: RscText
		{
			idc = 1003;
			text = "Einheiten in Gruppe"; 
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.066 * safezoneH;
		};
		class RR_commons_teleport_rscTextMisc: RscText
		{
			idc = 1004;
			text = "Sonstige Ziele"; 
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.066 * safezoneH;
		};
	};
	class Controls {
		class RR_commons_teleport_rscButtonClose: RscButton
		{
			idc = 1600;
			text = "Schließen"; 
			x = 0.639219 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "RR_commons_teleport_target = objNull; closeDialog 0";
		};
		class RR_commons_teleport_rscComboBoxSide: RscCombo
		{
			idc = 2100;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			onlbselchanged = "_this spawn RR_commons_teleport_fnc_teleport";
		};
		class RR_commons_teleport_rscComboBoxGroup: RscCombo
		{
			idc = 2101;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			onlbselchanged = "_this spawn RR_commons_teleport_fnc_teleport";
		};
		class RR_commons_teleport_rscComboBoxMisc: RscCombo
		{
			idc = 2102;
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			onlbselchanged = "_this spawn RR_commons_teleport_fnc_teleport";
		};
	};
};