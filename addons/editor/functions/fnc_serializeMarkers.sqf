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
#include "\z\mars\addons\common\macros.hpp"

BEGIN_COUNTER(serializeMarkers);

disableSerialization;

params [["_display", displayNull]];

private _getMarkerControl = {
    params ["_marker"];
    ((GETUVAR(GVAR(markerControls), []) select {(_x getVariable [QGVAR(marker), ""]) == _marker}) param [0, controlNull])
};

private _addEventHandlers = {
    params ["_ctrl"];

    _ctrl ctrlAddEventHandler ["MouseEnter", {
        params ["_ctrl"];

        GVAR(hoveringOverIcon) = true;
        ["select"] call FUNC(setCursor);

        _ctrl setVariable [QGVAR(hovered), true];
    }];

    _ctrl ctrlAddEventHandler ["MouseExit", {
        params ["_ctrl"];

        GVAR(hoveringOverIcon) = false;
        [] call FUNC(setCursor);

        _ctrl setVariable [QGVAR(hovered), false];
    }];

    _ctrl ctrlAddEventHandler ["MouseButtonUp", {
        params ["_ctrl", "_button"];
    }];

    _ctrl ctrlAddEventHandler ["MouseButtonDown", {
        params ["_ctrl", "_button"];
    }];

    _ctrl ctrlAddEventHandler ["MouseButtonDblClick", {
        params ["_ctrl", "_button"];

        if (_button == 0 && {GVAR(canContext)}) then {
            private _marker = _ctrl getVariable [QGVAR(marker), ""];
            [QADDON, "Marker", [100, 100], [0.2, 0.8], [
                format ["Edit %1 Marker", getText (configFile >> "CfgMarkers" >> markerType _marker >> "name")],
                markerPos _marker,
                markerType _marker,
                _marker,
                markerText _marker,
                (markerSize _marker) select 0,
                (markerSize _marker) select 1,
                markerColor _marker,
                markerAlpha _marker,
                false
            ]] call AFUNC(openAttributes);
        };
    }];
};

{
    private _marker = _x;
    private _control = [_marker] call _getMarkerControl;
    private _existingControls = GETUVAR(GVAR(markerControls), []);
    GVAR(idcsIcons) = GVAR(idcsIcons) + 1;

    if (isNull _control) then {
        _control = _display ctrlCreate ["MARS_gui_ctrlUnitButton", GVAR(idcsIcons), (_display displayCtrl IDC_MOUSEHANDLER_ENTITYICONS)];
        _control ctrlSetPosition [0, 0, 5 * GRID_W, 5 * GRID_H];
        [_control] call _addEventHandlers;
        _existingControls pushBack _control;
        SETUVAR(GVAR(markerControls), _existingControls);
    };

    private _icon = (configfile >> "CfgMarkers" >> markerType _marker >> "icon");
    private _texture = (configfile >> "CfgMarkers" >> markerType _marker >> "texture");
    private _useTexture = if (isNull _texture) then {getText _icon} else {getText _texture};
    private _color = [getArray (configFile >> "CfgMarkerColors" >> markerColor _marker >> "color")] call CFUNC(evalColor);

    _control setVariable [QGVAR(marker), _marker];
    _control setVariable [QGVAR(pos), markerPos _marker];
    _control setVariable [QGVAR(texture), _useTexture];
    _control setVariable [QGVAR(color), _color];
    _control setVariable [QGVAR(text), markerText _marker];

    _control ctrlCommit 0;

    false
} count (allMapMarkers select {
    ((toLower _x) find "mars_hidden") == -1
});

END_COUNTER(serializeMarkers);
