/*
 * Author: Kingsley
 * Loads a saved setting from the profile namespace
 *
 * Arguments:
 * 0: Key <STRING>
 * 1: Default value <ANY>
 *
 * Return Value:
 * Value from profile namespace, or default if undefined <ANY>
 *
 * Example:
 * _cameraSpeed = [QEGVAR(editor,camSpeed), 1.5] call mars_common_fnc_loadSetting;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_key", "", [""]],
    ["_default", nil]
];

if (_key == "") exitWith {nil};

profileNamespace getVariable [_key, _default]