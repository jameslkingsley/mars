/*
 * Author: Kingsley
 * Updates the marker controls
 * Called every frame
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call mars_editor_fnc_updateMarkers;
 *
 * Public: No
 */

#include "script_component.hpp"
#include "\z\mars\addons\common\macros.hpp"

BEGIN_COUNTER(updateMarkers);

private _index = 0;

{
    private _control = _x;
    private _marker = _control getVariable [QGVAR(marker), ""];

    if !(_marker in allMapMarkers) then {
        ctrlDelete _control;
        private _currentControls = GETUVAR(GVAR(markerControls), []);
        _currentControls deleteAt _index;
        SETUVAR(GVAR(markerControls), _currentControls);
    } else {
        if (GVAR(showMapMarkers3D)) then {
            private _pos = _control getVariable [QGVAR(pos), []];

            if !(_pos isEqualTo []) then {
                private _screenPos = worldToScreen _pos;
                if (!(_screenPos isEqualTo []) && {_pos distance GVAR(camPos) <= GVAR(iconDrawDistance)}) then {
                    private _color = _control getVariable [QGVAR(color), [0,0,0,1]];
                    private _hovered = _control getVariable [QGVAR(hovered), false];
                    private _inSelection = _marker in GVAR(selectedMarkers);
                    private _alpha = [(linearConversion [0, GVAR(iconDrawDistance), (_pos distance GVAR(camPos)), 0.66, 0, true]), 1] select (_hovered || _inSelection);
                    _color set [3, _alpha];

                    _control ctrlEnable true;
                    _control ctrlShow true;
                    _control ctrlSetText (_control getVariable [QGVAR(texture), ""]);
                    _control ctrlSetTextColor _color;

                    _control ctrlSetPosition [
                        (_screenPos select 0) - safeZoneX - (2.5 * GRID_W),
                        (_screenPos select 1) - safeZoneY - (2.5 * GRID_H)
                    ];

                    private _text = _control getVariable [QGVAR(text), ""];
                    if (_text != "") then {
                        drawIcon3D [
                            "",
                            _color,
                            _pos,
                            1,
                            1,
                            0,
                            _text,
                            0,
                            0.032
                        ];
                    };
                } else {
                    _control ctrlEnable false;
                    _control ctrlShow false;
                };
            } else {
                _control ctrlEnable false;
                _control ctrlShow false;
            };
        } else {
            _control ctrlEnable false;
            _control ctrlShow false;
        };

        _control ctrlCommit 0;
    };

    INC(_index);

    false
} count GETUVAR(GVAR(markerControls), []);

END_COUNTER(updateMarkers);
