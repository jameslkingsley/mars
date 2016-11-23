/*
 * Author: Kingsley
 * Updates debug panel lines
 *
 * Arguments:
 * 0: Display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [display] call mars_editor_fnc_updateDebugPanel;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_display", displayNull]];

private _debugPanel = _display displayCtrl IDC_DEBUGPANEL;
private _debugPanelContent = _display displayCtrl IDC_DEBUGPANEL_CONTENT;

if (!GVAR(showDebugPanel) || {GVAR(selection) isEqualTo []}) exitWith {
    _debugPanel ctrlEnable false;
    _debugPanel ctrlShow false;
};

private _content = "";

{
    _x params ["_label", "_code", "_single"];
    private "_value";

    if (_single) then {
        _value = (GVAR(selection) param [0, objNull]) call _code;
    } else {
        _value = GVAR(selection) call _code;
    };

    if (typeName _value in ["CONFIG","CONTROL","DISPLAY","GROUP","LOCATION","OBJECT","SCRIPT"] && {isNull _value}) then {
        _value = "Null";
    };

    if (_value isEqualType false) then {
        _value = ["No","Yes"] select _value;
    };

    _content = format [
        "%1<t align='left' font='RobotoCondensed'>%2</t><t align='right' font='RobotoCondensed'>%3</t><br />",
        _content,
        _label,
        _value
    ];
} forEach GVAR(debugPaneLines);

_debugPanel ctrlEnable true;
_debugPanel ctrlShow true;
_debugPanelContent ctrlSetStructuredText parseText _content;
