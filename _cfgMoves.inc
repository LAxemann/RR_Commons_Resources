/* MovesBasic */
class CfgMovesBasic {
	class Default;
	class ManActions {
		RR_anim_coverFace_1 = "RR_anim_coverFace_1";
		RR_anim_cough_1 = "RR_anim_cough_1";
		RR_anim_cough_2 = "RR_anim_cough_3";
		RR_anim_holdDrink = "RR_anim_holdDrink";
		RR_anim_holdDrink_empty = "RR_anim_holdDrink_empty";
		RR_anim_drinking_bottleInHand = "RR_anim_drinking_bottleInHand";
	};
	class Actions {
		class NoActions: ManActions {
			RR_anim_coverFace_1[] = {"RR_anim_coverFace_1","Gesture"};
			RR_anim_cough_1[] = {"RR_anim_cough_1","Gesture"};
			RR_anim_cough_2[] = {"RR_anim_cough_2","Gesture"};
			RR_anim_holdDrink[] = {"RR_anim_holdDrink","Gesture"};
			RR_anim_holdDrink_empty[] = {"RR_anim_holdDrink_empty","Gesture"};
			RR_anim_drinking[] 	= {"RR_anim_drinking","Gesture"};
			RR_anim_drinking_bottleInHand[] 	= {"RR_anim_drinking_bottleInHand","Gesture"};
		};
		class PistolStandActions: NoActions {
			RR_anim_coverFace_1[] = {"RR_anim_coverFace_1_pst","Gesture"};
			RR_anim_cough_1[] = {"RR_anim_cough_1_pst","Gesture"};
			RR_anim_cough_2[] = {"RR_anim_cough_2_pst","Gesture"};
		};
	};
};



