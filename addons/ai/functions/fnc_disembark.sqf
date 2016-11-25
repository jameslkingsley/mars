/*
 * Author: Kingsley
 * Disembarks all units inside the given vehicles
 *
 * Arguments:
 * 0: Vehicles <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[vehicle]] call mars_ai_fnc_disembark;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_args", []], ["_type", "all"], ["_broadcast", false]];

if (_broadcast) then {
    _args params [["_vehicles", []]];
    if (_vehicles isEqualTo []) exitWith {};
    {[QGVAR(disembark), [_x, _type], _x] call CBA_fnc_targetEvent;false} count _vehicles;
} else {
    _args params [["_vehicle", objNull], ["_type", "all"]];

    private _crew = fullCrew _vehicle;

    if (_type == "cargo") then {
        _crew = _crew select {
            _x params ["_obj", "_role"];
            !((toLower _role) in ["driver", "gunner", "turret", "commander"])
        };
    };

    _crew = _crew apply {_x select 0};

    {
        unassignVehicle _x;
        _x leaveVehicle _vehicle;
        _x action ["Eject", _vehicle];
        false
    } count _crew;
};
