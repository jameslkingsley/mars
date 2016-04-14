/*
 * Author: Kingsley
 * Creates the asset browser control
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call mars_editor_fnc_createAssetBrowser;
 *
 * Public: No
 */

#include "script_component.hpp"

// Category Tabs
_tabs = [
    ["Units", QUOTE(PATHTOF(data\AssetBrowser\modeunits_ca.paa))],
    ["Groups", QUOTE(PATHTOF(data\AssetBrowser\modegroups_ca.paa))],
    ["Props", QUOTE(PATHTOF(data\AssetBrowser\modeprops_ca.paa))],
    ["Markers", QUOTE(PATHTOF(data\AssetBrowser\modemarkers_ca.paa))],
    ["Favorites", QUOTE(PATHTOF(data\AssetBrowser\modefavorites_ca.paa))]
];

_tabWH = (0.15 * safeZoneW) / (count _tabs);

{
    _tab = GETUVAR(GVAR(interface),displayNull) ctrlCreate ["MARS_gui_tabBase", IDC_ASSETBROWSER_TAB + _forEachIndex];
    _tab ctrlSetText (_x select 1);
    
    _tab ctrlSetPosition [
        (0.85 * safeZoneW + safeZoneX) + (_tabWH * _forEachIndex),
        (0.035 * safeZoneH + safeZoneY),
        _tabWH,
        _tabWH
    ];
    
    _tab ctrlAddEventHandler ["MouseEnter", {
        params ["_ctrl"];
        // _ctrl ctrlSetBackgroundColor COLOR_ACCENT_RGBA_ARR;
    }];
    
    _tab ctrlAddEventHandler ["MouseExit", {
        params ["_ctrl"];
        // _ctrl ctrlSetBackgroundColor [0,0,0,0];
    }];
    
    _tab ctrlCommit 0;
} forEach _tabs;

// Asset Tree
/*_tree = GETUVAR(GVAR(interface),displayNull) ctrlCreate ["MARS_gui_treeBase", IDC_ASSETBROWSER];
_tree ctrlSetPosition [
    (0.85 * safeZoneW + safeZoneX),
    (0.025 * safeZoneH + safeZoneY),
    (0.15 * safeZoneW),
    (safeZoneH - 0.025)
];

_tree ctrlCommit 0;
tvClear _tree;*/