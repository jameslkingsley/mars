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

params [["_display", displayNull]];

#define CLEANUP(PATH)\
    if ((_tree tvCount PATH) == 0) then {\
        _tree tvDelete PATH;\
    } else {\
        _tree tvSort [PATH, false];\
    };

{
    // Tabs
    _x params ["_units"];

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

                    _objectPath = _tree tvAdd [[_factionPath, _catPath], _displayName];
                    _tree tvSetData [[_factionPath, _catPath, _objectPath], _objectClassname];
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

    false
} count GVAR(serializedABData);
