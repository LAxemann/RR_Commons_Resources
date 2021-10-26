class RR_commons_habo {
	displayName = "HABO (Help A Brother Out)";
	collapsed = 1;
	class Attributes {
		class RR_commons_habo_Text1 {
			property = "RR_commons_habo_Text1_Property";
			description = "HABO ermöglicht es, komplexe, sich gegenseitig unterstützende KI Gruppen zu erstellen. Eine Gruppe kann Verteidiger (Defender), Unterstützer (Support) oder beides (Both sein).<br/><br/>Beispiel:<br/>[[meineGruppe],''VerteidigerGruppe'',''Defender''],[[Gruppe2],''SupportGruppe'',''Support'']<br/><br/>Mehr Infos im internen Discord.";
			control = "StructuredText7";
		};
		class RR_commons_habo_3denArray {
			property = "RR_commons_habo_3denArray_property";
			displayName = "HABO-Gruppen";
			tooltip = "Beispiel: [[Gruppe1,Gruppe2],''meinGruppenName'',''Defender''],[[Gruppe3,Gruppe4],''meinGruppenName2'',''Support'']";
			expression = "RR_commons_habo_3denArray = _value";
			control = "Edit";
			defaultValue = "''";
			typeName = "STRING";
		};
	};
};
