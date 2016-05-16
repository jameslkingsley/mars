class MARS_gui_ctrlSliderV: MARS_gui_ctrlDefault
{
    type = CT_SLIDER; // Type
    style = SL_VERT;

    color[] = {0,0,0,1}; // Text color
    colorDisabled[] = {1,1,1,0.25}; // Disabled text color
    colorActive[] = {COLOR_ACTIVE_RGBA}; // Text selection color

    sliderRange[] = {0,1}; // Slider range
    sliderPosition = 1; // Default slider position (within the range)
    lineSize = 0.1; // Step when clicking on an arrow
    pageSize = 3; // Step when clicking on a space outside of the pointer

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

class MARS_gui_ctrlSliderH: MARS_gui_ctrlSliderV
{
    style = SL_HORZ;
};
