class MARS_gui_ctrlSliderV: MARS_gui_ctrlDefault {
    type = CT_SLIDER;
    style = SL_VERT;
    color[] = {0,0,0,1};
    colorDisabled[] = {1,1,1,0.25};
    colorActive[] = {QCOLOR_ACTIVE_RGBA};
    sliderRange[] = {0,1};
    sliderPosition = 1;
    lineSize = 0.1;
    pageSize = 3;
    onCanDestroy = "";
    onDestroy = "";
    onSetFocus = "";
    onKillFocus = "";
    onKeyDown = "";
    onKeyUp = "";
    onMouseButtonDown = "";
    onMouseButtonUp = "";
    onMouseButtonClick = "";
    onMouseButtonDblClick = "";
    onMouseZChanged = "";
    onMouseMoving = "";
    onMouseHolding = "";
    onSliderPosChanged = "";

    class Title {
        idc = -1;
        colorBase[] = {1,1,1,1};
        colorActive[] = {QCOLOR_ACTIVE_RGBA};
    };

    class Value {
        idc = -1;
        format = "%.f";
        type = SPTPlain;
        colorBase[] = {1,1,1,1};
        colorActive[] = {QCOLOR_ACTIVE_RGBA};
    };
};

class MARS_gui_ctrlSliderH: MARS_gui_ctrlSliderV {
    type = CT_XSLIDER;
    style = SL_HORZ;
    blinkingPeriod = 0;
    tooltip = "";
    tooltipColorShade[] = {0,0,0,1};
    tooltipColorText[] = {1,1,1,1};
    tooltipColorBox[] = {0,0,0,1};
    arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
    arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
    border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
    thumb = "#(argb,8,8,3)color(1,1,1,1)";
};
