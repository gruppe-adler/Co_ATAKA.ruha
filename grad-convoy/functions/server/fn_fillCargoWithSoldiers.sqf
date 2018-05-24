params ["_vehicle","_isArmy"];

// todo: find right group in afghan police
_squad = (configFile >> "CfgGroups" >> "West" >> "LOP_AA" >> "Infantry" >> "LOP_AA_Rifle_squad");



if (_isArmy) then {
	// todo: find right group in afghan army
	_squad = (configfile >> "CfgGroups" >> "West" >> "LOP_AA" >> "Infantry" >> "LOP_AA_Rifle_squad_ANP");
};

_soldiers = [[0,0,0], WEST, _squad] call BIS_fnc_spawnGroup;

{_x assignAsCargo _vehicle; _x moveInCargo _vehicle;} forEach units _soldiers;

// delete leftovers
{if !(_x in _vehicle) then { deleteVehicle _x}; } forEach units _soldiers;