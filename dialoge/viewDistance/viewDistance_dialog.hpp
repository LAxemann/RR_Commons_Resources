class RR_commons_viewDistance_dialog {
	idd = 5051;
	movingEnable = 0;
	class ControlsBackground {
		class RR_commons_viewDistance_rscBackGround: RscText {
			idc = 1000;
			x = 0.323801 * safezoneW + safezoneX;
			y = 0.349576 * safezoneH + safezoneY;
			w = 0.347994 * safezoneW;
			h = 0.31965 * safezoneH;
			colorBackground[] = {0,0.3,0.6,1};
		};
		class RR_commons_viewDistance_rscTitleText: RscText {
			idc = 1001;
			text = "Sichtweiten-Einstellung"; //--- ToDo: Localize;
			x = 0.323801 * safezoneW + safezoneX;
			y = 0.311971 * safezoneH + safezoneY;
			w = 0.110125 * safezoneW;
			h = 0.0470074 * safezoneH;
		};
		class RR_commons_viewDistance_rscGroundText: RscText {
			idc = 1002;
			text = "Am Boden:"; //--- ToDo: Localize;
			x = 0.328206 * safezoneW + safezoneX;
			y = 0.396584 * safezoneH + safezoneY;
			w = 0.110125 * safezoneW;
			h = 0.0470074 * safezoneH;
		};
		class RR_commons_viewDistance_rscAirText: RscText {
			idc = 1003;
			text = "In Luftfahrzeugen:"; //--- ToDo: Localize;
			x = 0.328206 * safezoneW + safezoneX;
			y = 0.481197 * safezoneH + safezoneY;
			w = 0.110125 * safezoneW;
			h = 0.0470074 * safezoneH;
		};
		class RR_commons_viewDistance_rscTextHintGround: RscText {
			idc = 1016;
			text = "Geländesichtweite"; //--- ToDo: Localize;
			x = 0.42071 * safezoneW + safezoneX;
			y = 0.340175 * safezoneH + safezoneY;
			w = 0.110125 * safezoneW;
			h = 0.0470074 * safezoneH;
		};		
		class RR_commons_viewDistance_rscTextHintAir: RscText {
			idc = 1017;
			text = "Objektsichtweite"; 
			x = 0.57048 * safezoneW + safezoneX;
			y = 0.340175 * safezoneH + safezoneY;
			w = 0.110125 * safezoneW;
			h = 0.0470074 * safezoneH;
		};
		class RR_commons_viewDistance_rscTextOverrideOVDText: RscText {
			idc = 1014;
			text = "Objektsichtweite überschreiben:";
			x = 0.328206 * safezoneW + safezoneX;
			y = 0.594015 * safezoneH + safezoneY;
			w = 0.110125 * safezoneW;
			h = 0.0376059 * safezoneH;
		};
		class RR_commons_viewDistance_rscTextGVDOVDRatioText: RscText {
			idc = 1015;
			text = "Verhältnis GeländeSW <-> ObjektSW beibehalten:";
			x = 0.328206 * safezoneW + safezoneX;
			y = 0.622219 * safezoneH + safezoneY;
			w = 0.176199 * safezoneW;
			h = 0.0376059 * safezoneH;
		};
	};
	class Controls {
		/* Slider */
		class RR_commons_viewDistance_rscSliderGroundDistance: RscSlider {
			idc = 1900;
			x = 0.40309 * safezoneW + safezoneX;
			y = 0.415387 * safezoneH + safezoneY;
			w = 0.10572 * safezoneW;
			h = 0.0188029 * safezoneH;
			onSliderPosChanged = "_this call RR_commons_dynamicViewDistance_fnc_updateViewdistance";
		};
		class RR_commons_viewDistance_rscSliderAirDistance: RscSlider {
			idc = 1901;
			x = 0.40309 * safezoneW + safezoneX;
			y = 0.528204 * safezoneH + safezoneY;
			w = 0.10572 * safezoneW;
			h = 0.0188029 * safezoneH;
			onSliderPosChanged = "_this call RR_commons_dynamicViewDistance_fnc_updateViewdistance";
		};
		class RR_commons_viewDistance_rscSliderGroundDistanceOVD: RscSlider {
			idc = 1902;
			x = 0.548455 * safezoneW + safezoneX;
			y = 0.415387 * safezoneH + safezoneY;
			w = 0.10572 * safezoneW;
			h = 0.0188029 * safezoneH;
			onSliderPosChanged = "_this call RR_commons_dynamicViewDistance_fnc_updateViewdistance";
		};
		class RR_commons_viewDistance_rscSliderAirDistanceOVD: RscSlider {
			idc = 1903;
			x = 0.548455 * safezoneW + safezoneX;
			y = 0.528204 * safezoneH + safezoneY;
			w = 0.10572 * safezoneW;
			h = 0.0188029 * safezoneH;
			onSliderPosChanged = "_this call RR_commons_dynamicViewDistance_fnc_updateViewdistance";
		};

		class RR_commons_viewDistance_rscButtonClose: RscButton {
			idc = 1600;
			text = "Schließen";
			x = 0.636554 * safezoneW + safezoneX;
			y = 0.631621 * safezoneH + safezoneY;
			w = 0.0352399 * safezoneW;
			h = 0.0470074 * safezoneH;
			colorBackground[] = {0,0,0,0};
			action = "closeDialog 0";
		};
		
		/* Dynamische Texte */
		class RR_commons_viewDistance_rscMinText: RscText {
			idc = 1004;
			text = "1000 Meter";
			x = 0.39428 * safezoneW + safezoneX;
			y = 0.377781 * safezoneH + safezoneY;
			w = 0.0484548 * safezoneW;
			h = 0.0376059 * safezoneH;
			colorText[] = {1,1,1,0.8};
		};
		class RR_commons_viewDistance_rscMaxText: RscText {
			idc = 1005;
			text = "7000 Meter"; 
			x = 0.477975 * safezoneW + safezoneX;
			y = 0.377781 * safezoneH + safezoneY;
			w = 0.0484548 * safezoneW;
			h = 0.0376059 * safezoneH;
			colorText[] = {1,1,1,0.8};
		};
		class RR_commons_viewDistance_rscAirValueText: RscText {
			idc = 1006;
			text = "1500 Meter";
			x = 0.433925 * safezoneW + safezoneX;
			y = 0.537606 * safezoneH + safezoneY;
			w = 0.110125 * safezoneW;
			h = 0.0470074 * safezoneH;
		};
		class RR_commons_viewDistance_rscGroundValueText: RscText {
			idc = 1007;
			text = "1500 Meter"; 
			x = 0.433925 * safezoneW + safezoneX;
			y = 0.424788 * safezoneH + safezoneY;
			w = 0.110125 * safezoneW;
			h = 0.0470074 * safezoneH;
		};
		class RR_commons_viewDistance_rscGroundValueTextOVD: RscText {
			idc = 1008;
			text = "1500 m";
			x = 0.583695 * safezoneW + safezoneX;
			y = 0.424788 * safezoneH + safezoneY;
			w = 0.0484548 * safezoneW;
			h = 0.0470074 * safezoneH;
		};
		class RR_commons_viewDistance_rscAirValueTextOVD: RscText {
			idc = 1009;
			text = "1500 m";
			x = 0.583695 * safezoneW + safezoneX;
			y = 0.537606 * safezoneH + safezoneY;
			w = 0.0484548 * safezoneW;
			h = 0.0470074 * safezoneH;
		};
		class RR_commons_viewDistance_rscMinTextOVD: RscText {
			idc = 1012;
			text = "0 m";
			x = 0.539645 * safezoneW + safezoneX;
			y = 0.377781 * safezoneH + safezoneY;
			w = 0.0484548 * safezoneW;
			h = 0.0376059 * safezoneH;
			colorText[] = {1,1,1,0.8};
		};
		class RR_commons_viewDistance_rscMaxTextOVD: RscText {
			idc = 1013;
			text = "7000 Meter"; 
			x = 0.62334 * safezoneW + safezoneX;
			y = 0.377781 * safezoneH + safezoneY;
			w = 0.0484548 * safezoneW;
			h = 0.0376059 * safezoneH;
			colorText[] = {1,1,1,0.8};
		};
		/* Checkboxes */
		class RR_commons_viewDistance_rscCheckBoxOverrideOVD: RscCheckbox {
			idc = 2800;
			x = 0.510131 * safezoneW + safezoneX;
			y = 0.597775 * safezoneH + safezoneY;
			w = 0.013215 * safezoneW;
			h = 0.0282044 * safezoneH;
			onCheckedChanged = "_this call RR_commons_dynamicViewDistance_fnc_updateViewdistance";
		};
		class RR_commons_viewDistance_rscCheckBoxGVDOVDRatio: RscCheckbox {
			idc = 2801;
			x = 0.509603 * safezoneW + safezoneX;
			y = 0.627108 * safezoneH + safezoneY;
			w = 0.013215 * safezoneW;
			h = 0.0282044 * safezoneH;
			onCheckedChanged = "_this call RR_commons_dynamicViewDistance_fnc_updateViewdistance";
		};
	};
};