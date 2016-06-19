/*
 * Author: Kingsley
 * Serializes object icon data into the global variable
 * This is executed in a delayed PFH
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call mars_editor_fnc_serializeDrawing;
 *
 * Public: No
 */

#include "script_component.hpp"

private _outputIcons = [];
private _outputLines = [];

{
    private _objectData = [];
    private _object = _x;
    private _objectClassname = typeOf _object;
    private _iconColor = [
        [COLOR_EMPTY_RGBA],
        [COLOR_WEST_RGBA],
        [COLOR_EAST_RGBA],
        [COLOR_GUER_RGBA],
        [COLOR_CIV_RGBA]
    ] select (([west, east, resistance, civilian] find (side _object)) + 1);
    
    private _objectIcon = getText (configfile >> "CfgVehicles" >> _objectClassname >> "icon");
    private _objectIconPath = [getText (configFile >> "CfgVehicleIcons" >> _objectIcon), _objectIcon] select ((toLower _objectIcon) find "\" > -1);
    
    if (leader _object == _object) then {
        private _groupIcon = [[group _object] call CFUNC(getMarkerType)] call CFUNC(getMarkerTexture);
        
        _outputIcons pushBack [
            _object,
            _groupIcon,
            _iconColor,
            10,
            0
        ];
        
        _outputLines pushBack [
            _object,
            _object,
            [0,0,0,1],
            10,
            0
        ];
    } else {
        if (!isNull leader _object) then {
            _outputLines pushBack [
                _object,
                leader _object,
                _iconColor,
                1,
                1
            ];
        };
    };
    
    private _playerColor = [0,0,0,0];
    
    if (isPlayer _object) then {
        if (alive _object) then {
            if (local _object) then {
                _playerColor = [1,0,0,1];
            } else {
                _playerColor = [1,0,0.5,1];
            };
        } else {
            _playerColor = [0,0,0,1];
        };
        
        // Player icon
        _outputIcons pushBack [
            _object,
            "\A3\ui_f\data\igui\cfg\islandmap\iconplayer_ca.paa",
            _playerColor
        ];
    };
    
    // Unit icon
    if (vehicle _object == _object) then {
        if (crew _object isEqualTo []) then {
            _iconColor = [COLOR_EMPTY_RGBA];
        }/* else {
            private _vehicleIcon = [[group _object] call CFUNC(getMarkerType)] call CFUNC(getMarkerTexture);
            
            _outputIcons pushBack [
                _object,
                _vehicleIcon,
                _iconColor,
                10,
                0
            ];
        }*/;
    };
    
    _outputIcons pushBack [
        _object,
        _objectIconPath,
        _iconColor
    ];
    
    false
} count (((entities "All") select {
    !(side _x in [sideAmbientLife, sideLogic, sideUnknown])
}) - (entities "Animal"));

GVAR(serializedIcons) = _outputIcons;
GVAR(serializedLines) = _outputLines;
