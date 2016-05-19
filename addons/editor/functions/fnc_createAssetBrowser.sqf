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

{ // Units
    _treeIDC = _x select 0;
    _side = _x select 1;
    _categories = _x select 2;
    _tree = GETUVAR(GVAR(interface),displayNull) displayCtrl _treeIDC;
    tvClear _tree;
    
    if (_treeIDC == IDC_ASSETBROWSER_TREE_UNITS_EMPTY) then {
        _condition = format ["
            getText (_x >> 'vehicleClass') in %1 &&
            getNumber (_x >> 'scope') == 2 &&
            count (getText (_x >> 'displayName')) > 0",
            _categories
        ];
        
        _units = _condition configClasses (configFile >> "CfgVehicles");
        _units = _units apply {[_x, getText (_x >> "displayName"), getText (_x >> "vehicleClass")]};
        _units sort true;
        
        _unitVehicleClasses = [];
        {_unitVehicleClasses pushBackUnique (getText ((_x select 0) >> "vehicleClass"));false} count _units;
        
        _vehicleClasses = (format["(configName _x) in %1", _unitVehicleClasses]) configClasses (configFile >> "CfgVehicleClasses");
        _vehicleClasses = _vehicleClasses apply {[_x, (configName _x), getText (_x >> "displayName")]};
        _vehicleClasses sort true;
        
        {
            _className = _x select 1;
            _displayName = _x select 2;
            _vcPath = _tree tvAdd [[], _displayName];
            
            {
                if ((_x select 2) == _className) then {
                    private _icon = getText ((_x select 0) >> "icon");
                    private _iconTex = if (_icon find "\a3\" > -1 || _icon find "\A3\" > -1) then {_icon} else {getText (configFile >> "CfgVehicleIcons" >> _icon)};
                    private _side = getNumber ((_x select 0) >> "side");
                    private _dataStr = format ["['unit','%1']", configName (_x select 0)];
                    _unitPath = _tree tvAdd [[_vcPath], (_x select 1)];
                    _tree tvSetData [[_vcPath,_unitPath], _dataStr];
                    _tree tvSetPicture [[_vcPath,_unitPath], _iconTex];
                    _tree tvSetPictureColor [[_vcPath,_unitPath], COLOR_EMPTY_RGBA_ARR];
                    _tree tvSetTooltip [[_vcPath,_unitPath], configName (_x select 0)];
                };
                false
            } count _units;
            false
        } count _vehicleClasses;
    } else {
        _factions = (format["getNumber (_x >> 'side') in %1", _side]) configClasses (configFile >> "CfgFactionClasses");
        _factions = _factions apply {[_x, getText (_x >> "displayName")]};
        _factions sort true;
        
        {
            _factionClass = configName (_x select 0);
            _factionName = _x select 1;
            _factionParent = _tree tvAdd [[], _factionName];
            
            _condition = format ["
                getNumber (_x >> 'type') in [0,1,2] &&
                getText (_x >> 'faction') == '%1' &&
                getNumber (_x >> 'scope') == 2 &&
                getNumber (_x >> 'side') in %2 &&
                count (getText (_x >> 'displayName')) > 0",
                _factionClass,
                _side
            ];
            
            _units = _condition configClasses (configFile >> "CfgVehicles");
            _units = _units apply {[_x, getText (_x >> "displayName"), getText (_x >> "vehicleClass")]};
            _units sort true;
            
            _unitVehicleClasses = [];
            {_unitVehicleClasses pushBackUnique (getText ((_x select 0) >> "vehicleClass"));false} count _units;
            
            _vehicleClasses = (format["(configName _x) in %1", _unitVehicleClasses]) configClasses (configFile >> "CfgVehicleClasses");
            _vehicleClasses = _vehicleClasses apply {[_x, (configName _x), getText (_x >> "displayName")]};
            _vehicleClasses sort true;
            
            {
                _className = _x select 1;
                _displayName = _x select 2;
                _vcPath = _tree tvAdd [[_factionParent], _displayName];
                
                {
                    if ((_x select 2) == _className) then {
                        private _icon = getText ((_x select 0) >> "icon");
                        private _iconTex = if (_icon find "\a3\" > -1 || _icon find "\A3\" > -1) then {_icon} else {getText (configFile >> "CfgVehicleIcons" >> _icon)};
                        private _side = getNumber ((_x select 0) >> "side");
                        private _dataStr = format ["['unit','%1']", configName (_x select 0)];
                        _unitPath = _tree tvAdd [[_factionParent,_vcPath], (_x select 1)];
                        _tree tvSetData [[_factionParent,_vcPath,_unitPath], _dataStr];
                        _tree tvSetPicture [[_factionParent,_vcPath,_unitPath], _iconTex];
                        _tree tvSetPictureColor [[_factionParent,_vcPath,_unitPath], [_side] call EFUNC(common,getSideColorByInt)];
                        _tree tvSetTooltip [[_factionParent,_vcPath,_unitPath], configName (_x select 0)];
                    };
                    false
                } count _units;
                false
            } count _vehicleClasses;
            false
        } count _factions;
    };
    
    _tree ctrlShow false;
    _tree ctrlEnable false;
    false
} count [
    [IDC_ASSETBROWSER_TREE_UNITS_WEST, [SIDE_WEST], AB_CATEGORY_UNITS],
    [IDC_ASSETBROWSER_TREE_UNITS_EAST, [SIDE_EAST], AB_CATEGORY_UNITS],
    [IDC_ASSETBROWSER_TREE_UNITS_GUER, [SIDE_GUER], AB_CATEGORY_UNITS],
    [IDC_ASSETBROWSER_TREE_UNITS_CIV, [SIDE_CIV], AB_CATEGORY_UNITS],
    [IDC_ASSETBROWSER_TREE_UNITS_EMPTY, [SIDE_EMPTY], AB_CATEGORY_OBJECTS]
];

{ // Groups
    _treeIDC = _x select 0;
    _side = _x select 1;
    
    if (_treeIDC != IDC_ASSETBROWSER_TREE_GROUPS_CIV) then {
        _tree = GETUVAR(GVAR(interface),displayNull) displayCtrl _treeIDC;
        tvClear _tree;
        
        if (_treeIDC == IDC_ASSETBROWSER_TREE_GROUPS_EMPTY) then {
            _condition = format ["
                getText (_x >> 'vehicleClass') in %1 &&
                getNumber (_x >> 'scope') == 2 &&
                count (getText (_x >> 'displayName')) > 0",
                _categories
            ];
            
            _units = _condition configClasses (configFile >> "CfgVehicles");
            _units = _units apply {[_x, getText (_x >> "displayName"), getText (_x >> "vehicleClass")]};
            _units sort true;
            
            _unitVehicleClasses = [];
            {_unitVehicleClasses pushBackUnique (getText ((_x select 0) >> "vehicleClass"));false} count _units;
            
            _vehicleClasses = (format["(configName _x) in %1", _unitVehicleClasses]) configClasses (configFile >> "CfgVehicleClasses");
            _vehicleClasses = _vehicleClasses apply {[_x, (configName _x), getText (_x >> "displayName")]};
            _vehicleClasses sort true;
            
            {
                _className = _x select 1;
                _displayName = _x select 2;
                _vcPath = _tree tvAdd [[], _displayName];
                
                {
                    if ((_x select 2) == _className) then {
                        private _icon = getText ((_x select 0) >> "icon");
                        private _side = getNumber ((_x select 0) >> "side");
                        private _dataStr = format ["['group','%1']", configName (_x select 0)];
                        _unitPath = _tree tvAdd [[_vcPath], (_x select 1)];
                        _tree tvSetData [[_vcPath,_unitPath], _dataStr];
                        _tree tvSetPicture [[_vcPath,_unitPath], _icon];
                        _tree tvSetPictureColor [[_vcPath,_unitPath], COLOR_EMPTY_RGBA_ARR];
                        _tree tvSetTooltip [[_vcPath,_unitPath], configName (_x select 0)];
                    };
                    false
                } count _units;
                false
            } count _vehicleClasses;
        } else {
            _grpSide = switch (_side) do {
                case SIDE_WEST: {"West"};
                case SIDE_EAST: {"East"};
                case SIDE_GUER: {"Indep"};
                case SIDE_EMPTY: {"Empty"};
            };
            
            _groups = "count (getText (_x >> 'name')) > 0" configClasses (configFile >> "CfgGroups" >> _grpSide);
            _groups = _groups apply {[_x, getText (_x >> "name")]};
            _groups sort true;
            
            {
                private _cfg = _x select 0;
                private _name = _x select 1;
                
                _grpParent = _tree tvAdd [[], _name];
                _cats = "true" configClasses (_cfg);
                _cats = _cats apply {[_x, getText (_x >> "name")]};
                _cats sort true;
                
                {
                    private _name = _x select 1;
                    private _entities = "true" configClasses (_x select 0);
                    _entities = _entities apply {[_x, getText (_x >> "name")]};
                    _entities sort true;
                    _catParent = _tree tvAdd [[_grpParent], _name];
                    
                    {
                        private _icon = getText ((_x select 0) >> "icon");
                        private _side = getNumber ((_x select 0) >> "side");
                        private _dataStr = format ["['group','%1']", configName (_x select 0)];
                        _entParent = _tree tvAdd [[_grpParent,_catParent], (_x select 1)];
                        _tree tvSetData [[_grpParent,_catParent,_entParent], _dataStr];
                        _tree tvSetPicture [[_grpParent,_catParent,_entParent], _icon];
                        _tree tvSetPictureColor [[_grpParent,_catParent,_entParent], [_side] call EFUNC(common,getSideColorByInt)];
                        false
                    } count _entities;
                    false
                } count _cats;
                false
            } count _groups;
        };
        
        _tree ctrlShow false;
        _tree ctrlEnable false;
        false
    };
} count [
    [IDC_ASSETBROWSER_TREE_GROUPS_WEST, SIDE_WEST],
    [IDC_ASSETBROWSER_TREE_GROUPS_EAST, SIDE_EAST],
    [IDC_ASSETBROWSER_TREE_GROUPS_GUER, SIDE_GUER],
    [IDC_ASSETBROWSER_TREE_GROUPS_CIV, SIDE_CIV],
    [IDC_ASSETBROWSER_TREE_GROUPS_EMPTY, SIDE_EMPTY]
];
