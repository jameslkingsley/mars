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
_tabs = "true" configClasses (configFile >> QGVARMAIN(assetBrowser) >> "tabs");

_tabWH = (0.15 * safeZoneW) / (count _tabs);

{
    private _idc = IDC_ASSETBROWSER_TAB + _forEachIndex;
    private _displayName = getText (_x >> "displayName");
    private _tooltipText = getText (_x >> "tooltipText");
    private _icon = getText (_x >> "icon");
    private _onSearch = [(getText (_x >> "onSearch")),""] select (isNull (_x >> "onSearch"));
    
    private _tab = GETUVAR(GVAR(interface),displayNull) ctrlCreate ["MARS_gui_tabBase", _idc];
    GVAR(tabs) pushBackUnique _idc;
    
    _tab ctrlSetText _icon;
    _tab ctrlSetTooltip _tooltipText;
    
    _tab ctrlSetPosition [
        (0.85 * safeZoneW + safeZoneX) + (_tabWH * _forEachIndex),
        (0.035 * safeZoneH + safeZoneY),
        _tabWH,
        _tabWH
    ];
    
    _tab setVariable [QGVAR(tabConfig), _x];
    _tab setVariable [QGVAR(tabWH), _tabWH];
    
    _tab ctrlSetFade DEFAULT_TAB_OPACITY;
    
    _tab ctrlAddEventHandler ["MouseButtonDown", {_this call FUNC(onABTabClick)}];
    
    if (_forEachIndex == 0) then {
        [_tab, 0] call FUNC(onABTabClick);
    };
    
    _tab ctrlCommit 0;
} forEach _tabs;

// Asset Tree
_tree = GETUVAR(GVAR(interface),displayNull) ctrlCreate ["MARS_gui_treeBase", IDC_ASSETBROWSER];
_tree ctrlSetPosition [
    (0.85 * safeZoneW + safeZoneX),
    (0.1 * safeZoneH + safeZoneY),
    (0.15 * safeZoneW),
    (safeZoneH - 0.1)
];

_tree ctrlCommit 0;
tvClear _tree;