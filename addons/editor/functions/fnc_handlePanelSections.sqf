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

        ["rightModes", [controlNull, GVAR(abCurrentMode)]] call FUNC(handlePanelSections);
    };
    case "rightModes": {
        #define TREE_FALSE \
            [IDC_ASSETBROWSER_TREE_UNITS_WEST, false],\
            [IDC_ASSETBROWSER_TREE_UNITS_EAST, false],\
            [IDC_ASSETBROWSER_TREE_UNITS_GUER, false],\
            [IDC_ASSETBROWSER_TREE_UNITS_CIV, false],\
            [IDC_ASSETBROWSER_TREE_UNITS_EMPTY, false],\
            [IDC_ASSETBROWSER_TREE_GROUPS_WEST, false],\
            [IDC_ASSETBROWSER_TREE_GROUPS_EAST, false],\
            [IDC_ASSETBROWSER_TREE_GROUPS_GUER, false],\
            [IDC_ASSETBROWSER_TREE_GROUPS_CIV, false],\
            [IDC_ASSETBROWSER_TREE_GROUPS_EMPTY, false],\
            [IDC_ASSETBROWSER_TREE_MODULES, false]
        switch (_index) do {
            case 0: { // Objects
                {(_display displayCtrl (_x select 0)) ctrlShow (_x select 1)} forEach [
                    [IDC_ASSETBROWSER_SUBMODES_SIDES, true],
                    [IDC_ASSETBROWSER_SUBMODES_BRUSHES, false],
                    TREE_FALSE
                ];
            };
            case 1: { // Compositions
                {(_display displayCtrl (_x select 0)) ctrlShow (_x select 1)} forEach [
                    [IDC_ASSETBROWSER_SUBMODES_SIDES, true],
                    [IDC_ASSETBROWSER_SUBMODES_BRUSHES, false],
                    TREE_FALSE
                ];
            };
            case 2: { // Modules
                {(_display displayCtrl (_x select 0)) ctrlShow (_x select 1)} forEach [
                    [IDC_ASSETBROWSER_SUBMODES_SIDES, false],
                    [IDC_ASSETBROWSER_SUBMODES_BRUSHES, false],
                    TREE_FALSE
                ];
            };
            case 3: { // Markers
                {(_display displayCtrl (_x select 0)) ctrlShow (_x select 1)} forEach [
                    [IDC_ASSETBROWSER_SUBMODES_SIDES, false],
                    [IDC_ASSETBROWSER_SUBMODES_BRUSHES, true],
                    TREE_FALSE
                ];
            };
            case 4: { // Favorites
                {(_display displayCtrl (_x select 0)) ctrlShow (_x select 1)} forEach [
                    [IDC_ASSETBROWSER_SUBMODES_SIDES, false],
                    [IDC_ASSETBROWSER_SUBMODES_BRUSHES, false],
                    TREE_FALSE
                ];
            };
        };
        
        GVAR(abCurrentMode) = _index;
        
        ["rightSides", [controlNull, GVAR(abCurrentSubmode)]] call FUNC(handlePanelSections);
    };
    case "rightSides": {
        _sideInt = switch (_index) do {
            case 0: {SIDE_WEST};
            case 1: {SIDE_EAST};
            case 2: {SIDE_GUER};
            case 3: {SIDE_CIV};
            case 4: {SIDE_EMPTY};
        };
        
        _treeParent = _display displayCtrl IDC_ASSETBROWSER_TREE;
        
        _treeIDC = -1;
        
        MARS_LOGINFO_1("Mode: %1", GVAR(abCurrentMode));
        
        if (GVAR(abCurrentMode) == 0) then {
            // Objects
            _treeIDC = switch (_sideInt) do {
                case SIDE_WEST: {IDC_ASSETBROWSER_TREE_UNITS_WEST};
                case SIDE_EAST: {IDC_ASSETBROWSER_TREE_UNITS_EAST};
                case SIDE_GUER: {IDC_ASSETBROWSER_TREE_UNITS_GUER};
                case SIDE_CIV: {IDC_ASSETBROWSER_TREE_UNITS_CIV};
                case SIDE_EMPTY: {IDC_ASSETBROWSER_TREE_UNITS_EMPTY};
            };
        } else {
            if (GVAR(abCurrentMode) == 1) then {
                // Compositions
                _treeIDC = switch (_sideInt) do {
                    case SIDE_WEST: {IDC_ASSETBROWSER_TREE_GROUPS_WEST};
                    case SIDE_EAST: {IDC_ASSETBROWSER_TREE_GROUPS_EAST};
                    case SIDE_GUER: {IDC_ASSETBROWSER_TREE_GROUPS_GUER};
                    case SIDE_CIV: {IDC_ASSETBROWSER_TREE_GROUPS_CIV};
                    case SIDE_EMPTY: {IDC_ASSETBROWSER_TREE_GROUPS_EMPTY};
                };
            } else {
                if (GVAR(abCurrentMode) == 2) then {
                    // Modules
                    _treeIDC = IDC_ASSETBROWSER_TREE_MODULES;
                };
            };
        };
        
        if (_treeIDC == -1) exitWith {};
        
        {
            _treeCtrl = _treeParent controlsGroupCtrl _x;
            _treeCtrl ctrlShow (_treeIDC == _x);
            _treeCtrl ctrlEnable (_treeIDC == _x);
            if (_treeIDC == _x) then {GVAR(abActiveTree) = _x};
        } forEach [
            IDC_ASSETBROWSER_TREE_UNITS_WEST,
            IDC_ASSETBROWSER_TREE_UNITS_EAST,
            IDC_ASSETBROWSER_TREE_UNITS_GUER,
            IDC_ASSETBROWSER_TREE_UNITS_CIV,
            IDC_ASSETBROWSER_TREE_UNITS_EMPTY,
            IDC_ASSETBROWSER_TREE_GROUPS_WEST,
            IDC_ASSETBROWSER_TREE_GROUPS_EAST,
            IDC_ASSETBROWSER_TREE_GROUPS_GUER,
            IDC_ASSETBROWSER_TREE_GROUPS_CIV,
            IDC_ASSETBROWSER_TREE_GROUPS_EMPTY,
            IDC_ASSETBROWSER_TREE_MODULES
        ];
        
        GVAR(abCurrentSubmode) = _index;
    };
};
