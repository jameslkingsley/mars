/*
 * Author: Kingsley
 * Handles status bar values
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

disableSerialization;

private _display = findDisplay IDC_DISPLAY;
private _statusBar = _display displayCtrl IDC_STATUSBAR;

#define CGCTRL(IDC) (_statusBar controlsGroupCtrl IDC)

CGCTRL(IDC_STATUSBAR_VERSION) ctrlSetText format ["MARS %1.%2.%3", MAJOR, MINOR, PATCHLVL];
CGCTRL(IDC_STATUSBAR_SERVER) ctrlSetTooltip serverName;

_coordinateUpdate = {
    _ctrlMouseArea = _this select 0;
    _display = ctrlParent _ctrlMouseArea;

    _ctrlX = _display displayCtrl IDC_STATUSBAR_X;
    _ctrlY = _display displayCtrl IDC_STATUSBAR_Y;
    _ctrlZ = _display displayCtrl IDC_STATUSBAR_Z;
    _ctrlDis = _display displayCtrl IDC_STATUSBAR_DIS;

    _worldPos = AGLtoASL (screenToWorld GVAR(mousePos));
    _camPos = getPosASLVisual GVAR(freeCamera);
    _worldPos params ["_posX", "_posY", "_posZ"];

    _ctrlX ctrlSetText format ["%1m", [_posX, 2] call EFUNC(common,roundToN)];
    _ctrlY ctrlSetText format ["%1m", [_posY, 2] call EFUNC(common,roundToN)];
    _ctrlZ ctrlSetText format ["%1m", [_posZ, 2] call EFUNC(common,roundToN)];
    _ctrlDis ctrlSetText format ["%1m", [_worldPos distance _camPos, 2] call EFUNC(common,roundToN)];
};

_ctrlMouseArea = _display displayCtrl IDC_MOUSEHANDLER;
_ctrlMouseArea ctrlAddEventHandler ["MouseMoving", _coordinateUpdate];
_ctrlMouseArea ctrlAddEventHandler ["MouseHolding", _coordinateUpdate];
