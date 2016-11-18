/*
 * Author: Kingsley
 * Updates icon controls
 * Runs every frame
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call mars_editor_fnc_updateIcons;
 *
 * Public: No
 */

#include "script_component.hpp"
#include "\z\mars\addons\common\macros.hpp"

BEGIN_COUNTER(updateIcons);

private _index = 0;

{
    private _ctrl = _x;
    private _object = _ctrl getVariable [QGVAR(object), objNull];
    private _deleteNext = _ctrl getVariable [QGVAR(deleteNext), false];

    if (!isNull _object && {!_deleteNext}) then {
        private _offset = _ctrl getVariable [QGVAR(offset), [0,0,0]];
        private _distance = (_ctrl getVariable [QGVAR(distance), 1]) * GVAR(iconDrawDistance);
        private _posAGLWorld = (getPosVisual _object) vectorAdd _offset;
        private _posASLWorld = (getPosASLVisual _object) vectorAdd _offset;
        private _posScreen = worldToScreen (ASLtoAGL _posASLWorld);
        private _worldDistance = _posASLWorld distance GVAR(camPos);

        if (!(_posScreen isEqualTo []) && {_worldDistance <= _distance}) then {
            // In viewport
            _ctrl setVariable [QGVAR(eligibleForSelection), true];
            private _hovered = _ctrl getVariable [QGVAR(hovered), false];
            private _isGroup = _ctrl getVariable [QGVAR(isGroup), false];
            private _dimensions = _ctrl getVariable [QGVAR(dimensions), [5 * GRID_W, 5 * GRID_H]];
            private _color = _ctrl getVariable [QGVAR(color), [0,0,0,1]];
            private _texture = _ctrl getVariable [QGVAR(texture), ""];
            private _lineData = _ctrl getVariable [QGVAR(lineData), []];
            private _inSelection = _object in GVAR(selection);

            if (!alive _object) then {
                _color = [0,0,0,1];

                if (_isGroup) then {
                    _ctrl setVariable [QGVAR(deleteNext), true];
                };
            };

            if (_hovered || {_inSelection}) then {
                _color set [3, 1];
            } else {
                _color set [3, linearConversion [(_distance / 2), _distance, _worldDistance, 0.66, 0, true]];
            };

            if !(_lineData isEqualTo [] && {_worldDistance <= (_distance / 4)}) then {
                _lineData params ["_start", "_end", "_endOffset", "_startSelection", "_endSelection", "_lineColor"];
                if (!isNull _start && {!isNull _end}) then {
                    private _zOffset1 = (_start selectionPosition _startSelection) param [2, 0];
                    private _zOffset2 = (_end selectionPosition _endSelection) param [2, 0];
                    if (!alive _start) then {_lineColor = [0,0,0,1]};
                    drawLine3D [
                        (ASLtoAGL (getPosASLVisual _start)) vectorAdd [0, 0, _zOffset1],
                        (ASLtoAGL (getPosASLVisual _end)) vectorAdd (_endOffset vectorAdd [0, 0, _zOffset2]),
                        _lineColor
                    ];
                };
            };

            _posScreen params ["_psX", "_psY"];
            _dimensions params ["_sizeW", "_sizeH"];

            if (_hovered || {_inSelection}) then {
                _sizeW = _sizeW * GVAR(iconHoverSize);
                _sizeH = _sizeH * GVAR(iconHoverSize);
            };

            _ctrl ctrlEnable true;
            _ctrl ctrlShow true;

            _ctrl ctrlSetPosition [
                // Subtract safezones since control is inside
                // the mouse handler controls group
                (_psX - (_sizeW / 2)) - safeZoneX,
                (_psY - (_sizeH / 2)) - safeZoneY,
                _sizeW,
                _sizeH
            ];

            _ctrl ctrlSetText _texture;
            _ctrl ctrlSetTextColor _color;

            _ctrl ctrlCommit 0;
        } else {
            // Not in viewport
            _ctrl setVariable [QGVAR(eligibleForSelection), false];
            _ctrl ctrlEnable false;
            _ctrl ctrlShow false;
        };
    } else {
        // Object no longer exists
        // Or marked for deletion
        ctrlDelete _ctrl;
        private _currentControls = GETUVAR(GVAR(iconControls), []);
        _currentControls deleteAt _index;
        SETUVAR(GVAR(iconControls), _currentControls);
    };

    INC(_index);

    false
} count GETUVAR(GVAR(iconControls), []);

END_COUNTER(updateIcons);
