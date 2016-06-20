/*
 * Author: Kingsley
 * Creates a list box control (aligned right)
 *
 * Arguments:
 * 0: Control config <STRING>
 * 1: IDC <NUMBER>
 * 2: Group IDC <NUMBER>
 * 3: Position <ARRAY>
 *
 * Return Value:
 * Created control <CONTROL>
 *
 * Example:
 * ["configFile >> 'SomeConfig'", 100, 90, [0,0,0,0]] call mars_attributes_fnc_ctrlList_Right;
 *
 * Public: No
 */

#include "script_component.hpp"

private _script = preprocessFileLineNumbers QPATHTOF(functions\fnc_ctrlList.sqf);

{
    _x params ["_start", "_end"];
    _script = [_script, _start, _end] call CBA_fnc_replace;
} forEach [
    ["lbSetPicture", "lbSetPictureRight"],
    ["lbSetPictureColor", "lbSetPictureRightColor"]
];

_this call compile _script;