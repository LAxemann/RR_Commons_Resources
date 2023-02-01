#include "missionsErweiterungen\init.sqf"
if (isServer) then {
	#include "missionsErweiterungen\initServer.sqf"
};
if ((!isServer && hasInterface) || !isMultiplayer) then {
	#include "missionsErweiterungen\initPlayerLocal.sqf"
};
if ((!isServer && !hasInterface) || !isMultiplayer) then {
	#include "missionsErweiterungen\initHC.sqf"
};