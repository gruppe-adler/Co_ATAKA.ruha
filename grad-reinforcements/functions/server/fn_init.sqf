private _m2a2 = [
	"RHS_M2A2_BUSKI_WD",
	["Olive",1],
	["IFF_Panels_Hide",1,"Select_TOW",0,"Select_Stinger",1]
];

private _AT_team = [
	"rhsusf_usmc_marpat_wd_teamleader",
	"rhsusf_usmc_marpat_wd_rifleman_m4",
	"rhsusf_usmc_marpat_wd_rifleman_m4",
	"rhsusf_usmc_marpat_wd_javelin"
];

private _MG_team = [
	"rhsusf_usmc_marpat_wd_teamleader",
	"rhsusf_usmc_marpat_wd_machinegunner",
	"rhsusf_usmc_marpat_wd_machinegunner_ass",
	"rhsusf_usmc_marpat_wd_rifleman_m4"
];

private _reinforcements = [
	[_m2a2, [3296.85,3435.7,0], 30, _AT_team]
];


{
  	_x params ["_vehicle", "_position", "_dir", "_cargo"];
  	_vehicle params ["_type", "_initSkin", "_initExtras"];

  	private _spawnedVehicle = [_type, _position, _dir, _initSkin, _initExtras, _cargo] call GRAD_reinforcements_fnc_spawnVehicle;

  	private _cargoGroup = createGroup west;
  	{
  		[_cargoGroup, _x, [0,0,0], _spawnedVehicle] call GRAD_reinforcements_fnc_spawnUnit;
  	} forEach _cargo;

	{
		_x addCuratorEditableObjects [[_spawnedVehicle],true];
		nil
	} count allCurators;  	

} forEach _reinforcements;