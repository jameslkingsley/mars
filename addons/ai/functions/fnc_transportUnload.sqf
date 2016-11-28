/*
 * Author: Kingsley
 * Transports the given vehicle(s) to the given destination and unloads its infantry cargo
 *
 * Arguments:
 * 0: Units <ARRAY>
 * 1: Position <ARRAY>
 * 2: Broadcast <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[[units], [pos]], true] call mars_ai_fnc_transportUnload;
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_args", []], ["_broadcast", false]];
_args params [["_vehicles", []], ["_pos", []]];

if (_vehicles isEqualTo [] || {_pos isEqualTo []}) exitWith {};

// Make sure we only process unique vehicles
_vehicles = _vehicles apply {vehicle _x};
_vehicles = _vehicles arrayIntersect _vehicles;

if (_broadcast) then {
    [QGVAR(transportUnload), [_vehicles, _pos], _vehicles] call CBA_fnc_targetEvent;
} else {
    private _helipad = createVehicle ["Land_HelipadEmpty_F", _pos, [], 0, "CAN_COLLIDE"];
    _helipad setPosATL [_pos select 0, _pos select 1, 0];
    _helipad setVariable [QEGVAR(editor,hidden), true, true];

    {
        private _vehicle = _x;
        private _startPos = getPos _vehicle;
        private _leader = driver _vehicle;
        private _group = group _leader;

        [_group] call CBA_fnc_clearWaypoints;

        private _unload = _group addWaypoint [_helipad, 0];
        _unload setWaypointType "TR UNLOAD";

        private _cargo = fullCrew [_vehicle, "cargo", false];
        _cargo = _cargo apply {_x select 0};
        private _cargoGroups = [_cargo] call CFUNC(unitsToGroups);
        _cargoGroups = _cargoGroups - [_group];

        {
            [_x] call CBA_fnc_clearWaypoints;

            private _getOut = _x addWaypoint [_pos, 0];
            _getOut setWaypointType "GETOUT";
            _getOut synchronizeWaypoint [_unload];

            private _security = _x addWaypoint [_pos, 0];
            _security setWaypointType "HOLD";
            _security setWaypointFormation "DIAMOND";

            {
                _x setUnitPos "MIDDLE";
                [{_this setUnitPos "AUTO"}, _x, 10] call CBA_fnc_waitAndExecute;
            } forEach units _x;
        } forEach _cargoGroups;

        private _exit = _group addWaypoint [_startPos, 0];
        _exit setWaypointType "MOVE";
        
        false
    } count _vehicles;
};
