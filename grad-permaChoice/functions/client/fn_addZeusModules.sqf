if (
  !isNull (getAssignedCuratorLogic player) &&
  {isClass (configFile >> "CfgPatches" >> "achilles_modules_f_achilles")}
) then
{
  // Note that the line below has to be uncommented if your mission is a Zeus Game Master mission.
  // TODO check if below is necessary to uncomment
  // waitUntil {missionnamespace getvariable ["BIS_moduleMPTypeGameMaster_init", false] and {not isNil "ares_category_list"}};
  ["ATAKA", "Show List of DIE & SPECTATE Players",
  {
  	// Get all the passed parameters
  	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    private _spectatorList = missionNameSpace getVariable ["GRAD_permaChoice_spectatorList", []];
  	[str _spectatorList] call GRAD_permaChoice_fnc_showNotification;

  }] call Ares_fnc_RegisterCustomModule;

  ["ATAKA", "Force Respawn everyone here",
  {
  	// Get all the passed parameters
  	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    missionNameSpace setVariable ["ATAKA_RespawnPosition", _position, true];
  	[] remoteExec ["GRAD_permaChoice_fnc_forceRespawn", [0,-2] select isDedicated, true];

  }] call Ares_fnc_RegisterCustomModule;

  ["ATAKA", "Spawn Reinforcements",
  {
  	// Get all the passed parameters
  	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  	[""] remoteExec ["GRAD_convoy_fnc_convoyStart", 2];

  }] call Ares_fnc_RegisterCustomModule;




  ["ATAKA", "Create Attack Task",
  {
  	// Get all the passed parameters
  	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  	[east,["tsk_attack"],["Ruha angreifen und Feinde werfen.","Ruha angreifen","mrk_ruha"],[0,0,0],1,2,true, "attack"] call BIS_fnc_taskCreate;

  }] call Ares_fnc_RegisterCustomModule;

  ["ATAKA", "Attack Task Success",
  {
  	// Get all the passed parameters
  	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  	["tsk_attack", "SUCCEEDED",true] spawn BIS_fnc_taskSetState;

  }] call Ares_fnc_RegisterCustomModule;

  ["ATAKA", "Attack Task Fail",
  {
  	// Get all the passed parameters
  	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  	["tsk_attack", "FAILED",true] spawn BIS_fnc_taskSetState;

  }] call Ares_fnc_RegisterCustomModule;




  ["ATAKA", "Create Defend Task",
  {
  	// Get all the passed parameters
  	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  	[east,["tsk_defend"],["Ruha verteidigen und Gegenangriff abwehren.","Ruha halten","mrk_ruha"],[0,0,0],1,2,true, "defend"] call BIS_fnc_taskCreate;

  }] call Ares_fnc_RegisterCustomModule;

  ["ATAKA", "Defend Task Success",
  {
  	// Get all the passed parameters
  	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  	["tsk_defend", "SUCCEEDED",true] spawn BIS_fnc_taskSetState;

  }] call Ares_fnc_RegisterCustomModule;

  ["ATAKA", "Defend Task Fail",
  {
  	// Get all the passed parameters
  	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  	["tsk_defend", "FAILED",true] spawn BIS_fnc_taskSetState;

  }] call Ares_fnc_RegisterCustomModule;
};
