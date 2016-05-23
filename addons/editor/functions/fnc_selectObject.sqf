/*
 * Author: Kingsley
 * Handles selecting an object via left click
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call mars_editor_fnc_selectObject;
 *
 * Public: No
 */

#include "script_component.hpp"

private _target = [] call FUNC(objectUnderCursor);

if (_target == GVAR(prepSurfaceSphere)) exitWith {};

if (isNull _target) then {
    GVAR(selection) = [];
} else {
    [_target, !(vehicle _target == _target)] call FUNC(highlightObject);
};
