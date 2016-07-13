/*
 * Author: Kingsley
 * Handles clicking a context menu item
 *
 * Arguments:
 * 0: Action <STRING>
 * 1: Requires position? <BOOL>
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

params [["_action", ""], ["_requiresPosition", false], ["_preAction", ""]];

private _requiresPositionBool = if (_requiresPosition isEqualType false) then {
    _requiresPosition
} else {
    if (count _requiresPosition > 0) then {
        true
    };
};

if (!isNil _action) then {
    _action = format ["_this call %1", _action];
};

if (!isNil _preAction) then {
    _preAction = format ["_this call %1", _preAction];
};

[] call FUNC(closeContextMenu);
[GVAR(selection)] call compile _preAction;

if (_requiresPositionBool) then {
    GVAR(hasLeftClicked) = false;
    GVAR(isWaitingForLeftClick) = true;

    GVAR(contextPosLinePFH) = [{
        params ["_args", "_handle"];
        _args params ["_selection", "_action", ["_requiresPosition", false], ["_preAction", ""]];

        if (GVAR(hasLeftClicked)) exitWith {
            private _worldPos = [] call FUNC(getSurfaceUnderCursor);
            private _target = [] call FUNC(objectUnderCursor);
            
            [_selection, _worldPos, _target] call compile _action;

            if (!GVAR(ctrlKey)) then {
                [_handle] call CBA_fnc_removePerFrameHandler;

                GVAR(hasLeftClicked) = false;
                GVAR(isWaitingForLeftClick) = false;
            } else {
                GVAR(hasLeftClicked) = false;
                GVAR(isWaitingForLeftClick) = true;
            };
        };

        private _groups = [_selection] call CFUNC(unitsToGroups);
        private _worldPos = ASLtoAGL ([] call FUNC(getSurfaceUnderCursor));

        private _color = if (_requiresPosition isEqualType "") then {
            if (isNil _requiresPosition) then {
                ([_selection, _worldPos] call compile _requiresPosition)
            } else {
                ([_selection, _worldPos] call compile format ["_this call %1", _requiresPosition])
            };
        } else {
            [COLOR_ACTIVE_RGB_S,1]
        };

        {
            private _leader = leader _x;
            private _objectPos = ASLtoAGL (getPosASLVisual _leader);
            _objectPos = _objectPos vectorAdd [0, 0, 1];

            drawLine3D [_objectPos, _worldPos, _color];

            false
        } count (_groups select {
            !((getPosASLVisual leader _x) isEqualTo [0,0,0])
        });

        drawIcon3D [
            "\A3\ui_f\data\map\groupicons\waypoint.paa",
            _color,
            _worldPos,
            1,
            1,
            0,
            "",
            1,
            0.03,
            "PuristaBold",
            "center"
        ];
    }, 0, [GVAR(selection), _action, _requiresPosition, _preAction]] call CBA_fnc_addPerFrameHandler;
} else {
    [GVAR(selection)] call compile _action;
};