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

disableSerialization;

{
    // Units
    _x params ["_treeIDC", "_side"];

    private _tree = GETUVAR(GVAR(interface),displayNull) displayCtrl _treeIDC;
    tvClear _tree;

    private _factions = format ["getNumber (_x >> 'side') == %1", _side] configClasses (configFile >> "CfgFactionClasses");

    {
        // Factions
        private _config = _x;
        private _configName = configName _config;
        private _displayName = getText (_config >> "displayName");
        private _objects = format [
            "getNumber (_x >> 'side') == %1 && getText (_x >> 'faction') == '%2' && getNumber (_x >> 'scope') == 2",
            _side,
            _configName
        ] configClasses (configFile >> "CfgVehicles");

        private _factionPath = _tree tvAdd [[], _displayName];
        private _subCats = [];

        {
            // Objects
            private _config = _x;
            private _configName = configName _config;
            private _displayName = getText (_config >> "displayName");
            private _icon = getText (_config >> "icon");
            private _iconPath = [getText (configFile >> "CfgVehicleIcons" >> _icon), _icon] select ((toLower _icon) find "\" > -1);
            private _objectPath = -1;
            private _subCat = getText (_config >> "editorSubcategory");
            private _subCatDisplayName = getText (configFile >> "CfgEditorSubcategories" >> _subCat >> "displayName");
            private _subCatPath = ((_subCats select {
                _x params ["_classname", "_path"];
                _classname == _subCat
            }) param [0, ["", -1]]) param [1, -1];

            if (_subCatPath == -1) then {
                _subCatPath = _tree tvAdd [[_factionPath], _subCatDisplayName];
                _subCats pushBack [_subCat, _subCatPath];
            };

            _objectPath = _tree tvAdd [[_factionPath, _subCatPath], _displayName];
            _tree tvSetData [[_factionPath, _subCatPath, _objectPath], _configName];
            _tree tvSetTooltip [[_factionPath, _subCatPath, _objectPath], _configName];
            _tree tvSetPicture [[_factionPath, _subCatPath, _objectPath], _iconPath];
            _tree tvSetPictureColor [[_factionPath, _subCatPath, _objectPath], [_side] call CFUNC(getSideColorByInt)];

            false
        } count _objects;

        _tree tvSort [[_factionPath], false];

        {
            _x params ["_classname", "_path"];

            if ((_tree tvCount [_factionPath, _path]) == 0) then {
                _tree tvDelete [_factionPath, _path];
            } else {
                _tree tvSort [[_factionPath, _path], false];
            };

            false
        } count _subCats;

        if ((_tree tvCount [_factionPath]) == 0) then {
            _tree tvDelete [_factionPath];
        };

        false
    } count _factions;

    _tree tvSort [[], false];

    false
} count [
    [IDC_ASSETBROWSER_TREE_UNITS_WEST, SIDE_WEST],
    [IDC_ASSETBROWSER_TREE_UNITS_EAST, SIDE_EAST],
    [IDC_ASSETBROWSER_TREE_UNITS_GUER, SIDE_GUER],
    [IDC_ASSETBROWSER_TREE_UNITS_CIV, SIDE_CIV],
    [IDC_ASSETBROWSER_TREE_UNITS_EMPTY, SIDE_EMPTY]
];
