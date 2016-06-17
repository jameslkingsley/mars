/*
 * Author: Kingsley
 * Checks if the given units position (when converted to screen space) is underneath the screen space cursor
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Under cursor <BOOL>
 *
 * Example:
 * _isUnderCursor = [] call mars_editor_fnc_isUnitScreenPosUnderCursor;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_unit", objNull, [objNull]]];

if (isNull _unit) exitWith {};

private _unitPos = ASLtoAGL (getPosASL _unit);
private _unitScreenPos = worldToScreen _unitPos;

if (_unitScreenPos isEqualTo []) exitWith {false};

if ((_unitScreenPos distance2D GVAR(mousePos)) <= 0.033) exitWith {true};

false