/*
 * Author: Kingsley
 * Creates a virtual group with the given units
 * Used for when you want to remove units from their group but retain a common group handler
 * Virtual group is created globally
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

// Returned type is location
_group = [true] call CBA_fnc_createNamespace;

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
publicVariable QGVAR(virtualGroups);

{
    _x setVariable ["virtualGroup", _group, true];
} forEach (_members + [_leader]);

_group