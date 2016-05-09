#include "\z\mars\addons\common\define.hpp"

class GVAR(datetime) {
    idd = 600003;
    enableSimulation = 1;
    movingEnable = 1;
    onLoad = QUOTE(_this call FUNC(onLoadDateTime));
    class controls {
        class Background: MARS_gui_backgroundBaseSolid
        {
            idc = 1000;
            x = 0.304013 * safezoneW + safezoneX;
            y = 0.2712 * safezoneH + safezoneY;
            w = 0.216617 * safezoneW;
            h = 0.11 * safezoneH;
        };
        class Header: MARS_gui_accentBase
        {
            idc = 1001;
            text = "ADJUST DATE AND TIME"; //--- ToDo: Localize;
            x = 0.304013 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.216617 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class Year: MARS_gui_comboBoxBase
        {
            idc = 2100;
            x = 0.309171 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.056733 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class Month: MARS_gui_comboBoxBase
        {
            idc = 2101;
            x = 0.371061 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.0825207 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class Day: MARS_gui_comboBoxBase
        {
            idc = 2102;
            x = 0.45874 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.056733 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class Time: MARS_gui_sliderXBase
        {
            idc = 1900;
            x = 0.309171 * safezoneW + safezoneX;
            y = 0.346 * safezoneH + safezoneY;
            w = 0.206302 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class TimeLabel: MARS_gui_textBase
        {
            idc = 1000;
            style = "0x02 + 0x0c";
            text = "Time"; //--- ToDo: Localize;
            x = 0.309171 * safezoneW + safezoneX;
            y = 0.324 * safezoneH + safezoneY;
            w = 0.206302 * safezoneW;
            h = 0.011 * safezoneH;
        };
        class BtnApply: MARS_gui_buttonBaseSolid
        {
            idc = 1600;
            text = "APPLY"; //--- ToDo: Localize;
            x = 0.304013 * safezoneW + safezoneX;
            y = 0.3834 * safezoneH + safezoneY;
            w = 0.0515754 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class BtnClose: MARS_gui_buttonBaseSolid
        {
            idc = 1601;
            text = "CLOSE"; //--- ToDo: Localize;
            x = 0.469055 * safezoneW + safezoneX;
            y = 0.3834 * safezoneH + safezoneY;
            w = 0.0515754 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class BtnSpacer: MARS_gui_spacerBaseSolid
        {
            idc = 1602;
            x = 0.35662 * safezoneW + safezoneX;
            y = 0.3834 * safezoneH + safezoneY;
            w = 0.111402 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
};
