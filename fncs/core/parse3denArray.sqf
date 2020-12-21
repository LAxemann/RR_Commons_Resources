params ["_array"];
private _outPutArray = _array apply {call compile _x};
_outPutArray;
