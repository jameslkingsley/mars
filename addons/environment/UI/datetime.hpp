#include "\z\mars\addons\common\define.hpp"

class GVAR(datetime) {
    idd = 600003;
    enableSimulation = 1;
    movingEnable = 1;
    onLoad = QUOTE(_this call FUNC(onLoadDateTime));
    class controls {
        class Background: MARS_gui_backgroundBaseSolid
        {
            idc = -1;
            x = 0.314328 * safezoneW + safezoneX;
            y = 0.269 * safezoneH + safezoneY;
            w = 0.216617 * safezoneW;
            h = 0.11 * safezoneH;
        };
        class Header: MARS_gui_accentBase
        {
            idc = -1;
            text = "Adjust date and time";
            x = 0.314328 * safezoneW + safezoneX;
            y = 0.2448 * safezoneH + safezoneY;
            w = 0.216617 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class Year: MARS_gui_comboBoxBase
        {
            idc = 2100;
            x = 0.319486 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.056733 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class Month: MARS_gui_comboBoxBase
        {
            idc = 2101;
            x = 0.381377 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.0825207 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class Day: MARS_gui_comboBoxBase
        {
            idc = 2102;
            x = 0.469055 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.056733 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class Time: MARS_gui_sliderBase
        {
            idc = 1900;
            x = 0.319486 * safezoneW + safezoneX;
            y = 0.346 * safezoneH + safezoneY;
            w = 0.206302 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class TimeLabel: MARS_gui_textBase
        {
            idc = 1000;
            text = "Time";
            x = 0.319486 * safezoneW + safezoneX;
            y = 0.324 * safezoneH + safezoneY;
            w = 0.206302 * safezoneW;
            h = 0.011 * safezoneH;
        };
        class BtnApply: MARS_gui_buttonBase
        {
            idc = 1600;
            text = "Apply";
            x = 0.314328 * safezoneW + safezoneX;
            y = 0.3812 * safezoneH + safezoneY;
            w = 0.0515754 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class BtnClose: MARS_gui_buttonBase
        {
            idc = 1601;
            text = "Close";
            x = 0.479369 * safezoneW + safezoneX;
            y = 0.3812 * safezoneH + safezoneY;
            w = 0.0515754 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class BtnSpacer: MARS_gui_buttonBase
        {
            idc = 1602;
            x = 0.366936 * safezoneW + safezoneX;
            y = 0.3812 * safezoneH + safezoneY;
            w = 0.111402 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
};
