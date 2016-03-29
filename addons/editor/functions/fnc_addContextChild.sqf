/*
 * Author: Kingsley
 * Adds a child option to the given context menu and parent
 *
 * Arguments:
 * 0: Parent index <STRING>
 * 1: Unique index <STRING>
 * 2: Display name <STRING>
 * 3: Condition for showing option (_this = the object(s)) <STRING>
 * 4: Code to execute on click <CODE>
 *
 * Return Value:
 * Unique index, or empty string if failed <STRING>
 *
 * Example:
 * _index = ["MyParentOption", "DestroyObject", "Destroy Object", "side _this == east", {_this setDamage 1;}] call mars_editor_fnc_addContextChild;
 *
 * Public: No
 */

#include "script_component.hpp"

params [
    ["_parent", ""],
    ["_index", ""],
    ["_name", ""],
    ["_condition", ""],
    ["_code", objNull]
];

if (_parent == "" || _index == "" || _name == "") exitWith {};

_doesIndexExists = {
    params ["_options","_givenIndex"];
    private _indexExists = false;

    {
        if (toLower (_x select 1) == toLower _givenIndex) exitWith {
            MARS_LOGERROR_1("Context menu index is already in use", _givenIndex);
            _indexExists = true;
        };
        
        false
    } count _options;
    
    _indexExists
};

_data = [
    _parent,
    _index,
    _name,
    _condition,
    _code
];

if !([GVAR(childContextOptions), _index] call _doesIndexExists) then {
    GVAR(childContextOptions) pushBack _data;
    _index = _index;
} else {_index = ""};

_index