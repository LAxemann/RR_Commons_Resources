params [
	"_globalVarAsString",
	"_value",
	["_type","none"],
	["_onServer",false]
];

if ((isMultiplayer && !hasInterface && !(_onServer))) exitWith {};
if (!is3DEN) then {
	if (_type == "STRING") then {_value = str _value};
	private _compileString = format ["%1 = %2",_globalVarAsString,_value];
	call compile _compileString;
};