/* Gestures */
class CfgGesturesMale {
	class Default;
	class BlendAnims {
		rrDrinkHolding[] = {"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"MaskStart"};
		rrDrinking[] = {"Neck1",1,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"MaskStart"};
	};
	class States {
		/* Covering face */
		class RR_anim_coverFace_1: Default {
			file="\RR_commons_resources\animations\coverFace\coverFace_1.rtm";
			looped="false";
			speed=-1.3333;
			mask="handsWeapon";
			headBobStrength=0.35;
			headBobMode=2;
			rightHandIKCurve[] = {1};
			leftHandIKBeg="true";
			leftHandIKEnd="true";
			leftHandIKCurve[] = {0,1,0.01,0,0.95,0,1,1};
		};	
		class RR_anim_coverFace_1_pst: RR_anim_coverFace_1 {
			mask = "handsWeapon_pst";
		};
		/* Coughing */
		class RR_anim_cough_1: Default {
			file="\RR_commons_resources\animations\cough\cough_1.rtm";
			looped="false";
			speed=-1.3333;
			mask="handsWeapon";
			headBobStrength=0.35;
			headBobMode=5;
			leftHandIKBeg="true";
			leftHandIKEnd="true";
			rightHandIKCurve[] = {1};
			leftHandIKCurve[] = {
				0,1,
				0.01,0,
				0.93,0,
				0.96,1,
				1,1
			};
		};	
		class RR_anim_cough_1_pst: RR_anim_cough_1 {
			mask = "handsWeapon_pst";
		};
		class RR_anim_cough_2: Default {
			file="\RR_commons_resources\animations\cough\cough_2.rtm";
			looped="false";
			speed=-1.5666666;
			mask="handsWeapon";
			headBobStrength=0.35;
			headBobMode=5;
			rightHandIKCurve[] = {1};
			leftHandIKCurve[] = {
				0,1,
				0.01,0,
				0.95,0,
				1,1
			};
		};
		class RR_anim_cough_2_pst: RR_anim_cough_2 {
			mask = "handsWeapon_pst";
		};
		/* Drinking */
		class RR_anim_holdDrink: Default {
			file="\RR_commons_resources\animations\drinking\holdDrink.rtm";
			looped="true";
			speed=-6;
			mask="rrDrinkHolding";
			disableWeapons = 0;
			disableWeaponsLong = 0;
			headBobStrength=0.35;
			headBobMode=5;
			leftHandIKBeg="false";
			leftHandIKEnd="false";
			rightHandIKCurve[] = {1};
			leftHandIKCurve[] = {0};
			canReload = 0;
		};	
		class RR_anim_holdDrink_empty: RR_anim_holdDrink {
			file="";
			looped="false";
			speed=-0.1;
		};	
		class RR_anim_drinking: Default {
			file="\RR_commons_resources\animations\drinking\drinking.rtm";
			looped="false";
			speed=-1.5;
			mask="rrDrinking";
			disableWeapons = 0;
			disableWeaponsLong = 0;
			headBobStrength=1;
			headBobMode=5;
			leftHandIKBeg="true";
			leftHandIKEnd="true";
			leftHandIKCurve[] = {
				0,1,
				0.15,0,
				0.73,0,
				1,1
			};
			rightHandIKCurve[] = {1};
			canReload = 0;
			head = "headNo";  
		};
		class RR_anim_drinking_bottleInHand: RR_anim_drinking {
			leftHandIKBeg="false";
			leftHandIKEnd="false";
			leftHandIKCurve[] = {0};		
		};
	};
};



/* Move */
class CfgMovesMaleSdr: CfgMovesBasic {
	skeletonName = "OFP2_ManSkeleton";
	gestures = "CfgGesturesMale";
	class StandBase;
	class States {
		class RR_anim_horrorTwitchPose_1: StandBase {
			//actions = "RifleStandActions";
			file="\RR_commons_resources\animations\horrorTwitchPose\horrorTwitchPose_1.rtm";
			interpolationspeed = 200;
			looped = 1;
			speed = 0.6;
			static = 1;
			weaponLowered = 0;
		};
		class RR_anim_headlessScareMonster: StandBase {
			//actions = "RifleStandActions";
			file="\RR_commons_resources\animations\horror\RR_anim_headlessScareMonster.rtm";
			interpolationspeed = 200;
			looped = 0;
			speed = -5.6666666;
			mask = "bodyFullReal";
			static = 1;
			weaponLowered = 0;
		};
		class RR_anim_headlessScarePlayer: StandBase {
			//actions = "RifleStandActions";
			file="\RR_commons_resources\animations\horror\RR_anim_headlessScarePlayer.rtm";
			interpolationspeed = 200;
			looped = 0;
			speed = -5.6666666;
			mask = "bodyFullReal";
			static = 1;
			weaponLowered = 0;
			headbobmode = 5;
			disableWeapons = 1;
			disableWeaponsLong = 1;
			enableOptics = 0;
			showWeaponAim = 0;
			showHandGun = 0;
			turnSpeed = 0;
		};
		/* Coughing */
		class RR_anim_cough_3: StandBase {
			file="\RR_commons_resources\animations\cough\cough_3.rtm";
			looped="false";
			speed=-3.3333;
			mask = "bodyFullReal";
			headBobStrength=0.85;
			headBobMode=5;
			rightHandIKCurve[] = {1};
			leftHandIKCurve[] = {
				0,1,
				0.01,0,
				0.95,0,
				1,1
			};
			//static = 1;
			head = "headNo";  
			weaponLowered = 0;
			ConnectTo[] = {"AmovPercMstpSnonWnonDnon",0.02,"AmovPercMstpSnonWnonDnon_AmovPknlMstpSnonWnonDnon",0.02,"AmovPercMstpSnonWnonDnon_AmovPpneMstpSnonWnonDnon",0.02,"AmovPercMstpSnonWnonDnon_AmovPercMstpSrasWrflDnon",0.02,"AmovPercMstpSnonWnonDnon_AmovPercMstpSrasWpstDnon",0.02,"AmovPercMstpSnonWnonDnon_AmovPknlMstpSrasWlnrDnon",0.03,"AmovPercMstpSnonWnonDnon_AwopPercMstpSoptWbinDnon",0.02,"AmovPercMstpSnonWnonDnon_Scared",2,"AmovPercMstpSnonWnonDnon_Scared2",2,"AmovPercMstpSnonWnonDnon_SaluteIn",0.1,"AmovPercMstpSnonWnonDnon_EaseIn",0.1,"AmovPercMstpSnonWnonDnon_AmovPsitMstpSnonWnonDnon_ground",0.1,"AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon",0.1,"AwopPercMstpSgthWnonDnon_start",0.1,"LadderCivilOn_top",1,"LadderCivilOn_bottom",1,"AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon",0.02,"AmovPercMstpSnonWnonDnon_AcrgPknlMstpSnonWnonDnon_getInLow",0.02,"AmovPercMstpSnonWnonDnon_AcrgPknlMstpSnonWnonDnon_getInMedium",0.02,"AmovPercMstpSnonWnonDnon_AcrgPknlMstpSnonWnonDnon_getInHigh",0.02,"AmovPercMstpSnonWnonDnon_AcrgPknlMstpSnonWnonDnon_getInSDV",0.02,"AmovPercMstpSnonWnonDnon_AmovPercMstpSrasWlnrDnon",0.02,"AmovPercMstpSnonWnonDnon_exerciseKata",2,"AmovPercMstpSnonWnonDnon_exercisekneeBendA",2,"AmovPercMstpSnonWnonDnon_exercisekneeBendB",2,"AmovPercMstpSnonWnonDnon_exercisePushup",2,"ApanPercMstpSnonWnonDnon",0.02,"Acts_CivilStand_Default",1};
			InterpolateTo[] = {"AmovPercMstpSnonWnonDnon_turnL",0.02,"AmovPercMstpSnonWnonDnon_turnR",0.02,"AovrPercMstpSnonWnonDf",0.05,"AinvPknlMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon_medic",0.05,"AmovPercMrunSnonWnonDf",0.02,"AmovPercMwlkSnonWnonDf",0.02,"AmovPercMwlkSnonWnonDfl",0.02,"AmovPercMwlkSnonWnonDl",0.02,"AmovPercMwlkSnonWnonDbl",0.02,"AmovPercMwlkSnonWnonDb",0.02,"AmovPercMwlkSnonWnonDbr",0.02,"AmovPercMwlkSnonWnonDr",0.02,"AmovPercMwlkSnonWnonDfr",0.02,"AmovPercMrunSnonWnonDfl",0.02,"AmovPercMrunSnonWnonDl",0.02,"AmovPercMrunSnonWnonDbl",0.02,"AmovPercMrunSnonWnonDb",0.02,"AmovPercMrunSnonWnonDbr",0.02,"AmovPercMrunSnonWnonDr",0.02,"AmovPercMrunSnonWnonDfr",0.02,"AmovPercMevaSnonWnonDf",0.02,"AmovPercMevaSnonWnonDfl",0.02,"AmovPercMevaSnonWnonDfr",0.02,"AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon",0.02,"AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon_Putdown",0.02,"Unconscious",0.02,"AmovPercMstpSnonWnonDnon_AcinPknlMwlkSnonWnonDb_1",0.1,"Helper_SwitchToCarrynon",0.2,"AswmPercMstpSnonWnonDnon",0.3,"AsswPercMstpSnonWnonDnon",0.3,"AbswPercMstpSnonWnonDnon",0.3,"HaloFreeFall_non",10.2,"AmovPercMstpSnonWnonDnon_falling",0.02,"AsdvPercMstpSnonWnonDnon",2.02,"AdvePercMstpSnonWnonDnon",2,"AbdvPercMstpSnonWnonDnon",2,"AfalPercMstpSnonWnonDnon",0.025,"HubSpectator_standU",1,"HubSpectator_walkU",1,"AswmPercMrunSnonWnonDf",0.05,"AsswPercMrunSnonWnonDf",0.05,"AbswPercMrunSnonWnonDf",0.05,"Campaign_Base",0.5,"CutSceneAnimationBase",0.5,"Acts_A_M01_briefing",0.5,"Acts_A_M02_briefing",0.5,"Acts_A_M03_briefing",0.5,"Acts_A_M04_briefing",0.5,"Acts_A_M05_briefing",0.5,"Acts_A_OUT_briefing",0.5,"Acts_B_hub01_briefing",0.5,"Acts_B_M01_briefing",0.5,"Acts_B_M02_briefing",0.5,"Acts_B_M03_briefing",0.5,"Acts_B_M05_briefing",0.5,"Acts_B_m06_briefing",0.5,"Acts_B_out2_briefing",0.5,"Acts_carFixingWheel",0.5,"Acts_WarmupBase",0.1,"Acts_WarmupBaseKneel",0.1,"AmovPercMlmpSnonWnonDf",0.05,"AmovPercMlmpSnonWnonDfl",0.05,"AmovPercMlmpSnonWnonDl",0.05,"AmovPercMlmpSnonWnonDbl",0.05,"AmovPercMlmpSnonWnonDb",0.05,"AmovPercMlmpSnonWnonDbr",0.05,"AmovPercMlmpSnonWnonDr",0.05,"AmovPercMlmpSnonWnonDfr",0.05,"Acts_ExecutionVictim_Loop",0.5,"Acts_Executioner_StandingLoop",0.5,"CutSceneAnimationSmk",0.1,"UnconsciousMedicFromUnarmed",0.2,"Acts_CivilStand_Default",1};
		};
		class RR_anim_cough_4: StandBase {
			file="\RR_commons_resources\animations\cough\cough_4.rtm";
			looped="false";
			speed=-6.666;
			mask = "bodyFullReal";
			headBobStrength=1;
			headBobMode=5;
			rightHandIKCurve[] = {1};
			leftHandIKCurve[] = {
				0,1,
				0.01,0,
				0.95,0,
				1,1
			};
			head = "headNo";  
			//static = 1;
			weaponLowered = 0;
			ConnectTo[] = {"AmovPercMstpSnonWnonDnon",0.02,"AmovPercMstpSnonWnonDnon_AmovPknlMstpSnonWnonDnon",0.02,"AmovPercMstpSnonWnonDnon_AmovPpneMstpSnonWnonDnon",0.02,"AmovPercMstpSnonWnonDnon_AmovPercMstpSrasWrflDnon",0.02,"AmovPercMstpSnonWnonDnon_AmovPercMstpSrasWpstDnon",0.02,"AmovPercMstpSnonWnonDnon_AmovPknlMstpSrasWlnrDnon",0.03,"AmovPercMstpSnonWnonDnon_AwopPercMstpSoptWbinDnon",0.02,"AmovPercMstpSnonWnonDnon_Scared",2,"AmovPercMstpSnonWnonDnon_Scared2",2,"AmovPercMstpSnonWnonDnon_SaluteIn",0.1,"AmovPercMstpSnonWnonDnon_EaseIn",0.1,"AmovPercMstpSnonWnonDnon_AmovPsitMstpSnonWnonDnon_ground",0.1,"AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon",0.1,"AwopPercMstpSgthWnonDnon_start",0.1,"LadderCivilOn_top",1,"LadderCivilOn_bottom",1,"AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon",0.02,"AmovPercMstpSnonWnonDnon_AcrgPknlMstpSnonWnonDnon_getInLow",0.02,"AmovPercMstpSnonWnonDnon_AcrgPknlMstpSnonWnonDnon_getInMedium",0.02,"AmovPercMstpSnonWnonDnon_AcrgPknlMstpSnonWnonDnon_getInHigh",0.02,"AmovPercMstpSnonWnonDnon_AcrgPknlMstpSnonWnonDnon_getInSDV",0.02,"AmovPercMstpSnonWnonDnon_AmovPercMstpSrasWlnrDnon",0.02,"AmovPercMstpSnonWnonDnon_exerciseKata",2,"AmovPercMstpSnonWnonDnon_exercisekneeBendA",2,"AmovPercMstpSnonWnonDnon_exercisekneeBendB",2,"AmovPercMstpSnonWnonDnon_exercisePushup",2,"ApanPercMstpSnonWnonDnon",0.02,"Acts_CivilStand_Default",1};
			InterpolateTo[] = {"AmovPercMstpSnonWnonDnon_turnL",0.02,"AmovPercMstpSnonWnonDnon_turnR",0.02,"AovrPercMstpSnonWnonDf",0.05,"AinvPknlMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon_medic",0.05,"AmovPercMrunSnonWnonDf",0.02,"AmovPercMwlkSnonWnonDf",0.02,"AmovPercMwlkSnonWnonDfl",0.02,"AmovPercMwlkSnonWnonDl",0.02,"AmovPercMwlkSnonWnonDbl",0.02,"AmovPercMwlkSnonWnonDb",0.02,"AmovPercMwlkSnonWnonDbr",0.02,"AmovPercMwlkSnonWnonDr",0.02,"AmovPercMwlkSnonWnonDfr",0.02,"AmovPercMrunSnonWnonDfl",0.02,"AmovPercMrunSnonWnonDl",0.02,"AmovPercMrunSnonWnonDbl",0.02,"AmovPercMrunSnonWnonDb",0.02,"AmovPercMrunSnonWnonDbr",0.02,"AmovPercMrunSnonWnonDr",0.02,"AmovPercMrunSnonWnonDfr",0.02,"AmovPercMevaSnonWnonDf",0.02,"AmovPercMevaSnonWnonDfl",0.02,"AmovPercMevaSnonWnonDfr",0.02,"AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon",0.02,"AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon_Putdown",0.02,"Unconscious",0.02,"AmovPercMstpSnonWnonDnon_AcinPknlMwlkSnonWnonDb_1",0.1,"Helper_SwitchToCarrynon",0.2,"AswmPercMstpSnonWnonDnon",0.3,"AsswPercMstpSnonWnonDnon",0.3,"AbswPercMstpSnonWnonDnon",0.3,"HaloFreeFall_non",10.2,"AmovPercMstpSnonWnonDnon_falling",0.02,"AsdvPercMstpSnonWnonDnon",2.02,"AdvePercMstpSnonWnonDnon",2,"AbdvPercMstpSnonWnonDnon",2,"AfalPercMstpSnonWnonDnon",0.025,"HubSpectator_standU",1,"HubSpectator_walkU",1,"AswmPercMrunSnonWnonDf",0.05,"AsswPercMrunSnonWnonDf",0.05,"AbswPercMrunSnonWnonDf",0.05,"Campaign_Base",0.5,"CutSceneAnimationBase",0.5,"Acts_A_M01_briefing",0.5,"Acts_A_M02_briefing",0.5,"Acts_A_M03_briefing",0.5,"Acts_A_M04_briefing",0.5,"Acts_A_M05_briefing",0.5,"Acts_A_OUT_briefing",0.5,"Acts_B_hub01_briefing",0.5,"Acts_B_M01_briefing",0.5,"Acts_B_M02_briefing",0.5,"Acts_B_M03_briefing",0.5,"Acts_B_M05_briefing",0.5,"Acts_B_m06_briefing",0.5,"Acts_B_out2_briefing",0.5,"Acts_carFixingWheel",0.5,"Acts_WarmupBase",0.1,"Acts_WarmupBaseKneel",0.1,"AmovPercMlmpSnonWnonDf",0.05,"AmovPercMlmpSnonWnonDfl",0.05,"AmovPercMlmpSnonWnonDl",0.05,"AmovPercMlmpSnonWnonDbl",0.05,"AmovPercMlmpSnonWnonDb",0.05,"AmovPercMlmpSnonWnonDbr",0.05,"AmovPercMlmpSnonWnonDr",0.05,"AmovPercMlmpSnonWnonDfr",0.05,"Acts_ExecutionVictim_Loop",0.5,"Acts_Executioner_StandingLoop",0.5,"CutSceneAnimationSmk",0.1,"UnconsciousMedicFromUnarmed",0.2,"Acts_CivilStand_Default",1};
		};
	};
};