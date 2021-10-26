/* Author: Olsen, Editor: Pax_Jarome

Diese Funktion erstellt eine beliebige Menge weiterer Reiter
im Diary eines Spielers unabhänig von seiner Teamseite.
Diese Datei ist im Framework hinterlegt, da eine Anpassung von
Seite des Missionsbauers nicht vorgesehen ist. */

private ["_info_ofw"];

player createDiarySubject ["Cr_Menu", "Credits"];

_info_ofw = "
This mission briefing is using parts of the Olsen Framework.<br/>
Thank you for providing this to the Arma Community.
<br/>
github.com/dklollol/Olsen-Framework-Arma-3<br/>
";
player createDiaryRecord ["Cr_Menu", ["OFW3", _info_ofw]];
