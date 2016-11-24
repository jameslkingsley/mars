/*
 * Author: Kingsley
 * Serializes markers for them to be rendered
 * Spawned in a delayed PFH
 *
 * Arguments:
 * 0: Display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [display] call mars_editor_fnc_serializeMarkers;
 *
 * Public: No
 */

#include "script_component.hpp"

disableSerialization;

params [["_display", displayNull]];

private _getMarkerControl = {
    params ["_marker"];
    ((GETUVAR(GVAR(markerControls), []) select {(_x getVariable [QGVAR(marker), ""]) == _marker}) param [0, controlNull])
};

{
    private _marker = _x;
    private _control = [_marker] call _getMarkerControl;

    if (isNull _control) then {
        _control = _display ctrlCreate ["MARS_gui_ctrlGroupButton"];
    };

    private _icon = (configfile >> "CfgMarkers" >> markerType _marker >> "icon");
    private _texture = (configfile >> "CfgMarkers" >> markerType _marker >> "texture");
    private _useTexture = if (isNull _texture) then {getText _icon} else {getText _texture};
    private _color = [getArray (configFile >> "CfgMarkerColors" >> markerColor _marker >> "color")] call CFUNC(evalColor);

    _outputMarkers pushBack [
        _x,
        _useTexture,
        _color,
        markerPos _x,
        (markerSize _x) select 0,
        (markerSize _x) select 1,
        markerDir _x,
        markerText _x
    ];

    false
} count allMapMarkers;
