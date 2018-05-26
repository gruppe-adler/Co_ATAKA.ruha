params ["_group", "_type", "_position", ["_vehicle", objNull]];

private _isCargo = !(isNull _vehicle);
private _special = "NONE";

if (_isCargo) then {
	_special = "CARGO";
};

private _unit = _group createUnit [_type, _position, [], 0, _special];

{
	_x addCuratorEditableObjects [[_unit],true];
	nil
} count allCurators;