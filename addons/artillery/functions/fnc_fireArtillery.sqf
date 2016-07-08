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
    ["_count", 1]
];

_args params [
    ["_units", []],
    ["_pos", []]
];

{
    (vehicle _x) setVariable [QGVAR(targetPos), _pos];
    
    (vehicle _x) addEventHandler ["Fired", {
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
                format ["%1m", round (_round distance _targetPos)],
                1,
                0.036,
                "RobotoCondensed",
                "center"
            ];
        }, 0, [_shooter, _targetPos, _round]] call CBA_fnc_addPerFrameHandler;
    }];
    
    _x doArtilleryFire [_pos, _ammo, _count];
    
    false
} count _units;