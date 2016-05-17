/*
 * Author: Kingsley
 * Creates the entity list control
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
/*
_ctrl = GETUVAR(GVAR(interface),displayNull) ctrlCreate ["MARS_gui_treeBase", IDC_ENTITYLIST];

_ctrl ctrlSetPosition [
    (0 * safeZoneW + safeZoneX),
    (0.06 * safeZoneH + safeZoneY),
    (0.15 * safeZoneW),
    (safeZoneH - 0.06)
];

_ctrl ctrlCommit 0;

tvClear _ctrl;

GVAR(entityList_west) = _ctrl tvAdd [[], "BLUFOR"];
GVAR(entityList_east) = _ctrl tvAdd [[], "OPFOR"];
GVAR(entityList_guer) = _ctrl tvAdd [[], "INDFOR"];
GVAR(entityList_civ) = _ctrl tvAdd [[], "CIVILIAN"];
GVAR(entityList_empty) = _ctrl tvAdd [[], "EMPTY"];

GVAR(entityListPFH) = [{[] call FUNC(handleEntityList);}, 0.1, []] call CBA_fnc_addPerFrameHandler;
*/