/* MovesBasic */
class CfgMovesBasic {
	class Default;
	class ManActions {
		RR_anim_coverFace_1 = "RR_anim_coverFace_1";
		RR_anim_cough_1 = "RR_anim_cough_1";
		RR_anim_cough_2 = "RR_anim_cough_3";
		RR_anim_cough_3 = "RR_anim_cough_3";
		RR_anim_cough_4 = "RR_anim_cough_4";
	};
	class Actions {
		class NoActions: ManActions {
			RR_anim_coverFace_1[] = {"RR_anim_coverFace_1","Gesture"};
			RR_anim_cough_1[] = {"RR_anim_cough_1","Gesture"};
			RR_anim_cough_2[] = {"RR_anim_cough_2","Gesture"};
			RR_anim_cough_3[] = {"RR_anim_cough_3","Gesture"};
			RR_anim_cough_4[] = {"RR_anim_cough_4","Gesture"};
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
		class RR_anim_cough_3: Default {
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
			static = 1;
			weaponLowered = 0;
		};
		class RR_anim_cough_4: Default {
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
			static = 1;
			weaponLowered = 0;
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
	};
};