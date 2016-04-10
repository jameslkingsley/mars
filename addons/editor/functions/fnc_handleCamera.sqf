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

// Kill PFH when not in free cam (or display is closed)
if (isNil QGVAR(camHandler)) exitWith { [_this select 1] call CBA_fnc_removePerFrameHandler; };

private ["_camera","_pan","_tilt"];

_pan = (GVAR(camPan) + 360) % 360;
_tilt = GVAR(camTilt);

private ["_oldPos","_altMod","_zoomMod","_mX","_mY","_mZ","_x","_y","_z"];
_camera = GVAR(freeCamera);
_oldPos = GVAR(camPos);

// Dolly/Boom amount should be influnced by zoom level (it should really be exponential)
// Dollying should also slow as the camera gets close to the ground
_isInBuilding = [GVAR(camPos)] call EFUNC(common,isInBuilding);
_buildingMod = [0.025,0.005] select _isInBuilding;
_buildingMax = [0.1,0.025] select _isInBuilding;
_zoomMod = (GVAR(camZoom) * 0.8) max 1;
_altMod = ((((getPos _camera) select 2) * _buildingMod) max _buildingMax) min 1;
systemChat str _altMod;

_mX = (GVAR(camDolly) select 0) * _altMod / _zoomMod;
_mY = (GVAR(camDolly) select 1) * _altMod / _zoomMod;
_mZ = GVAR(camBoom) * _altMod / _zoomMod;

_x = (_oldPos select 0) + (_mX * cos(_pan)) + (_mY * sin(_pan));
_y = (_oldPos select 1) - (_mX * sin(_pan)) + (_mY * cos(_pan));
_z = (_oldPos select 2) + _mZ;

// Prevent camera going under terrain
GVAR(camPos) = [_x,_y,_z max (getTerrainHeightASL [_x,_y])];

// Update camera position and rotation
_camera setPosASL GVAR(camPos);
_camera setDir _pan;
[_camera, _tilt, 0] call BIS_fnc_setPitchBank;
