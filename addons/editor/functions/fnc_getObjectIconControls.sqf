/*
 * Author: Kingsley
 * Gets the icon controls for the given object or empty array if none present
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * Array of controls <ARRAY>
 *
 * Example:
 * [player] call mars_editor_fnc_getObjectIconControls;
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_object", objNull, [objNull]]];

(GETUVAR(GVAR(iconControls), []) select {
    ((_x getVariable [QGVAR(object), objNull]) == _object)
});
