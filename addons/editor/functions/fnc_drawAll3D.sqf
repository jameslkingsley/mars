/*
 * Author: Kingsley
 * Draws all icons/lines needed in 3D space
 * Called every frame from openEditor
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call mars_editor_fnc_drawAll3D;
 *
 * Public: No
 */

#include "script_component.hpp"
#include "\z\mars\addons\common\macros.hpp"

//--- GVAR(camPos) is ASL

BEGIN_COUNTER(drawAll3D);

params ["_display"];

private _index = 0;

{
    private _object = _x;
    private _posAGL = getPosVisual _object;
    private _screenPos = worldToScreen _posAGL;
    private _inViewport = !(_screenPos isEqualTo []);
    private _iconIDC = _object getVariable [QGVAR(iconIDC), -1];
    private _thisIDC = 6562 + _index;

    drawIcon3D [
        "",
        [1,0,0,1],
        _posAGL,
        1,
        1,
        0,
        str _thisIDC
    ];

    if (_iconIDC == -1) then {
        private _iconCtrl = _display ctrlCreate ["MARS_gui_ctrlStaticBackground", _thisIDC];

        if (_inViewport) then {
            private _ctrlPos = _screenPos;
            _ctrlPos append [5 * GRID_W, 5 * GRID_H];
            _iconCtrl ctrlEnable true;
            _iconCtrl ctrlShow true;
            _iconCtrl ctrlSetPosition _ctrlPos;
        } else {
            _iconCtrl ctrlEnable false;
            _iconCtrl ctrlShow false;
        };

        _iconCtrl ctrlCommit 0;
        _object setVariable [QGVAR(iconIDC), _thisIDC];
    } else {
        private _iconCtrl = _display displayCtrl _iconIDC;

        if (_inViewport) then {
            _iconCtrl ctrlEnable true;
            _iconCtrl ctrlShow true;
            _iconCtrl ctrlSetPosition _screenPos;
        } else {
            _iconCtrl ctrlEnable false;
            _iconCtrl ctrlShow false;
        };

        _iconCtrl ctrlCommit 0;
    };

    INC(_index);

    false
} count (entities "All");

END_COUNTER(drawAll3D);
