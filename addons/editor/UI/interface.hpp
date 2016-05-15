#include "\z\mars\addons\common\define.hpp"
#include "resinc.hpp"

#define PANEL_W	60
#define MENUBAR_H	SIZE_M
#define TOOLBAR_H	(SIZE_M + 2)
#define TAB_H	(SIZE_M + 1)
#define STATUSBAR_W	(safezoneW - PANEL_W * GRID_W)
#define STATUSBAR_H	SIZE_S
#define CONTROLSHINT_W	50
#define PLAYBUTTON_H	10
#define NAV_H		15
#define TRANSPARENT_A	0.87

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
    enableDisplay = 1;
	closeOnMissionEnd = 0;
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
        class ButtonExit: MARS_gui_ctrlButtonPicture {
			idc = IDC_EXIT;
			x = safezoneX + safezoneW - (SIZE_M * GRID_W);
			y = safezoneY;
			w = SIZE_M * GRID_W;
			h = SIZE_M * GRID_H;
			colorBackground[] = {COLOR_TAB_RGBA};
            text = QUOTE(PATHTOF(data\search_end_ca.paa));
            action = QUOTE([] call FUNC(closeEditor));
			offsetPressedX = 0;
			offsetPressedY = 0;
		};
        class MenuStrip: MARS_gui_ctrlMenuStrip {
            idc = IDC_MENUSTRIP;
            x = safezoneX;
			y = safezoneY;
			w = safezoneW - SIZE_M * GRID_W;
			h = MENUBAR_H * GRID_H;
			colorBackground[] = {COLOR_TAB_RGBA};
        };
        class Toolbar: MARS_gui_ctrlStatic {
            idc = IDC_TOOLBAR;
            x = safezoneX;
			y = safezoneY + MENUBAR_H * GRID_H;
			w = safezoneW;
			h = TOOLBAR_H * GRID_H;
            colorBackground[] = {0.106,0.106,0.106,1};
        };
        class LeftPanel: MARS_gui_ctrlStatic {
            idc = IDC_LEFTPANEL;
            x = safezoneX;
			y = safezoneY + (MENUBAR_H + TOOLBAR_H) * GRID_H;
			w = PANEL_W * GRID_W;
			h = safezoneH - (MENUBAR_H + TOOLBAR_H + STATUSBAR_H) * GRID_H;
            colorBackground[] = {COLOR_BACKGROUND_RGB,TRANSPARENT_A};
        };
        class RightPanel: MARS_gui_ctrlStatic {
            idc = IDC_RIGHTPANEL;
            x = safezoneX + safezoneW - PANEL_W * GRID_W;
			y = safezoneY + (SIZE_M + TOOLBAR_H) * GRID_H;
			w = PANEL_W * GRID_W;
			h = safezoneH - (MENUBAR_H + TOOLBAR_H + STATUSBAR_H) * GRID_H;
            colorBackground[] = {COLOR_BACKGROUND_RGB,TRANSPARENT_A};
        };
        class StatusBar: MARS_gui_ctrlStatic {
			idc = IDC_STATUSBAR;
			x = safezoneX;
			y = safezoneY + safezoneH - STATUSBAR_H * GRID_H;
			w = STATUSBAR_W;
			h = (STATUSBAR_H + 1) * GRID_H;
			colorBackground[] = {COLOR_TAB_RGBA};
		};
    };
};
