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

params [["_display", displayNull, [displayNull]]];

#define CLEANUP(PATH)\
    if ((_tree tvCount PATH) == 0) then {\
        _tree tvDelete PATH;\
    } else {\
        _tree tvSort [PATH, false];\
    };

GVAR(serializedABData) params ["_units", "_objects", "_groups", "_modules"];

{
    // Trees
    _x params ["_treeIDC", "_factions"];

    private _tree = _display displayCtrl _treeIDC;
    tvClear _tree;

    {
        // Factions
        _x params ["_factionClassname", "_categories"];

        private _config = (configFile >> "CfgFactionClasses" >> _factionClassname);
        private _displayName = getText (_config >> "displayName");
        private _side = getNumber (_config >> "side");
        private _factionPath = _tree tvAdd [[], _displayName];

        {
            // Categories
            _x params ["_categoryClassname", "_objects"];

            private _catDisplayName = getText (configFile >> "CfgEditorSubcategories" >> _categoryClassname >> "displayName");
            private _catPath = _tree tvAdd [[_factionPath], _catDisplayName];

            {
                // Objects
                private _objectClassname = _x;
                private _config = (configFile >> "CfgVehicles" >> _objectClassname);
                private _displayName = getText (_config >> "displayName");
                private _icon = getText (_config >> "icon");
                private _iconPath = [getText (configFile >> "CfgVehicleIcons" >> _icon), _icon] select ((toLower _icon) find "\" > -1);
                private _data = format ["['unit', '(configFile >> ''CfgVehicles'' >> ''%1'')']", _objectClassname];

                _objectPath = _tree tvAdd [[_factionPath, _catPath], _displayName];
                _tree tvSetData [[_factionPath, _catPath, _objectPath], _data];
                _tree tvSetTooltip [[_factionPath, _catPath, _objectPath], _objectClassname];
                _tree tvSetPicture [[_factionPath, _catPath, _objectPath], _iconPath];
                _tree tvSetPictureColor [[_factionPath, _catPath, _objectPath], [_side] call CFUNC(getSideColorByInt)];

                false
            } count _objects;

            CLEANUP([ARR_2(_factionPath, _catPath)]);

            false
        } count _categories;

        CLEANUP([_factionPath]);

        false
    } count _factions;

    false
} count _units;

{
    // Trees
    _x params ["_treeIDC", "_categories"];

    private _tree = _display displayCtrl _treeIDC;
    tvClear _tree;

    {
        // Categories
        _x params ["_catClassname", "_subCategories"];

        private _config = (configFile >> "CfgEditorCategories" >> _catClassname);
        private _displayName = getText (_config >> "displayName");
        private _side = SIDE_EMPTY;
        private _catPath = _tree tvAdd [[], _displayName];

        {
            // Categories
            _x params ["_subCatClassname", "_objects"];

            private _subCatDisplayName = getText (configFile >> "CfgEditorSubcategories" >> _subCatClassname >> "displayName");
            private _subCatPath = _tree tvAdd [[_catPath], _subCatDisplayName];

            {
                // Objects
                private _objectClassname = _x;
                private _config = (configFile >> "CfgVehicles" >> _objectClassname);
                private _displayName = getText (_config >> "displayName");
                private _icon = getText (_config >> "icon");
                private _iconPath = [getText (configFile >> "CfgVehicleIcons" >> _icon), _icon] select ((toLower _icon) find "\" > -1);
                private _data = format ["['object', '(configFile >> ''CfgVehicles'' >> ''%1'')']", _objectClassname];

                if (count _displayName > 0) then {
                    _objectPath = _tree tvAdd [[_catPath, _subCatPath], _displayName];
                    _tree tvSetData [[_catPath, _subCatPath, _objectPath], _data];
                    _tree tvSetTooltip [[_catPath, _subCatPath, _objectPath], _objectClassname];
                    _tree tvSetPicture [[_catPath, _subCatPath, _objectPath], _iconPath];
                    _tree tvSetPictureColor [[_catPath, _subCatPath, _objectPath], [_side] call CFUNC(getSideColorByInt)];
                };

                false
            } count _objects;

            CLEANUP([ARR_2(_catPath, _subCatPath)]);

            false
        } count _subCategories;

        CLEANUP([_catPath]);

        false
    } count _categories;

    CLEANUP([]);

    false
} count _objects;

{
    // Trees
    _x params ["_treeIDC", "_factions"];

    private _sideIndex = [
        IDC_ASSETBROWSER_TREE_GROUPS_EAST,
        IDC_ASSETBROWSER_TREE_GROUPS_WEST,
        IDC_ASSETBROWSER_TREE_GROUPS_GUER,
        IDC_ASSETBROWSER_TREE_GROUPS_EMPTY
    ] find _treeIDC;

    private _side = ["East", "West", "Indep", "Empty"] select ([3, _sideIndex] select (_sideIndex > -1));
    private _tree = _display displayCtrl _treeIDC;
    tvClear _tree;

    {
        // Factions
        _x params ["_catClassname", "_catGroups"];

        private _config = (configFile >> "CfgGroups" >> _side >> _catClassname);
        private _displayName = getText (_config >> "name");
        private _factionPath = _tree tvAdd [[], _displayName];

        {
            // Categories
            _x params ["_grpClassname", "_items"];

            private _grpDisplayName = getText (configFile >> "CfgGroups" >> _side >> _catClassname >> _grpClassname >> "name");
            private _grpCatPath = _tree tvAdd [[_factionPath], _grpDisplayName];

            {
                // Objects
                private _objectClassname = _x;
                private _config = (configFile >> "CfgGroups" >> _side >> _catClassname >> _grpClassname >> _objectClassname);
                private _displayName = getText (_config >> "name");
                private _icon = getText (_config >> "icon");
                private _color = [[_sideIndex] call CFUNC(getSideColorByInt), [COLOR_EMPTY_RGBA]] select (_sideIndex == 3);
                private _data = format ["['group', '(configFile >> ''CfgGroups'' >> ''%1'' >> ''%2'' >> ''%3'' >> ''%4'')']", _side, _catClassname, _grpClassname, _objectClassname];

                if (count _displayName > 0) then {
                    _objectPath = _tree tvAdd [[_factionPath, _grpCatPath], _displayName];
                    _tree tvSetData [[_factionPath, _grpCatPath, _objectPath], _data];
                    _tree tvSetTooltip [[_factionPath, _grpCatPath, _objectPath], _objectClassname];
                    _tree tvSetPicture [[_factionPath, _grpCatPath, _objectPath], _icon];
                    _tree tvSetPictureColor [[_factionPath, _grpCatPath, _objectPath], _color];
                };

                false
            } count _items;

            CLEANUP([ARR_2(_factionPath, _grpCatPath)]);

            false
        } count _catGroups;

        CLEANUP([_factionPath]);

        false
    } count _factions;

    CLEANUP([]);

    false
} count _groups;

{
    // Trees
    _x params ["_treeIDC", "_components"];

    private _tree = _display displayCtrl _treeIDC;
    tvClear _tree;

    {
        // Components
        _x params ["_compClassname", "_compModules"];

        private _config = (configFile >> QGVARMAIN(modules) >> _compClassname);
        private _displayName = getText (_config >> "displayName");
        private _componentPath = _tree tvAdd [[], _displayName];

        {
            // Modules
            _x params ["_modClassname", "_modData"];
            _modData params ["_displayName", "_tooltipText", "_icon", "_action"];

            private _modulePath = _tree tvAdd [[_componentPath], _displayName];
            _tree tvSetTooltip [[_componentPath, _modulePath], _tooltipText];
            _tree tvSetPicture [[_componentPath, _modulePath], _icon];
            _tree tvSetPictureColor [[_componentPath, _modulePath], [1,1,1,1]];
            
            private _data = format ["['module', '(configFile >> ''%1'' >> ''%2'' >> ''%3'')']", QGVARMAIN(modules), _compClassname, _modClassname];
            _tree tvSetData [[_componentPath, _modulePath], _data];

            false
        } count _compModules;

        CLEANUP([_componentPath]);

        false
    } count _components;

    CLEANUP([]);

    false
} count _modules;
