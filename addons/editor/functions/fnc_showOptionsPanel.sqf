/*
 * Author: Kingsley
 * Shows an option panel for easy custom UIs
 *
 * Arguments:
 * 0: Position (top, bottom, left, right) <STRING>
 * 1: Options <ARRAY>
 *     0: Option <ARRAY>
 *         0: Label <STRING>
 *         1: Type (combo, edit, button, etc.) <STRING>
 *         2: Data <ANY>
 *
 * Return Value:
 * None
 *
 * Example:
 * TODO
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_pos", "bottom", [""]],
    ["_options", [], [[]]]
];

switch (_pos) do {
    case "bottom": {
        #define BOTTOM_POS_X (0 * safeZoneW + safeZoneX)
        #define BOTTOM_POS_Y (0.85 * safeZoneW + safeZoneX)
        #define BOTTOM_POS_W safeZoneW
        #define BOTTOM_POS_H (0.15 * safeZoneH)
        #define BOTTOM_POS [BOTTOM_POS_X,BOTTOM_POS_Y,BOTTOM_POS_W,BOTTOM_POS_H]
        
        _panel = GETUVAR(GVAR(interface),displayNull) ctrlCreate ["MARS_gui_panelBase", 8856];
        
        _panel ctrlSetPosition [BOTTOM_POS_X,(1 * safeZoneW + safeZoneX),BOTTOM_POS_W,BOTTOM_POS_H];
        _panel ctrlShow true;
        _panel ctrlCommit 0;
        
        _panel ctrlSetPosition BOTTOM_POS;
        _panel ctrlCommit 0.15;
    };
};
