/*
*	Author: LAxemann
*
*	Desc: 
*   F�gt den Objekten im Array RR_commons_teleport_teleporterObjects
*	eine Aktion zum �ffnen des Teleport-Men�s hinzu.
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

hint "Durch JIP ist das Teleport-Men� f�r 3 Minuten verf�gbar.";
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

