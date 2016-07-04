/*
 * Author: Kingsley
 * Gets the virtual group the given unit is assigned to (returns null if no group exists)
 *
 * Arguments:
 * 0: Unit to get group from <OBJECT>
 *
 * Return Value:
 * Virtual group namespace <LOCATION>
 *
 * Example:
 * _group = [leader player, units player] call mars_common_fnc_createVirtualGroup;
 * _group = [player] call mars_common_fnc_getVirtualGroup;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_unit", objNull, [objNull]]];

if (isNull _unit) exitWith {};

(_unit getVariable ["virtualGroup", locationNull])