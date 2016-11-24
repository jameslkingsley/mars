/*
 * Author: Kingsley
 * Paradrops infantry from the given vehicle
 * Used by the paradrop waypoint
 *
 * Arguments:
 * <Waypoint Args>
 *
 * Return Value:
 * None
 *
 * Example:
 * [<Waypoint Args>] call mars_ai_fnc_wpParadrop;
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_group", grpNull], ["_pos", []]];

if (isNull _group || {_pos isEqualTo []}) exitWith {};

_group move _pos;

[{
    params ["_args", "_handle"];
    _args params ["_group", "_pos"];

    private _vehicle = vehicle leader _group;

    if (!alive _vehicle) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    private _targetDistance = count (assignedCargo _vehicle) * 50;

    if (_vehicle distance2D _pos < _targetDistance) then {
        {
            private _delay =  1 / ((speed _vehicle max 55) / 150);

            [_x, _vehicle, _delay] spawn {
                params ["_unit", "_vehicle", "_delay"];

                _unit disableAI "MOVE";
                _unit disableCollisionWith _vehicle;

                moveOut _unit;
                unassignVehicle _unit;
                [_unit] allowGetIn false;

                private _type = getText (configFile >> "CfgVehicles" >> backpack _unit >> "ParachuteClass");
                if !(_type isKindOf "ParachuteBase") then {
                    private _parachute = "Steerable_Parachute_F" createVehicle [0, 0, 0];
                    _parachute setPosASL (getPosASLVisual _unit);
                    _parachute setVectorDirAndUp [vectorDirVisual _unit, vectorUpVisual _unit];

                    if (!local _unit) then {
                        [_unit, _parachute] remoteExecCall ["moveInDriver", _unit];
                    } else {
                        _unit moveInDriver _parachute;
                    };

                    _unit assignAsDriver _parachute;
                    [_unit] allowGetIn true;
                    [_unit] orderGetIn true;
                };

                _unit enableAI "MOVE";
                (group _unit) leaveVehicle _vehicle;
                _unit enableCollisionWith _vehicle;

                sleep 1;
            };
        } forEach assignedCargo _vehicle;

        [_handle] call CBA_fnc_removePerFrameHandler;
    };
}, 1, [_group, _pos]] call CBA_fnc_addPerFrameHandler;
