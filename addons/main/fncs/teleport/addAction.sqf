/*
*	Author: LAxemann
*
*	Desc: 
*   Fügt den Objekten im Array RR_commons_teleport_teleporterObjects
*	eine Aktion zum Öffnen des Teleport-Menüs hinzu.
*
*	Params:
*	None
*
*	Returns:
*	Nil
*
*	Example: 
*   call RR_commons_teleport_fnc_addAction
* =================================================*/

private ["_needsAction"];
private _teleporter = objNull;
RR_commons_teleport_teleporterObjects select {
	_teleporter = _x;
	if (typeName _teleporter == "STRING") then {_teleporter = call compile _teleporter};
	if (_teleporter getVariable ["RR_commons_teleport_needsAction",true]) then {
		_teleporter addAction [
			"<t color='#FF0000'>Teleport</t>",
			{
				call RR_commons_teleport_fnc_openDialog;
				
			},
			nil,
			6,
			true,
			true,
			"",
			"true",
			25
		];
		_teleporter setVariable ["RR_commons_teleport_needsAction",false];
	};
	true;
};

nil;

