/*
 * Author: Kingsley
 * Serializes asset browser data into a nested array
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Nested array (used by createAssetBrowser) <ARRAY>
 * 0: Units
 * 1: Groups
 * 2: Empty
 *
 * Example:
 * [] call mars_editor_fnc_serializeAssetBrowser;
 *
 * Public: No
 */

#include "script_component.hpp"

private _unitResult = [];

{
    _x params ["_treeIDC", "_side"];

    private _factions = format ["getNumber (_x >> 'side') == %1", _side] configClasses (configFile >> "CfgFactionClasses");
    private _factionResult = [];

    {
        // Factions
        private _config = _x;
        private _configName = configName _config;
        private _objects = format [
            "getNumber (_x >> 'side') == %1 && getText (_x >> 'faction') == '%2' && getNumber (_x >> 'scope') == 2",
            _side,
            _configName
        ] configClasses (configFile >> "CfgVehicles");

        private _subCats = [];

        {
            // Objects
            private _config = _x;
            private _configName = configName _config;
            private _subCat = getText (_config >> "editorSubcategory");
            private _subCatPath = ((_subCats select {
                _x params ["_classname", "_objects"];
                _classname == _subCat
            }) param [0, ["", []]]) param [0, ""];

            if (_subCatPath == "") then {
                _subCats pushBack [_subCat, [_configName]];
            } else {
                {
                    _x params ["_category", "_objects"];
                    if (_category == _subCat) exitWith {
                        _objects pushBack _configName;
                        _subCats set [_forEachIndex, [_category, _objects]];
                    };
                } forEach _subCats;
            };

            false
        } count _objects;

        _factionResult pushBack [
            _configName,
            _subCats
        ];

        false
    } count _factions;

    _unitResult pushBack [
        _treeIDC,
        _factionResult
    ];

    false
} count [
    [IDC_ASSETBROWSER_TREE_UNITS_WEST, SIDE_WEST],
    [IDC_ASSETBROWSER_TREE_UNITS_EAST, SIDE_EAST],
    [IDC_ASSETBROWSER_TREE_UNITS_GUER, SIDE_GUER],
    [IDC_ASSETBROWSER_TREE_UNITS_CIV, SIDE_CIV],
    [IDC_ASSETBROWSER_TREE_UNITS_EMPTY, SIDE_EMPTY]
];

[[_unitResult]]