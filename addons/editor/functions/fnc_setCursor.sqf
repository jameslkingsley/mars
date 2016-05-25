/*
 * Author: Kingsley
 * Sets the cursor icon type
 *
 * Arguments:
 * 0: Cursor type (optional, omit to reset cursor) <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["select"] call mars_editor_fnc_setCursor;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_type", "", [""]]
];

if (toLower GVAR(currentCursor) == toLower _type) exitWith {};

disableSerialization;

private _display = GETUVAR(GVAR(interface),displayNull);
private _ctrlCursor = _display displayCtrl IDC_CURSORHELPER;

GVAR(currentCursor) = toLower _type;

_ctrlCursor ctrlSetText ([getText (configFile >> QGVARMAIN(cursors) >> _type >> "path"), ""] select (_type == ""));
