/*
 * Author: Kingsley
 * Creates a virtual group with the given units
 * Used for when you want to remove units from their group but retain a common group handler
 * Must be executed where you want the virtual group to be local (doesn't broadcast virtual group)
 *
 * Arguments:
 * 0: Leader of the group <OBJECT>
 * 1: Members of the group <ARRAY>
 *
 * Return Value:
 * Created groups' namespace <LOCATION>
 *
 * Example:
 * _group = [leader player, units player] call mars_common_fnc_createVirtualGroup;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_leader", objNull, [objNull]],
    ["_members", [], [[]]],
    ["_data", [], [[]]]
];

// Returned type is locationNull
_group = call CBA_fnc_createNamespace;

_group setVariable ["leader", _leader];
_group setVariable ["members", _members];

{
    _x params ["_key", "_value"];
    
    if (toLower _key in ["leader","members"]) then {
        MARS_LOGERROR_1("'%1' is a reserved key for virtual groups. Use something else.", _key);
    } else {
        _group setVariable [_key, _value];
    };
} forEach _data;

GVAR(virtualGroups) pushBack _group;

{
    _x setVariable ["virtualGroup", _group];
} forEach (_members + [_leader]);

_group