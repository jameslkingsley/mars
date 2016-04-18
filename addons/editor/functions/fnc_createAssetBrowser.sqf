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

#define DEFAULT_TAB_OPACITY 0.33

// Category Tabs
_tabs = "true" configClasses (configFile >> QGVARMAIN(assetBrowser) >> "tabs");

_tabWH = (0.15 * safeZoneW) / (count _tabs);

{
    private _idc = IDC_ASSETBROWSER_TAB + _forEachIndex;
    private _displayName = getText (_x >> "displayName");
    private _tooltipText = getText (_x >> "tooltipText");
    private _icon = getText (_x >> "icon");
    
    private _tab = GETUVAR(GVAR(interface),displayNull) ctrlCreate ["MARS_gui_tabBase", _idc];
    GVAR(tabs) pushBackUnique _idc;
    
    _tab ctrlSetText _icon;
    _tab ctrlSetTooltip _tooltipText;
    
    _tab setVariable [QGVAR(tabConfig), _x];
    
    _tab ctrlSetPosition [
        (0.85 * safeZoneW + safeZoneX) + (_tabWH * _forEachIndex),
        (0.035 * safeZoneH + safeZoneY),
        _tabWH,
        _tabWH
    ];
    
    _tab ctrlSetFade DEFAULT_TAB_OPACITY;
    
    _tab ctrlAddEventHandler ["MouseEnter", {
        params ["_ctrl"];
    }];
    
    _tab ctrlAddEventHandler ["MouseExit", {
        params ["_ctrl"];
    }];
    
    _tab ctrlAddEventHandler ["MouseButtonDown", {
        params ["_control","_button","_cordX","_cordY","_shift","_ctrl","_alt"];
        
        if (_button == 0) then {
            // Reset opacity of all tabs
            {
                disableSerialization;
                private _control = (GETUVAR(GVAR(interface),displayNull) displayCtrl _x);
                _control ctrlSetFade DEFAULT_TAB_OPACITY;
                _control ctrlCommit 0;
            } forEach GVAR(tabs);
            
            _control ctrlSetFade 0;
            _control ctrlCommit 0;
            
            _config = _control getVariable [QGVAR(tabConfig), configNull];
            
            if (!isNull _config) then {
                
            };
        };
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