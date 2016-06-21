/*
 * Author: Kingsley
 * Enables or disables a control set (control and label)
 *
 * Arguments:
 * 0: Control <CONTROL>
 * 1: Enable or disable <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [myControl, false] call mars_attributes_fnc_enableControlSet;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_control", controlNull, [controlNull]],
    ["_state", true, [true]]
];

private _controls = [_control, (_control getVariable [QGVAR(label), controlNull])];

{_x ctrlEnable _state} forEach _controls;
