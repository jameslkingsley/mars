/*
 * Author: Kingsley
 * Orders the given units to fire the given ammo artillery at the given position
 *
 * Arguments:
 * 0: Units <ARRAY>
 * 1: Target position <ARRAY>
 * 2: Ammo type <STRING>
 * 3: Number of rounds <NUMBER>
 *
 * Return Value:
 * TODO
 *
 * Example:
 * TODO
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_args", []],
    ["_ammo", ""],
    ["_count", GVAR(roundCount)]
];

_args params [
    ["_units", []],
    ["_pos", []]
];

{
    private _vehicle = vehicle _x;

    _vehicle addEventHandler ["Fired", {
        params ["_vehicle"];
        _vehicle setVariable [QGVAR(canFire), true, true];
    }];

    for "_c" from 1 to _count do {
        [{
            params ["_vehicle"];
            (_vehicle getVariable [QGVAR(canFire), true])
        }, {
            params ["_vehicle", "_ammo", "_pos"];

            _pos = [_pos, GVAR(dispersion)] call CBA_fnc_randPos;

            if (GVAR(showLines) && hasInterface) then {
                (vehicle _vehicle) setVariable [QGVAR(targetPos), _pos, true];
                
                (vehicle _vehicle) addEventHandler ["Fired", {
                    if !(GVAR(showLines)) exitWith {};
                    
                    private _shooter = param [0, objNull];
                    private _round = param [6, objNull];
                    private _targetPos = _shooter getVariable [QGVAR(targetPos), []];
                    
                    [{
                        params ["_args", "_handle"];
                        _args params ["_shooter", "_targetPos", "_round"];
                        
                        if (isNull _round || {!alive _round}) exitWith {
                            [_handle] call CBA_fnc_removePerFrameHandler;
                        };
                        
                        private _shooterPos = getPosASLVisual _shooter;
                        private _zMod = 10;
                        private _roundPos = getPosASLVisual _round;
                        _roundPos set [2, (_shooterPos select 2) + 10];
                        
                        if (_shooterPos select 2 < _targetPos select 2) then {
                            _roundPos set [2, (_targetPos select 2) + 10];
                            _zMod = (_targetPos select 2) + 10;
                        };
                        
                        // Shooter line
                        drawLine3D [
                            ASLtoAGL _shooterPos,
                            ASLtoAGL (_shooterPos vectorAdd [0, 0, _zMod]),
                            [1,0.25,0,1]
                        ];
                        
                        // Projectile line
                        drawLine3D [
                            ASLtoAGL (_shooterPos vectorAdd [0, 0, _zMod]),
                            ASLtoAGL _roundPos,
                            [1,0.25,0,1]
                        ];
                        
                        // Projectile text
                        drawIcon3D [
                            "\A3\ui_f\data\map\groupicons\waypoint.paa",
                            [0,0,0,1],
                            ASLtoAGL _roundPos,
                            1,
                            1,
                            0,
                            format ["%1m", round (_round distance2D _targetPos)],
                            1,
                            0.036,
                            "RobotoCondensed",
                            "center"
                        ];
                    }, 0, [_shooter, _targetPos, _round]] call CBA_fnc_addPerFrameHandler;
                }];
            };

            [QGVAR(fireArtillery), [_vehicle, _pos, _ammo, 1], _vehicle] call CBA_fnc_targetEvent;
            _vehicle setVariable [QGVAR(canFire), false, true];
        }, [_vehicle, _ammo, _pos]] call CBA_fnc_waitUntilAndExecute;
    };
    
    false
} count _units;
