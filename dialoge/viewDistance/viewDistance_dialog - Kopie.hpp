class RR_commons_viewDistance_dialog {
	idd = 5051;
	movingEnable = 0;
	class ControlsBackground {
		class RR_commons_viewDistance_rscBackGround: RscText
		{
			idc = 1000;
			x = 0.36078 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.304219 * safezoneW;
			h = 0.187 * safezoneH;
			colorBackground[] = {0,0.3,0.6,1};
		};
		class RR_commons_viewDistance_rscTitleText: RscText
		{
			idc = 1001;
			text = "Sichtweiten-Einstellung"; 
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RR_commons_viewDistance_rscGroundText: RscText
		{
			idc = 1002;
			text = "Am Boden:"; 
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class RR_commons_viewDistance_rscAirText: RscText
		{
			idc = 1003;
			text = "In Luftfahrzeugen:"; 
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.055 * safezoneH;
		};		
	};
	class Controls {
		class RR_commons_viewDistance_rscSliderGroundDistance: RscSlider
		{
			idc = 1900;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.033 * safezoneH;
			onSliderPosChanged = "_this call RR_commons_dynamicViewDistance_fnc_updateViewdistance";
		};
		class RR_commons_viewDistance_rscSliderAirDistance: RscSlider
		{
			idc = 1901;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.033 * safezoneH;
			onSliderPosChanged = "_this call RR_commons_dynamicViewDistance_fnc_updateViewdistance";
		};

		class RR_commons_viewDistance_rscButtonClose: RscButton
		{
			idc = 1600;
			text = "Schließen"; 
			x = 0.618594 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "closeDialog 0";
		};
		class RR_commons_viewDistance_rscMinText: RscText
		{
			idc = 1004;
			text = "1000 Meter"; 
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {1,1,1,0.8};
		};
		class RR_commons_viewDistance_rscMaxText: RscText
		{
			idc = 1005;
			text = "7000 Meter"; 
			x = 0.572187 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {1,1,1,0.8};
		};
		class RR_commons_viewDistance_rscAirValueText: RscText
		{
			idc = 1006;
			text = "1500 Meter"; 
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class RR_commons_viewDistance_rscGroundValueText: RscText
		{
			idc = 1007;
			text = "1500 Meter"; 
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.055 * safezoneH;
		};
	};
};