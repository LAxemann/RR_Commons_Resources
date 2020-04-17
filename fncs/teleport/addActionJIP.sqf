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

hint "Durch JIP ist das Teleport-Menü für 3 Minuten verfügbar.";
private _teleportActionID = player addAction [
	"<t color='#FF0000'>JIP-Teleport</t>",
	{
		call RR_commons_teleport_fnc_openDialog;
		
	},
	nil,
	20,
	true,
	true,
	"",
	"(player == _this)",
	25
];
player setVariable ["RR_commons_teleport_id",_teleportActionID];

[] spawn {
	sleep 180;
	private _id = player getVariable ["RR_commons_teleport_id",-1];
	if (_id != -1) then {
		player removeAction _id;
	};
};

nil;

