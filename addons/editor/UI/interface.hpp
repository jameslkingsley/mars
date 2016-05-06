#include "\z\mars\addons\common\define.hpp"

class RscFrame {
    x = 0;
    y = 0;
    w = 0;
    h = 0;
};

class RscButtonMenu;
class RscControlsGroupNoScrollbars;
class RscMapControl;
class RscPicture;
class RscText;
class RscTree;

class GVAR(interface) {
    idd = 600002;
    enableSimulation = 1;
    movingEnable = 0;
    onLoad = QUOTE([ARR_2('onLoad',_this)] call FUNC(handleInterface));
    onUnload = QUOTE([ARR_2('onUnload',_this)] call FUNC(handleInterface));
    onKeyDown = QUOTE([ARR_2('onKeyDown',_this)] call FUNC(handleInterface));
    onKeyUp = QUOTE([ARR_2('onKeyUp',_this)] call FUNC(handleInterface));
    class controlsBackground {
        class mouseHandler: RscControlsGroupNoScrollbars {
            x = safeZoneXAbs;
            y = safeZoneY;
            w = safeZoneWAbs;
            h = safeZoneH;
            onMouseButtonDown = QUOTE([ARR_2('onMouseButtonDown',_this)] call FUNC(handleInterface));
            onMouseButtonUp = QUOTE([ARR_2('onMouseButtonUp',_this)] call FUNC(handleInterface));
            onMouseZChanged = QUOTE([ARR_2('onMouseZChanged',_this)] call FUNC(handleInterface));
            onMouseMoving = QUOTE([ARR_2('onMouseMoving',_this)] call FUNC(handleInterface));
            onMouseHolding = QUOTE([ARR_2('onMouseHolding',_this)] call FUNC(handleInterface));
        };
    };
    class controls {
        class MenuBar: MARS_gui_backgroundBaseSolid {
            idc = 100;
            x = 0 * safeZoneW + safeZoneX;
            y = 0 * safeZoneH + safeZoneY;
            w = safeZoneW;
            h = (0.03 * safeZoneH);
            colorBackground[] = {0.1,0.1,0.1,1};
        };
        class MenuBarButtons: MARS_gui_backgroundBaseSolid {
            idc = 103;
            x = 0 * safeZoneW + safeZoneX;
            y = 0.03 * safeZoneH + safeZoneY;
            w = safeZoneW;
            h = (0.03 * safeZoneH);
            colorBackground[] = {0.14,0.14,0.14,1};
        };
        class LeftPanel: MARS_gui_backgroundBaseSolid {
            idc = 101;
            x = 0 * safeZoneW + safeZoneX;
            y = 0.059 * safeZoneH + safeZoneY;
            w = 0.15 * safeZoneW;
            h = safeZoneH - 0.03;
            colorBackground[] = {0.2,0.2,0.2,0.88};
        };
        class RightPanel: MARS_gui_backgroundBaseSolid {
            idc = 102;
            x = 0.85 * safeZoneW + safeZoneX;
            y = 0.059 * safeZoneH + safeZoneY;
            w = 0.15 * safeZoneW;
            h = safeZoneH - 0.03;
            colorBackground[] = {0.2,0.2,0.2,0.88};
        };
    };
};
