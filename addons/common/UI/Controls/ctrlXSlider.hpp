class MARS_gui_ctrlXSliderV: MARS_gui_ctrlDefault
{
    type = CT_XSLIDER; // Type
    style = SL_VERT;

    color[] = {1,1,1,0.6}; // Text color
    colorActive[] = {1,1,1,1}; // Text selection color
    colorDisabled[] = {1,1,1,0.25}; // Disabled text color

    sliderRange[] = {0,1}; // Slider range
    sliderPosition = 1; // Default slider position (within the range)
    lineSize = 0.1; // Step when clicking on an arrow

    arrowEmpty = "\a3\3DEN\Data\Controls\CtrlXSlider\arrowEmpty_ca.paa"; // Arrow
    arrowFull = "\a3\3DEN\Data\Controls\CtrlXSlider\arrowFull_ca.paa"; // Arrow when clicked on
    border = "\a3\3DEN\Data\Controls\CtrlXSlider\border_ca.paa"; // Slider background (stretched vertically)
    thumb = "\a3\3DEN\Data\Controls\CtrlXSlider\thumb_ca.paa"; // Dragging element (stretched vertically)

    class Title // Link to a title (obsolete?)
    {
        idc = -1; // Control IDC (has to be defined ABOVE the slider control)
        colorBase[] = {1,1,1,1}; // Text color
        colorActive[] = {COLOR_ACTIVE_RGBA}; // Text color when the slider is active
    };
    class Value // Link to a control which will show slider value
    {
        idc = -1; // Control IDC (has to be defined ABOVE the slider control)
        format = "%.f"; // Text format, value is represented by variable %g (float) or %.f (integer)
        type = SPTPlain; // Format, can be SPTPlain or SPTPercents (multiplies the value by 100)
        colorBase[] = {1,1,1,1}; // Text color
        colorActive[] = {COLOR_ACTIVE_RGBA}; // Text color when the slider is active
    };

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
};

class MARS_gui_ctrlXSliderH: MARS_gui_ctrlXSliderV
{
    style = SL_HORZ;
};
