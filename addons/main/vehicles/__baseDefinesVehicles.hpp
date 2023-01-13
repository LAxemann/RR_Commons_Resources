class All;
class Static: All {};
class Building: Static {};
class Strategic: Building {};
class ReammoBox: Strategic {};
class WeaponHolder: ReammoBox {};
class Item_Base_F: WeaponHolder {};
class Logic: All{};
class Module_F: Logic {
	class ArgumentsBaseUnits;
	class AttributesBase {
		class Default;
		class Edit;					
		class Combo;				
		class Checkbox;				
		class CheckboxNumber;		
		class ModuleDescription;	
		class Units;				
	};
	class ModuleDescription {
		class AnyBrain;
	};
};