/*
 * Author: Kingsley
 * Opens the given attributes window
 *
 * Arguments:
 * 0: Title <STRING>
 * 1: Attributes class <STRING>
 * 2: Confirm code <CODE>
 * 3: Cancel code <CODE>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["Environment", "mars_environment_interface", {}, {}] call mars_common_fnc_openAttributes;
 *
 * Public: Yes
 */

#include "script_component.hpp"

_this spawn {
    params [
        ["_title", "", [""]],
        ["_attributes", "", [""]],
        ["_confirmCode", {}, [{}]],
        ["_cancelCode", {}, [{}]]
    ];

    createDialog QGVAR(attributesWindow);

    ["AttributesWindow_onLoad", {
        TRACE_1("AttributesWindow_onLoad", _this);
        params ["_display"];
    }] call EFUNC(common,addEventHandler);

    ["AttributesWindow_onUnload", {
        TRACE_1("AttributesWindow_onUnload", _this);
    }] call EFUNC(common,addEventHandler);
};
