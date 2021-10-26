/* Author: Olsen, Editor: Pax_Jarome
Diese Funktion verarbeitet für jeden Spieler abhänig von seinem Team
die Datei briefing.sqf im root Verzeichnis einer Mission, die dieses
Framework nutzt.

Im Missionsbauerframework muss ein Ordner namens "Templates" erstellt
werden, der eine vorbereitete briefing.sqf beinhaltet.
Zieht der Missionsbauer diese aus Template in den Missionsroot ist
die initPlayerLocal.sqf dazu angehalten die notwendigen Funktionen
zur Anzeige dieser auszuführen.*/

private _briefing = [];

#define NEWTAB(NAME) _briefing set [count _briefing, ["Diary",[NAME,"
#define ENDTAB "]]];

#define DISPLAYBRIEFING() \
_size = count _briefing - 1; \
for '_i' from 0 to _size do \
{ \
	player createDiaryRecord (_briefing select _size - _i); \
};
