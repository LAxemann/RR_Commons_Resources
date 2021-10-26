/* Author: Pax_Jarome

Diese Funktion inkludiert je nach Seite eines Spielers besser übersichtliche Dateien
in einem separaten Framework Ordner, welche die jeweiligen Briefings enthalten.
Aufgerufen wird die Datei von /missionsErweiterungen/initPlayerLocal.sqf via RR-commons_briefing_briefingDisplay */

#include "../../rawcode/briefing/briefingCore.sqf"

switch (side player) do {
	case west: {
		#include "/briefing/blufor.sqf"
	};

	case east: {
		#include "/briefing/opfor.sqf"
	};

	case resistance: {
                #include "/briefing/greenfor.sqf"
        };

	case civilian: {
		#include "/briefing/civfor.sqf"
        };
};

#include "/briefing/missionnotes.sqf"

DISPLAYBRIEFING();
