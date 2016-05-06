/*
 * Author: Kingsley
 * Handles clicking a subtab in the asset browser
 *
 * Arguments:
 * Whatever the event handler returns
 *
 * Return Value:
 * None
 *
 * Example:
 * N/A
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_control","_button","_cordX","_cordY","_shift","_ctrl","_alt"];

if (_button != 0) exitWith {};

_config = _control getVariable [QGVAR(tabConfig), configNull];
_onClick = getText (_config >> "onClick");

// Reset opacity of all subtabs
{
    disableSerialization;
    private _control = (GETUVAR(GVAR(interface),displayNull) displayCtrl _x);
    _control ctrlSetFade DEFAULT_TAB_OPACITY;
    _control ctrlCommit 0;
} forEach GVAR(subtabs);

call compile _onClick;

_control ctrlSetFade 0;
_control ctrlCommit 0;
