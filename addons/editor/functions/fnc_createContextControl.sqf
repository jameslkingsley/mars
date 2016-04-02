/*
 * Author: Kingsley
 * Creates the context control item
 *
 * Arguments:
 * <TODO>
 *
 * Return Value:
 * Control <CONTROL>
 *
 * Example:
 * <TODO>
 *
 * Public: No
 */

#include "script_component.hpp"

disableSerialization;

params ["_idc","_index","_level","_hasChildren","_displayName","_offsetY","_compIndex"];
private ["_control","_axisX","_axisY"];

_control = GETUVAR(GVAR(interface),displayNull) ctrlCreate ["MARS_gui_contextBase", _idc];
_control ctrlSetText (format ["%1%2", _displayName, (["","..."] select _hasChildren)]);

_axisX = (GVAR(currentMousePos) select 0) + ((CONTEXT_OPTION_WIDTH + 0.005) * _level);
_axisY = (GVAR(currentMousePos) select 1) + (CONTEXT_OPTION_HEIGHT * _index) + (CONTEXT_OPTION_HEIGHT * _offsetY) + (CONTEXT_OPTION_HEIGHT * _compIndex);

_control ctrlSetPosition [
    _axisX,
    _axisY,
    CONTEXT_OPTION_WIDTH,
    CONTEXT_OPTION_HEIGHT
];

_control ctrlCommit 0;

(ctrlIDC _control)