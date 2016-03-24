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
 * [clientmenu] call arcmc_clientmenu_fnc_onMenuOpen;
 *
 * Public: No
 */

#include "script_component.hpp"

#define TERRAIN_DETAIL (_display displayCtrl 101)
#define VIEW_DISTANCE (_display displayCtrl 103)

params ["_display"];

if (isNil "_display") exitWith {};

disableSerialization;

{
    _index = TERRAIN_DETAIL lbAdd (_x select 0);
    TERRAIN_DETAIL lbSetData [_index, str (_x select 1)];
    if ((_x select 0) == "Low") then {TERRAIN_DETAIL lbSetCurSel _index;};
} forEach [
    ["Low", 25],
    ["Medium", 12.5],
    ["High", 6.25],
    ["Very High", 3.125]
];

{
    _index = VIEW_DISTANCE lbAdd (str _x);
    VIEW_DISTANCE lbSetData [_index, (str _x)];
    if (_x == 2000) then {VIEW_DISTANCE lbSetCurSel _index;};
} forEach [1000,2000,3000,4000,5000,6000,7000,8000,9000,10000];
