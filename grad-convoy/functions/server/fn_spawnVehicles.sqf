params ["_vehicleArray","_pos","_dir","_side", ["_waypointMarker",[]]];

// _vehicleArray is [_classname, _init, _inventory]
private _waypoints = [];

if (count _waypointMarker isEqualTo 0) exitWith {
	diag_log format ["no waypoints found"];
};

{
	_waypoints append [getMarkerPos _x];
} forEach _waypointMarker;

_distanceBetweenVehicles = 30;
_distanceFromFirst = 0;
_group = createGroup _side;



{

	
	_classname = _vehicleArray select _foreachindex select 0;
	_init = _vehicleArray select _foreachindex select 1;
	_inventory = _vehicleArray select _foreachindex select 2;

	diag_log format ["vehicle classname is %1, %2, %3", _classname, _init, _inventory];

	_distanceFromFirst = _distanceFromFirst + _distanceBetweenVehicles;
	_calculatedPos = [_pos, _distanceFromFirst, _dir] call BIS_fnc_relPos;
	_vehicle = createVehicle [_classname, _calculatedPos, [], 0, "NONE"];

	// make consistent group for whole convoy
	createVehicleCrew _vehicle;
	{ [_x] joinSilent _group; } forEach (crew _vehicle);

	// add everything to zeus
	{zeusModule addCuratorEditableObjects [[_x],true]} forEach crew _vehicle;
	zeusModule addCuratorEditableObjects [[_vehicle],true];

	// fill vehicle with reasonable stuff
	[_vehicle] call _inventory;
	sleep 0.1;

	// adjust vehicle (remove lamp covers and stuff)
	if (count _init > 0) then {
		[_vehicle, nil, _init] call BIS_fnc_initVehicle;
	};

	_vehicle setVehicleLock "UNLOCKED";
	// _vehicle forceFollowRoad true;

} forEach _vehicleArray;

// set convoy behaviour
{	
	_x setSpeedMode "LIMITED";
	_x setCombatMode "SAFE";
	_x limitSpeed 5;
} forEach units _group;

[_group, _waypoints] call GRAD_convoy_fnc_setWaypoints;