/*
 * Author: Kingsley
 * Closes a context menu by the given index
 *
 * Arguments:
 * 0: Index <INT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [1] call mars_editor_fnc_closeContextByIndex;
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_index", -1]];

if (_index < 0) exitWith {};

if ((count GVAR(indexedContexts) - 1) >= _index) then {
    for "_i" from _index to (count GVAR(indexedContexts) - 1) do {
        _controls = GVAR(indexedContexts) select _i;
        {ctrlDelete (GETUVAR(GVAR(interface),displayNull) displayCtrl _x)} forEach _controls;
    };
};
