/*
 * Author: Kingsley
 * Handles showing asset browser tree views
 *
 * Arguments:
 * 0: Tree View IDC <INT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [1234] call mars_editor_fnc_handleAssetBrowser;
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_treeIDC", -1, [0]]];

disableSerialization;

{
    private _tree = GETUVAR(GVAR(interface),displayNull) displayCtrl _x;
    _tree ctrlShow false;
    _tree ctrlEnable false;
} forEach [
    IDC_ASSETBROWSER_TREE_UNITS_WEST,
    IDC_ASSETBROWSER_TREE_UNITS_EAST,
    IDC_ASSETBROWSER_TREE_UNITS_GUER,
    IDC_ASSETBROWSER_TREE_UNITS_CIV,
    IDC_ASSETBROWSER_TREE_UNITS_EMPTY
];

private _tree = GETUVAR(GVAR(interface),displayNull) displayCtrl _treeIDC;
_tree ctrlShow true;
_tree ctrlEnable true;