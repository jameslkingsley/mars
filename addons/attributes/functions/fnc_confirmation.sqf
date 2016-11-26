/*
 * Author: Kingsley
 * Opens a confirmation window
 *
 * Arguments:
 * 0: Window Title <STRING>
 * 1: Message <STRING>
 * 2: Yes Button Text <STRING>
 * 3: No Button Text <STRING>
 * 4: Yes Code <CODE, STRING>
 * 5: No Code <CODE, STRING>
 * 6: Args to pass to code <ANY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [
 *     "Hint Confirmation",
 *     "Are you sure you want to hint?",
 *     "Yes",
 *     "No",
 *     {hint _this},
 *     {},
 *     "Hinting"
 * ] call mars_attributes_fnc_confirmation;
 *
 * Public: 
 */

#include "script_component.hpp"

params [
    ["_title", "", [""]],
    ["_message", "", [""]],
    ["_yesText", "", [""]],
    ["_noText", "", [""]],
    ["_yesCode", {}, [{}, ""]],
    ["_noCode", {}, [{}, ""]],
    ["_args", []]
];

if (_title == "") then {_title = localize LSTRING(Confirmation_Title)};
if (_message == "") then {_message = localize LSTRING(Confirmation_Message)};
if (_yesText == "") then {_yesText = localize LSTRING(Confirmation_YesText)};
if (_noText == "") then {_noText = localize LSTRING(Confirmation_NoText)};

_yesCode = [_yesCode] call CFUNC(makeExecutable);
_noCode = [_noCode] call CFUNC(makeExecutable);

[QADDON, "Confirmation", [80, 45], [0, 1], [
    _title,
    _message,
    _yesText,
    _noText,
    _yesCode,
    _noCode,
    _args
]] call FUNC(openAttributes);
