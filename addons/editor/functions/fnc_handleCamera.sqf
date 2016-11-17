/*
 * Author: ACE3 Project, Kingsley
 * Handles free camera manipulation according to input
 *
 * Arguments:
 * 0: Parameters <ANY>
 * 1: PFH handle <NUMBER>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [mars_editor_fnc_handleCamera, 0] call CBA_fnc_addPerFrameHandler;
 *
 * Public: No
 */

#include "script_component.hpp"

// Ignore all input if true
if (GVAR(preventCamHandler)) exitWith {};

// Kill PFH when not in free cam (or display is closed)
if (isNil QGVAR(camHandler)) exitWith {
    [_this select 1] call CBA_fnc_removePerFrameHandler;
};

private _pan = (GVAR(camPan) + 360) % 360;
private _tilt = GVAR(camTilt);

private _camera = GVAR(camera);
private _oldPos = GVAR(camPos);

// Dolly/Boom amount should be influnced by zoom level (it should really be exponential)
// Dollying should also slow as the camera gets close to the ground
private _isInBuilding = [false, [GVAR(camPos)] call CFUNC(isInBuilding)] select GVAR(camSlowDownInBuildings);
private _buildingMod = [0.025, 0.005] select _isInBuilding;
private _buildingMax = [0.1, 0.025] select _isInBuilding;
private _zoomMod = (GVAR(camZoom) * 0.8) max 1;
private _altMod = ((((getPos _camera) select 2) * _buildingMod) max _buildingMax) min 1;

private _mX = (GVAR(camDolly) select 0) * _altMod / _zoomMod;
private _mY = (GVAR(camDolly) select 1) * _altMod / _zoomMod;
private _mZ = GVAR(camBoom) * _altMod / _zoomMod;

private _x = (_oldPos select 0) + (_mX * cos(_pan)) + (_mY * sin(_pan));
private _y = (_oldPos select 1) - (_mX * sin(_pan)) + (_mY * cos(_pan));
private _z = (_oldPos select 2) + _mZ;

// Prevent camera going under terrain
GVAR(camPos) = [_x, _y, _z max (getTerrainHeightASL [_x, _y])];

// Update camera position and rotation
_camera setPosASL GVAR(camPos);
_camera setDir _pan;
[_camera, _tilt, 0] call BIS_fnc_setPitchBank;
