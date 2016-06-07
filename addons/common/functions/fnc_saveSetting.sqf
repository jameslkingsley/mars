/*
 * Author: Kingsley
 * Saves a setting to the profile namespace
 *
 * Arguments:
 * 0: Key <STRING>
 * 1: Value <ANY>
 * 2: Save profileNamespace (defaults to true) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [QEGVAR(editor,camSpeed), 5] call mars_common_fnc_saveSetting;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_key", "", [""]],
    ["_value", nil],
    ["_save", true, [true]]
];

if (_key == "") exitWith {};

profileNamespace setVariable [_key, _value];

if (_save) then {
    saveProfileNamespace;
};