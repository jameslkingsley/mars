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

// Units
_treeIDC = IDC_ASSETBROWSER_TREE + 0;
_tree = GETUVAR(GVAR(interface),displayNull) ctrlCreate ["MARS_gui_treeABBase", _treeIDC];
_tree ctrlSetPosition AB_TREE_POS;
_tree ctrlCommit 0;
tvClear _tree;

//{
    _factions = (format["getNumber (_x >> 'side') == %1", SIDE_WEST]) configClasses (configFile >> "CfgFactionClasses");
    _factions = _factions apply {[_x, getText (_x >> "displayName")]};
    _factions sort true;
    
    {
        _factionClass = configName (_x select 0);
        _factionName = _x select 1;
        _factionParent = _tree tvAdd [[], _factionName];
        
        _condition = format ["
            getNumber (_x >> 'type') in [0,1] &&
            getText (_x >> 'faction') == '%1' &&
            getNumber (_x >> 'scope') == 2 &&
            getNumber (_x >> 'side') == %2",
            _factionClass,
            SIDE_WEST
        ];
        
        _units = _condition configClasses (configFile >> "CfgVehicles");
        _units = _units apply {[_x, getText (_x >> "displayName"), getText (_x >> "vehicleClass")]};
        _units sort true;
        
        _unitVehicleClasses = [];
        {_unitVehicleClasses pushBackUnique (getText ((_x select 0) >> "vehicleClass"))} forEach _units;
        
        _vehicleClasses = (format["(configName _x) in %1", _unitVehicleClasses]) configClasses (configFile >> "CfgVehicleClasses");
        _vehicleClasses = _vehicleClasses apply {[_x, (configName _x), getText (_x >> "displayName")]};
        _vehicleClasses sort true;
        
        {
            _className = _x select 1;
            _displayName = _x select 2;
            _vcPath = _tree tvAdd [[_factionParent], _displayName];
            
            {
                if ((_x select 2) == _className) then {
                    _unitPath = _tree tvAdd [[_factionParent,_vcPath], (_x select 1)];
                    _tree tvSetTooltip [[_factionParent,_vcPath,_unitPath], configName (_x select 0)];
                };
            } forEach _units;
        } forEach _vehicleClasses;
    } forEach _factions;
//} forEach [SIDE_WEST,SIDE_EAST,SIDE_GUER,SIDE_CIV];