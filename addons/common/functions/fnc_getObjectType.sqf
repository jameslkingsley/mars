/*
 * Author: Kingsley
 * Gets the objects' type based on the given config
 *
 * Arguments:
 * 0: Object config path <ARRAY>
 *
 * Return Value:
 * Object type (man, vehicle, group) <STRING>
 *
 * Example:
 * ["CfgVehicles", "B_soldier_F"] call mars_common_fnc_getObjectType;
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_configStr","_config"];

_configStr = "configFile";
{_configStr = _configStr + " >> " + _x} forEach _this;
_config = call compile _configStr;

if (getNumber (_config >> "isMan") == 1) exitWith {"man"};

"vehicle"