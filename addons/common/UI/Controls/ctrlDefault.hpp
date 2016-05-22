class MARS_gui_ctrlDefault {
    access = 0;
    idc = -1;
    style = ST_LEFT;
    default = 0;
    show = 1;
    fade = 0;
    blinkingPeriod = 0;
    deletable = 0;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    tooltip = "";
    tooltipMaxWidth = 0.5;
    tooltipColorShade[] = {0,0,0,1};
    tooltipColorText[] = {1,1,1,1};
    tooltipColorBox[] = {0,0,0,0};

    class ScrollBar {
        width = 0;
        height = 0;
        scrollSpeed = 0.06;
        arrowEmpty = "\a3\3DEN\Data\Controls\ctrlDefault\arrowEmpty_ca.paa";
        arrowFull = "\a3\3DEN\Data\Controls\ctrlDefault\arrowFull_ca.paa";
        border = "\a3\3DEN\Data\Controls\ctrlDefault\border_ca.paa";
        thumb = "\a3\3DEN\Data\Controls\ctrlDefault\thumb_ca.paa";
        color[] = {1,1,1,1};
    };
};

class MARS_gui_ctrlDefaultText: MARS_gui_ctrlDefault {
    sizeEx = SIZEEX_PURISTA_M;
    font = FONT_NORMAL;
    shadow = 1;
};

class MARS_gui_ctrlDefaultButton: MARS_gui_ctrlDefaultText {
    soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
    soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
    soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
};