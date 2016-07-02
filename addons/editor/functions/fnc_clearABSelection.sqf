/*
 * Author: Kingsley
 * Clears the asset browser selection
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call mars_editor_fnc_clearABSelection;
 *
 * Public: Yes
 */

#include "script_component.hpp"

private _display = GETUVAR(GVAR(interface),displayNull);

{
    private _tree = _display displayCtrl _x;
    _tree tvSetCurSel [-1];
} forEach [
    IDC_ASSETBROWSER_TREE_UNITS_WEST,
    IDC_ASSETBROWSER_TREE_UNITS_EAST,
    IDC_ASSETBROWSER_TREE_UNITS_GUER,
    IDC_ASSETBROWSER_TREE_UNITS_CIV,
    IDC_ASSETBROWSER_TREE_UNITS_EMPTY,
    IDC_ASSETBROWSER_TREE_GROUPS_WEST,
    IDC_ASSETBROWSER_TREE_GROUPS_EAST,
    IDC_ASSETBROWSER_TREE_GROUPS_GUER,
    IDC_ASSETBROWSER_TREE_GROUPS_CIV,
    IDC_ASSETBROWSER_TREE_GROUPS_EMPTY,
    IDC_ASSETBROWSER_TREE_MODULES
];