/*
 * Author: Kingsley
 * Function that is called when marker attribute is confirmed
 *
 * Arguments:
 * 0: Data passed by attributes framework <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call mars_editor_fnc_attrConfirmMarker;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_data", "_args"];
_args params ["_displayName", "_worldPos", "_classname"];

private _name = ATTR_VALUE(All_Name_Edit);
private _text = ATTR_VALUE(All_Text_Edit);
private _pos = ATTR_VALUE(All_Position_Vector);
private _sizeWidth = ATTR_VALUE(All_Size_EditW);
private _sizeHeight = ATTR_VALUE(All_Size_EditH);
private _color = ATTR_VALUE(All_Color_MarkerColor);
private _alpha = ATTR_VALUE(All_Alpha_Slider);
private _visibleBLUFOR = ATTR_VALUE(All_BLUFOR_Checkbox);
private _visibleOPFOR = ATTR_VALUE(All_OPFOR_Checkbox);
private _visibleINDFOR = ATTR_VALUE(All_INDFOR_Checkbox);
private _visibleCIVILIAN = ATTR_VALUE(All_CIVILIAN_Checkbox);

private _sides = [];

{
    if (_x) then {
        _sides pushBack ([west, east, resistance, civilian] select _forEachIndex);
    };
} forEach [_visibleBLUFOR, _visibleOPFOR, _visibleINDFOR, _visibleCIVILIAN];

[QEGVAR(common,createMarkerLocal), [
    _classname,
    _name,
    _text,
    _pos,
    [parseNumber _sizeWidth, parseNumber _sizeHeight],
    _color,
    _alpha,
    _sides
]] call CBA_fnc_globalEventJIP;

["Marker Created"] call FUNC(notification);
[] call FUNC(serializeDrawing);
