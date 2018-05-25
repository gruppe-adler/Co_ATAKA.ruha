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
	[_m2a2, [3283.03,3403.37,0], 30, _AT_team]
];


{
  	params ["_vehicle", "_position", "_dir", "_cargo"];
  	_vehicle params ["_type", "_initSkin", "_initExtras"];

  	[_type, _position, _dir, _initSkin, _initExtras, _cargo] call GRAD_reinforcements_fnc_spawnVehicle;

} forEach _reinforcements;