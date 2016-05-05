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
/*
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
*/

// Units
_treeIDC = IDC_ASSETBROWSER_TREE + 0;
_tree = GETUVAR(GVAR(interface),displayNull) ctrlCreate ["MARS_gui_treeABBase", _treeIDC];
_tree ctrlSetPosition AB_TREE_POS;
_tree ctrlCommit 0;
tvClear _tree;

//{
    _factions = (format["getNumber (_x >> 'side') == %1", SIDE_WEST]) configClasses (configFile >> "CfgFactionClasses");
    
    {
        _factionClass = configName _x;
        _factionName = getText (_x >> "displayName");
        _factionParent = _tree tvAdd [[], _factionName];
        
        _condition = format ["getNumber (_x >> 'type') == 0 && getText (_x >> 'faction') == '%1'", _factionClass];
        _units = _condition configClasses (configFile >> "CfgVehicles");
        
        _vehicleClasses = [];

        {
            _vehicleClass = getText (_x >> "vehicleClass");
            _vehicleClassDisplayName = getText (configFile >> "CfgVehicleClasses" >> _vehicleClass >> "displayName");
            _vehicleClassPath = -1;
            
            {
                if (_vehicleClass == (_x select 0)) exitWith {
                    _vehicleClassPath = _x select 1;
                };
            } forEach _vehicleClasses;
            
            if (_vehicleClassPath < 0) then {
                _vcPath = _tree tvAdd [[_factionParent], _vehicleClassDisplayName];
                _vehicleClasses pushBack [_vehicleClass, _vcPath];
            };
            
            _itemPath = _tree tvAdd [[_factionParent,_vehicleClassPath], (getText (_x >> "displayName"))];
            _tree tvSetTooltip [[_factionParent,_vehicleClassPath,_itemPath], configName _x];
        } forEach _units;
    } forEach _factions;
//} forEach [SIDE_WEST,SIDE_EAST,SIDE_GUER,SIDE_CIV];