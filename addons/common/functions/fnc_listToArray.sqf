/*
 * Author: Kingsley
 * Converts a comma delimited string of items into an array of strings
 *
 * Arguments:
 * 0: Comma delimited list <STRING>
 *
 * Return Value:
 * Array of strings <ARRAY>
 *
 * Example:
 * _array = ["item1, item2, item3"] call mars_common_fnc_listToArray;
 * // _array = ["item1", "item2", "item3"];
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_list", "", [""]]];

if (_list == "") exitWith {[]};

private _items = _list splitString ",";
_items = _items apply {[_x] call CBA_fnc_trim};

_items