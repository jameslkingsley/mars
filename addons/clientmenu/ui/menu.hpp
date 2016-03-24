#include "\z\arcmc\addons\common\define.hpp"

class GVAR(clientMenu) {
    idd = 600001;
    movingEnable = true;
    onLoad = QUOTE([_this select 0] call FUNC(onMenuOpen););
    onUnload = QUOTE(call FUNC(onMenuClose));
    
    class controls {
        class HeaderBackground: ARC_gui_accentBase {
            idc = -1;
            x = 0.396849 * safezoneW + safezoneX;
            y = 0.3328 * safezoneH + safezoneY;
            w = 0.195987 * safezoneW;
            h = 0.022 * safezoneH;
            text = "ARCOMM Mission Control";
        };
        class CenterBackground: ARC_gui_backgroundBase {
            idc = -1;
            x = 0.396849 * safezoneW + safezoneX;
            y = 0.357 * safezoneH + safezoneY;
            w = 0.195987 * safezoneW;
            h = 0.077 * safezoneH;
        };
        class FooterBackground: ARC_gui_backgroundBase {
            idc = -1;
            x = 0.396849 * safezoneW + safezoneX;
            y = 0.4362 * safezoneH + safezoneY;
            w = 0.143379 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class Option1_Label: ARC_gui_staticBase {
            idc = 100;
            text = "Terrain Detail";
            x = 0.402007 * safezoneW + safezoneX;
            y = 0.368 * safezoneH + safezoneY;
            w = 0.0928357 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class Option1_Combo: ARC_gui_comboBoxBase {
            idc = 101;
            x = 0.494842 * safezoneW + safezoneX;
            y = 0.368 * safezoneH + safezoneY;
            w = 0.0928357 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class Option2_Label: ARC_gui_staticBase {
            idc = 102;
            text = "View Distance (meters)";
            x = 0.402007 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.0928357 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class Option2_Combo: ARC_gui_comboBoxBase {
            idc = 103;
            x = 0.494842 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.0928357 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class BtnClose: ARC_gui_buttonBase {
            idc = 104;
            text = "Close";
            x = 0.54126 * safezoneW + safezoneX;
            y = 0.4362 * safezoneH + safezoneY;
            w = 0.0515754 * safezoneW;
            h = 0.022 * safezoneH;
            action = "closeDialog 0";
        };
    };
};