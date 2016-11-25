/*
 * Author: Kingsley
 * Gets a setting from the server
 * Must be called on the server
 *
 * Arguments:
 * 0: Component <STRING>
 * 1: Setting <STRING>
 * 2: Default if null <ANY>
 *
 * Return Value:
 * Setting value <ANY>
 *
 * Example:
 * ["mars_editor", "whitelisted", []] call mars_common_fnc_getServerSetting;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_component", "", [""]],
    ["_setting", "", [""]],
    ["_default", ""]
];

private _config = (configFile >> QGVARMAIN(serverSettings) >> _component >> _setting);
private _value = _default;

if (!isNull _config) then {
    _value = _config call BIS_fnc_getCfgData;
};

missionNamespace setVariable [format ["%1_%2", _component, _setting], _value, true];
