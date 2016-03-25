#include "\z\mars\addons\common\define.hpp"

class GVAR(guiMain) {
    idd = 600002;
    movingEnable = true;
    onLoad = QUOTE([_this select 0] call FUNC(onEditorOpen););
    
    class controls {
        class MenuBar: MARS_gui_backgroundBaseSolid {
            idc = 100;
            x = 0 * safeZoneW + safeZoneX;
            y = 0 * safeZoneH + safeZoneY;
            w = safeZoneW;
            h = 0.025 * safeZoneH;
            colorBackground[] = {0.05,0.05,0.05,1};
        };
        class LeftPanel: MARS_gui_backgroundBaseSolid {
            idc = 101;
            x = 0 * safeZoneW + safeZoneX;
            y = 0.04 * safeZoneH + safeZoneY;
            w = 0.15 * safeZoneW;
            h = safeZoneH - 0.04;
            colorBackground[] = {0.1,0.1,0.1,1};
        };
    };
};