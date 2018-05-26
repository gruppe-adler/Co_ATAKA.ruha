if (!isServer) exitWith {};

[{
	params ["_args", "_handle"];

	if (!(isNull flagOwner flag_retreat)) exitWith {
		[_handle] call CBA_fnc_removePerFrameHandler;

		diag_log format ["mission end triggered"];
	};

}, 3, []] call CBA_fnc_addPerFrameHandler;