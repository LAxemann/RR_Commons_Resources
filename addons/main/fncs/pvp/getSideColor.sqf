/*
*	Author: 
*	LAxemann
*
*	Desc.: 
*	Gibt einen Farbwert basierend auf der Input-Fraktion aus
*
*	Params:
*	0 - Seite <SIDE>
*
*	Returns:
*	Farbwert <STRING>
*
*	Example:
*	[west] call RR_commons_pvp_fnc_getSideColor;
*/

params [
	"_side"
];


private _color = switch (_side) do {
	case west: { "#0040FF" };
	case east: { "#B40404" };
	case resistance: { "#088A08" };
	case civilian: { "#A901DB" };
};


_color;