class Default;
class ItemCore: Default {};
class InventoryItem_Base_F;
class CBA_MiscItem_ItemInfo: InventoryItem_Base_F {};
class CBA_MiscItem: ItemCore {
	class ItemInfo: CBA_MiscItem_ItemInfo {};
};
class ACE_ItemCore: CBA_MiscItem {};