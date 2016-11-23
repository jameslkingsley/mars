/*
 * Author: Kingsley
 * Adds a line to the debug panel
 * Updates every frame
 *
 * Arguments:
 * 0: Label <STRING>
 * 1: Code <CODE>
 * 2: Only show for single selection <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["Assigned Target", {assignedTarget _this}, true] call mars_editor_fnc_addToDebugPanel;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_label", "", [""]],
    ["_code", {}, ["", {}]],
    ["_single", false, [false]]
];

if (_code isEqualType "") then {
    if (!isNil _code) then {
        _code = compile format ["_this call %1", _code];
    } else {
        _code = compile _code;
    };
};

GVAR(debugPaneLines) pushBack [_label, _code, _single];
