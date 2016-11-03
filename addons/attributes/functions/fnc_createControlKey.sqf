/*
 * Author: Kingsley
 * Creates and returns a control key based on the given config
 *
 * Arguments:
 * 0: Control config <CONFIG>
 *
 * Return Value:
 * Key <STRING>
 *
 * Example:
 * _ctrlKey = [ctrlConfig] call mars_attributes_fnc_createControlKey;
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_config", configNull, [configNull]]];

if (isNull _config) exitWith {};

private _parents = (configHierarchy _config) apply {configName _x};

_parents joinString "_"
