_vehicleArray = [

	[
		"LOP_AA_M1025_W_M2",
		["light_hide", 1],
		{
			_veh = _this select 0;
			_veh call GRAD_convoy_fnc_clearInventory;
		}
	],
	[
		"LOP_AA_M113_C",
		["light_hide", 1],
		{
			_veh = _this select 0;
			_veh call GRAD_convoy_fnc_clearInventory;
			[_veh,true] call GRAD_convoy_fnc_fillCargoWithSoldiers;
		}
	],
	[
		"LOP_AA_Ural",
		["light_hide", 1],
		{
			_veh = _this select 0;
			_veh call GRAD_convoy_fnc_clearInventory;
			_veh lockCargo true;
			_veh addWeaponCargoGlobal ['SatchelCharge_Remote_Ammo',100];
			[_veh] call GRAD_convoy_fnc_addBombTruckProperties;			
		}
	],
	[
		"LOP_AA_Ural_open",
		["light_hide", 1],
		{
			_veh = _this select 0;
			_veh call GRAD_convoy_fnc_clearInventory;
			[_veh,true] call GRAD_convoy_fnc_fillCargoWithSoldiers;
		}
	],
	[
		"LOP_AA_Ural_open",
		["light_hide", 1],
		{
			_veh = _this select 0;
			_veh call GRAD_convoy_fnc_clearInventory;
			[_veh,true] call GRAD_convoy_fnc_fillCargoWithSoldiers;
		}
	],
	[
		"rhsgref_cdf_b_ural_fuel",
		["light_hide", 1],
		{
			_veh = _this select 0;
			_veh call GRAD_convoy_fnc_clearInventory;	
		}
	],
	[
		"rhsgref_cdf_b_ural_fuel",
		["light_hide", 1],
		{
			_veh = _this select 0;
			_veh call GRAD_convoy_fnc_clearInventory;	
		}
	],
	[
		"LOP_AA_M113_C",
		["light_hide", 1],
		{
			_veh = _this select 0;
			_veh call GRAD_convoy_fnc_clearInventory;
			[_veh,true] call GRAD_convoy_fnc_fillCargoWithSoldiers;
		}
	]
];

/*

convoy:
UAZ/Car, M113, Ural Explosives, Ural Explosives, Ural Fuel, Ural Infantry, M1113?

*/

[_vehicleArray, [3431.92,8180.26,0], 0, west] call GRAD_convoy_fnc_spawnConvoyVehicles;