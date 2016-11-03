/*
 * Author: Kingsley
 * Handles tree selection changes of the asset browser
 *
 * Arguments:
 * See UI EH
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

params [
    ["_control", controlNull, [controlNull]],
    ["_path", [], [[]]]
];

private _controlData = call compile (_control tvData _path);

_controlData params [
    ["_type", "", [""]],
    ["_configStr", "", [""]]
];

if (_type == "" || {_config == ""}) exitWith {};

switch (_type) do {
    case "unit": {
        private _config = call compile _configStr;
        private _classname = configName _config;
        private _icon = getText (_config >> "icon");
        private _iconPath = [getText (configFile >> "CfgVehicleIcons" >> _icon), _icon] select ((toLower _icon) find "\" > -1);
        private _side = getNumber (_config >> "side");
        private _color = [_side] call CFUNC(getSideColorByInt);
        GVAR(abSelectedObject) = [_type, _classname, _iconPath, _color, _side];
    };
    case "object": {
        private _config = call compile _configStr;
        private _classname = configName _config;
        private _icon = getText (_config >> "icon");
        private _iconPath = [getText (configFile >> "CfgVehicleIcons" >> _icon), _icon] select ((toLower _icon) find "\" > -1);
        private _side = getNumber (_config >> "side");
        private _color = [COLOR_EMPTY_RGBA];
        GVAR(abSelectedObject) = [_type, _classname, _iconPath, _color, _side];
    };
    case "group": {
        private _config = call compile _configStr;
        private _classname = configName _config;
        private _icon = getText (_config >> "icon");
        private _side = getNumber (_config >> "side");
        private _color = [_side] call CFUNC(getSideColorByInt);
        GVAR(abSelectedObject) = [_type, _classname, _icon, _color, _side, _configStr];
    };
    case "module": {
        private _config = call compile _configStr;
        private _classname = configName _config;
        private _icon = [
            getText (_config >> "icon"),
            QPATHTOF(data\PanelRight\modemodules_ca.paa)
        ] select (isNull (_config >> "icon") || {getText (_config >> "icon") == ""});
        GVAR(abSelectedObject) = [_type, _classname, _icon, [1,1,1,1], -1, _configStr];
    };
    case "marker": {
        private _config = call compile _configStr;
        private _classname = configName _config;
        private _icon = getText (_config >> "icon");
        GVAR(abSelectedObject) = [_type, _classname, _icon, [1,1,1,1], -1];
    };
};
