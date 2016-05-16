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
    ["_index", 0]
];

if (count _args == 0 || _type == "" || _index < 0) exitWith {};

_display = GETUVAR(GVAR(interface),displayNull);

TRACE_1("fnc_handlePanelSections", _this);

switch (_type) do {
    case "rightTabs": {
        switch (_index) do {
            case 0: { // Assets
                {(_display displayCtrl (_x select 0)) ctrlShow (_x select 1)} forEach [
                    [IDC_ASSETBROWSER_NOTES, false],
                    [IDC_ASSETBROWSER_CREATE, true]
                ];
            };
            case 1: { // Notes
                {(_display displayCtrl (_x select 0)) ctrlShow (_x select 1)} forEach [
                    [IDC_ASSETBROWSER_NOTES, true],
                    [IDC_ASSETBROWSER_CREATE, false]
                ];
            };
        };
        
        GVAR(abCurrentTab) = _index;

        // Call the modes section to handle the modes display
        ["rightModes", [controlNull, GVAR(abCurrentMode)]] call FUNC(handlePanelSections);
    };
    case "rightModes": {
        switch (_index) do {
            case 0: { // Objects
                {(_display displayCtrl (_x select 0)) ctrlShow (_x select 1)} forEach [
                    [IDC_ASSETBROWSER_SUBMODES_SIDES, true],
                    [IDC_ASSETBROWSER_SUBMODES_BRUSHES, false]
                ];
            };
            case 1: { // Compositions
                {(_display displayCtrl (_x select 0)) ctrlShow (_x select 1)} forEach [
                    [IDC_ASSETBROWSER_SUBMODES_SIDES, true],
                    [IDC_ASSETBROWSER_SUBMODES_BRUSHES, false]
                ];
            };
            case 2: { // Modules
                {(_display displayCtrl (_x select 0)) ctrlShow (_x select 1)} forEach [
                    [IDC_ASSETBROWSER_SUBMODES_SIDES, false],
                    [IDC_ASSETBROWSER_SUBMODES_BRUSHES, false]
                ];
            };
            case 3: { // Markers
                {(_display displayCtrl (_x select 0)) ctrlShow (_x select 1)} forEach [
                    [IDC_ASSETBROWSER_SUBMODES_SIDES, false],
                    [IDC_ASSETBROWSER_SUBMODES_BRUSHES, true]
                ];
            };
            case 4: { // Favorites
                {(_display displayCtrl (_x select 0)) ctrlShow (_x select 1)} forEach [
                    [IDC_ASSETBROWSER_SUBMODES_SIDES, false],
                    [IDC_ASSETBROWSER_SUBMODES_BRUSHES, false]
                ];
            };
        };
        GVAR(abCurrentMode) = _index;
    };
};
