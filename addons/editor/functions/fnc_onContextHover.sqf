/*
 * Author: Kingsley
 * Handles hovering over a context menu option
 *
 * Arguments: See fnc_createContextMenu.sqf
 * 0: Control <ARRAY> (see UI event handlers)
 * 1: IDC <INT>
 * 2: X index <INT>
 * 3: Y index <INT>
 *
 * Return Value:
 * None
 *
 * Example:
 * N/A
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_control","_idc","_xIndex","_yIndex","_startYPos"];
_control params ["_ctrl"];

[_xIndex + 1] call FUNC(closeContextByIndex);

_children = _ctrl getVariable [QGVAR(ctrlChildren), []];
if (_children isEqualTo []) exitWith {};

[_children, _xIndex + 1, _yIndex, _startYPos] call FUNC(createContextMenu);
