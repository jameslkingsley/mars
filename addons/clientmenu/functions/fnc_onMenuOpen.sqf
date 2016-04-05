/*
 * Author: Kingsley
 * Called when client menu is opened via keybind
 *
 * Arguments:
 * 0: Menu display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [clientmenu] call mars_clientmenu_fnc_onMenuOpen;
 *
 * Public: No
 */

#include "script_component.hpp"

#define TERRAIN_DETAIL (_display displayCtrl 101)
#define VIEW_DISTANCE (_display displayCtrl 103)
#define ZEUS_BTN (_display displayCtrl 105)
#define ZEUS_LABEL (_display displayCtrl 106)

params ["_display"];

if (isNil "_display") exitWith {};

disableSerialization;

{
    _index = TERRAIN_DETAIL lbAdd (_x select 0);
    TERRAIN_DETAIL lbSetData [_index, str (_x select 1)];
    if ((_x select 1) == GVAR(terrainDetail)) then {TERRAIN_DETAIL lbSetCurSel _index;};
} forEach [
    ["Low", 25],
    ["Medium", 12.5],
    ["High", 6.25],
    ["Very High", 3.125]
];

{
    _index = VIEW_DISTANCE lbAdd (str _x);
    VIEW_DISTANCE lbSetData [_index, (str _x)];
    if (_x == GVAR(viewDistance)) then {VIEW_DISTANCE lbSetCurSel _index;};
} forEach [1000,2000,3000,4000,5000,6000,7000,8000,9000,10000];

if (!isNil QEGVAR(zeus,zeusModule)) then {
    _curator = getAssignedCuratorUnit EGVAR(zeus,zeusModule);
    ZEUS_LABEL ctrlSetText ([(format["Curator: %1", name _curator]),"Curator: Unknown"] select (isNull _curator));
    ZEUS_BTN ctrlEnable ([false,true] select (_curator == player || isNull _curator || (player getVariable ["MARS_allowZeus",false])));
} else {
    ZEUS_BTN ctrlEnable false;
    ZEUS_LABEL ctrlSetText "Curator: Unavailable";
};