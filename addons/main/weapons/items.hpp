class RR_itemGeigerCounter: ACE_ItemCore {
	author = "LAxemann";
	//_generalMacro = "RR_itemGeigerCounter";
	scope = 2;
    scopeCurator = 2;
    scopeArsenal = 2;
	displayName = "Geigerzähler";
	picture = "\A3\Weapons_F\Data\UI\gear_item_radio_ca.paa";
	model = "\a3\Weapons_F\Ammo\mag_radio.p3d";
	descriptionShort = "Gibt akustische Signale bei erhöhter Radioaktivität.";
	class ItemInfo: CBA_MiscItem_ItemInfo {
		mass = 7;
		//type = 201;
	}; 
};