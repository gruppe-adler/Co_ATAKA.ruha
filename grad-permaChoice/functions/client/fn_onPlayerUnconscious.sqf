params ["_unit", "_state"];

if _state then {
    // hint str (uiNamespace getVariable ["ace_common_dlgDisableMouse", displayNull]);
  	/*
    _Wasted = (uiNamespace getVariable ["ace_common_dlgDisableMouse", displayNull]) ctrlCreate ["RscStructuredText",1930];
  	_Wasted ctrlSetPosition  [-0.000156274 * safezoneW + safezoneX,0.423 * safezoneH + safezoneY,1.02094 * safezoneW,0.099 * safezoneH];
  	_Wasted ctrlCommit 0;
  	_Wasted ctrlSetBackgroundColor [0, 0, 0, 0.9];
  	_Wasted ctrlSetStructuredText parseText format["<t size='4' color='#FF0000' align = 'center'>Auf Hilfe warten oder:</t>"];
    */
    "STHud_Draw" call STUI_Canvas_Remove; // remove sthud

    private _controlPosition = 
    [
        safeZoneX + (safeZoneW/2) - 0.1,
        safeZoneY + safeZoneH - 0.21,
        0.2 * 3 / 4,
        0.2
    ];

    
    // workaround for mouseEnter events not firing on picture
    private _mouseOverArea = (uiNamespace getVariable ["ace_common_dlgDisableMouse", displayNull]) ctrlCreate ["RscStructuredText",-1];
    _mouseOverArea ctrlSetPosition _controlPosition;
    _mouseOverArea ctrlSetText "";
    _mouseOverArea ctrlSetBackgroundColor [0,0,0,0.01];
    _mouseOverArea ctrlCommit 0;

    _mouseOverArea ctrlAddEventHandler ["ButtonClick", "closeDialog 0; player setDamage 1; [] call grad_permaChoice_fnc_setPlayerSpectator;"];

    _mouseOverArea ctrlAddEventHandler ["MouseEnter",{
        private _icon = uiNamespace getVariable ["grad_permaChoice_icon", controlNull];
        if (!isNull _icon) then { _icon ctrlSetText "grad-permaChoice\data\dieAndSpectate_act.paa"; false };
    }];
    _mouseOverArea ctrlAddEventHandler ["MouseExit",{
        private _icon = uiNamespace getVariable ["grad_permaChoice_icon", controlNull];
        if (!isNull _icon) then { _icon ctrlSetText "grad-permaChoice\data\dieAndSpectate_def.paa"; false };
    }];

    private _icon = (uiNamespace getVariable ["ace_common_dlgDisableMouse", displayNull]) ctrlCreate ["RscPicture",-1];
    uiNamespace setVariable ["grad_permaChoice_icon", _icon];
  	_icon ctrlSetPosition _controlPosition;
  	_icon ctrlSetText "grad-permaChoice\data\dieAndSpectate_def.paa";
    _icon ctrlSetBackgroundColor [0,0,0,0.01];
    _icon ctrlCommit 0;    

    

    /*
    private _rspbutton = (uiNamespace getVariable ["ace_common_dlgDisableMouse", displayNull]) ctrlCreate ["RscButton",-1];
    _rspbutton ctrlSetPosition [0.5 * safezoneW + safezoneX,0.533 * safezoneH + safezoneY,0.195937 * safezoneW,0.077 * safezoneH];
    _rspbutton ctrlSetText "test";
    _rspbutton ctrlSetBackgroundColor [0, 0, 0, 0];
    _rspbutton ctrlCommit 0;
    */
    
} else {
    //hint "state false";
    "STHud_Draw" call STUI_Canvas_Add;
};
