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

private _parents = configHierarchy _config;
private _appendNext = false;
private _nameArray = [];

{
    private _className = configName _x;

    if (_appendNext) then {
        _nameArray pushBack _className;
    };

    if (_className in ["AttributeCategories","AttributeItems","AttributeControls"]) then {
        _appendNext = true;
    } else {
        _appendNext = false;
    };
} forEach _parents;

_nameArray joinString "_"