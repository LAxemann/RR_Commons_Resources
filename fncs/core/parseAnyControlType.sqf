params ["_input","_type"];

private _output = switch _type do {
	case "String": {_input};
	case "Side": {call compile _input};
	case "Number": {call compile _input};
	case "Float": {call compile _input};
	case "Integer": {call compile _input};
	case "Array": {[_input] call RR_commons_core_fnc_parse3denArray};
	case "Bool": {call compile _input};
	case "StringToArray": {call compile ("[" + _input + "]")};
	default {_input};
};

_output;