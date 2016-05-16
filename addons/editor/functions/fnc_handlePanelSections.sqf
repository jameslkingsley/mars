/*
 * Author: Kingsley
 * Handles panel sections UI
 *
 * Arguments:
 * 0: Type <STRING>
 * 1: UI EH <ARRAY>
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
    ["_type", "", [""]],
    ["_args", []]
];

_args params [
    ["_control", controlNull],
    ["_index", -1]
];

if (count _args == 0 || _type == "" || isNull _control || _index == -1) exitWith {};

_display = GETUVAR(GVAR(interface),displayNull);

TRACE_1("fnc_handlePanelSections", _this);

switch (_type) do {
    case "rightTabs": {
        switch (_index) do {
            case 0: { // Assets
                {
                    _ctrl = _display displayCtrl _x;
                    _ctrl ctrlShow false;
                } forEach [IDC_ASSETBROWSER_NOTES];
                
                (_display displayCtrl IDC_ASSETBROWSER_CREATE) ctrlShow true;
            };
            case 1: { // Notes
                {
                    _ctrl = _display displayCtrl _x;
                    _ctrl ctrlShow false;
                } forEach [IDC_ASSETBROWSER_CREATE];
                
                (_display displayCtrl IDC_ASSETBROWSER_NOTES) ctrlShow true;
            };
        };
    };
    case "rightModes": {
        
    };
};
