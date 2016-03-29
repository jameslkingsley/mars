/*
 * Author: Kingsley
 * Adds a context menu option
 *
 * Arguments:
 * 0: Unique index <STRING>
 * 1: Display name <STRING>
 * 2: Condition for showing option (_this = the object or array of objects if selection or objNull if general) <STRING>
 * 3: Code to execute on click <CODE>
 *
 * Return Value:
 * Unique index <STRING>
 *
 * Example:
 * _index = ["DestroyObject", "Destroy Object", "side _this == east", {_this setDamage 1;}] call mars_editor_fnc_addContextParent;
 *
 * Public: No
 */

#include "script_component.hpp"

params [
    ["_index", ""],
    ["_name", ""],
    ["_condition", ""],
    ["_code", objNull]
];

if (_index == "" || _name == "") exitWith {};

_doesIndexExists = {
    params ["_options","_givenIndex"];
    private _indexExists = false;

    {
        if (toLower (_x select 0) == toLower _givenIndex) exitWith {
            MARS_LOGERROR_1("Context menu index is already in use", _givenIndex);
            _indexExists = true;
        };
        
        false
    } count _options;
    
    _indexExists
};

_data = [
    _index,
    _name,
    _condition,
    _code
];

if !([GVAR(contextOptions), _index] call _doesIndexExists) then {
    GVAR(contextOptions) pushBack _data;
};

_index