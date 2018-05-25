if (
  !isNull (getAssignedCuratorLogic player) &&
  {isClass (configFile >> "CfgPatches" >> "achilles_modules_f_achilles")}
) then
{
  // Note that the line below has to be uncommented if your mission is a Zeus Game Master mission.
  // TODO check if below is necessary to uncomment
  // waitUntil {missionnamespace getvariable ["BIS_moduleMPTypeGameMaster_init", false] and {not isNil "ares_category_list"}};
  ["ATAKA", "Force Respawn for dead players",
  {
  	// Get all the passed parameters
  	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  	[] remoteExec ["GRAD_permaChoice_fnc_forceRespawn", [0,-2] select isDedicated, true];

  }] call Ares_fnc_RegisterCustomModule;


  ["ATAKA", "Show List of DIE & SPECTATE Players",
  {
  	// Get all the passed parameters
  	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    private _spectatorList = missionNameSpace getVariable ["GRAD_permaChoice_spectatorList", []];
  	[str _spectatorList] call GRAD_permaChoice_fnc_showNotification;

  }] call Ares_fnc_RegisterCustomModule;


  ["ATAKA", "Spawn Reinforcements",
  {
  	// Get all the passed parameters
  	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  	[""] remoteExec ["GRAD_convoy_fnc_convoyStart", 2];

  }] call Ares_fnc_RegisterCustomModule;
};
