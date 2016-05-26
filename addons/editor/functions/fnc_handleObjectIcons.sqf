/*
 * Author: Kingsley
 * Handles object icons in 3D space
 * This function is called on every frame
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * N/A
 *
 * Public: No
 */

#include "script_component.hpp"

#define EMPTY_ARRAY GVAR(placedStaticObjects)
#define EXCLUDED_SIDES [sideAmbientLife]

{
    _grp = _x;

    if !(side _grp in EXCLUDED_SIDES) then {
        if (!((units _grp) isEqualTo []) /*&& {_x in EMPTY_ARRAY} count (units _grp) == 0*/) then {
            _leader = leader _grp;
            _leaderPos = ASLtoAGL (getPosASLVisual _leader);
            _leaderDistance = _leaderPos distance GVAR(camPos);

            if (alive _leader && {_leaderDistance < ICON_FADE_DISTANCE}) then {
                _alpha = [linearConversion [0, ICON_FADE_DISTANCE, _leaderDistance, 1, 0, true], 1] select (_leader in GVAR(selection));
                _color = MARS_SIDECOLOR(side _grp);
                _color set [3, _alpha max 0.2];

                _texture = GETVAR(_grp,GVAR(iconTexture),"");
                if (_texture == "") then {
                    _texture = [[_grp] call EFUNC(common,getMarkerType)] call EFUNC(common,getMarkerTexture);
                    SETVAR(_grp,GVAR(iconTexture),_texture);
                };

                drawIcon3D [
                    _texture,
                    _color,
                    _leaderPos vectorAdd [0, 0, ICON_LEADER_HEIGHT],
                    1,
                    1,
                    0,
                    "",
                    0,
                    0
                ];

                drawLine3D [
                    _leaderPos,
                    _leaderPos vectorAdd [0, 0, ICON_LEADER_HEIGHT],
                    [0, 0, 0, _alpha]
                ];
            };

            _groupRenderedVehicles = [];

            {
                _unit = vehicle _x;

                if !(_unit in _groupRenderedVehicles) then {
                    _unitPos = ASLtoAGL (getPosASLVisual _unit);
                    _unitDistance = _unitPos distance GVAR(camPos);
                    if (_unitDistance > ICON_FADE_DISTANCE) exitWith {};
                    _alpha = [linearConversion [0, BOX_FADE_DISTANCE, _unitDistance, 1, 0, true], 1] select (_unit in GVAR(selection));
                    _color = [[0,0,0,1], MARS_SIDECOLOR(side group _unit)] select (alive _unit);
                    _color set [3, _alpha];

                    _iconTexture = GETVAR(_unit,GVAR(iconTexture),"");
                    if (_iconTexture == "") then {
                        _icon = getText (configfile >> "CfgVehicles" >> (typeOf _unit) >> "icon");
                        _iconTexture = getText (configfile >> "CfgVehicleIcons" >> (getText (configfile >> "CfgVehicles" >> (typeOf _unit) >> "icon")));
                        SETVAR(_unit,GVAR(iconTexture),_iconTexture);
                    };

                    if (isPlayer _unit) then {
                        _selColor = [
                            [0,0,0,_alpha],
                            [[1,0,0.5,_alpha], [1,0,0,_alpha]] select (local _Unit)
                        ] select (alive _unit);

                        drawIcon3D [
                            "\A3\ui_f\data\igui\cfg\islandmap\iconplayer_ca.paa",
                            _selColor,
                            _unitPos,
                            1,
                            1,
                            0,
                            name _unit,
                            1,
                            0.031
                        ];
                    };

                    drawIcon3D [
                        _iconTexture,
                        _color,
                        _unitPos,
                        1,
                        1,
                        0,
                        "",
                        1,
                        0
                    ];

                    drawLine3D [
                        _unitPos vectorAdd [0, 0, 1],
                        _leaderPos vectorAdd [0, 0, 1],
                        _color
                    ];

                    _groupRenderedVehicles pushBackUnique _unit;
                };

                false
            } count (units _x);
        };
    };

    false
} count allGroups;

{
    _vehicle = _x;

    if ((crew _vehicle) isEqualTo []) then {
        _vehiclePos = ASLtoAGL (getPosASLVisual _vehicle);
        _vehicleDistance = _vehiclePos distance GVAR(camPos);
        if (_vehicleDistance > ICON_FADE_DISTANCE) exitWith {};
        _alpha = [linearConversion [0, BOX_FADE_DISTANCE, _vehicleDistance, 1, 0, true], 1] select (_vehicle in GVAR(selection));
        _color = [[0,0,0,1], [COLOR_EMPTY_RGBA]] select (alive _vehicle);
        _color set [3, _alpha];

        _iconTexture = GETVAR(_vehicle,GVAR(iconVehicleTexture),"");
        if (_iconTexture == "") then {
            _icon = getText (configfile >> "CfgVehicles" >> (typeOf _vehicle) >> "icon");
            _iconTexture = [getText (configFile >> "CfgVehicleIcons" >> _icon), _icon] select ((toLower _icon) find "\a3\" > -1);
        };

        if (_iconTexture == "") then {
            _iconTexture = "\A3\ui_f\data\map\vehicleicons\iconObject_ca.paa";
        };

        SETVAR(_vehicle,GVAR(iconVehicleTexture),_iconTexture);

        drawIcon3D [
            _iconTexture,
            _color,
            _vehiclePos,
            1,
            1,
            0,
            "",
            1,
            0
        ];
    };

    false
} count EMPTY_ARRAY;
