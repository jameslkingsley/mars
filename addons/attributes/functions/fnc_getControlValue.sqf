/*
 * Author: Kingsley
 * Gets the final value of the given control class
 *
 * Arguments:
 * 0: Array of control data (passed to actionConfirm) <ARRAY>
 * 1: Control key string (category_item_control) <STRING>
 *
 * Return Value:
 * Control data <ANY>
 *
 * Example:
 * _data = [_this, "Terrain_Detail_Options"] call mars_attributes_fnc_getControlValue;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_controls", [], [[]]],
    ["_key", "", [""]]
];

if (_controls isEqualTo [] || {_key isEqualTo ""}) exitWith {};

private _result = "_ERROR_";

{
    if ((_x select 0) isEqualType []) then {
        private _combinedData = [];

        {
            _x params ["_id", "_data"];

            if (toLower _id == toLower _key) then {
                _combinedData pushBack _data;
            };

            false
        } count _x;

        if !(_combinedData isEqualTo []) then {
            _result = _combinedData;
        };
    } else {
        _x params ["_id", "_data"];

        if (toLower _id == toLower _key) exitWith {
            _result = _data;
        };
    };

    false
} count _controls;

_result
