class MARS_gui_ctrlDefault
{
    access = 0; // Control access (0 - ReadAndWrite, 1 - ReadAndCreate, 2 - ReadOnly, 3 - ReadOnlyVerified)
    idc = -1; // Control identification (without it, the control won't be displayed)
    style = ST_LEFT; // Style
    default = 0; // Control selected by default (only one within a display can be used)
    show = 1; // 1 (true) to show the control. Will be also shown when the attribute is missing.
    fade = 0; // Fade in range from 0 (fully visible) to 1 (hidden)
    blinkingPeriod = 0; // Time in which control will fade out and back in. Use 0 to disable the effect.
    deletable = 0; // 1 if control can be deleted using ctrlDelete scripting command

    x = 0; // Horizontal coordinates
    y = 0; // Vertical coordinates
    w = 0; // Width
    h = 0; // Height

    tooltip = ""; // Tooltip text
    tooltipMaxWidth = 0.5; // Max width of a tooltip. When text is longer, it's broken into multiple lines
    tooltipColorShade[] = {0,0,0,1}; // Tooltip background color
    tooltipColorText[] = {1,1,1,1}; // Tooltip text color
    tooltipColorBox[] = {0,0,0,0}; // Tooltip frame color

    class ScrollBar
    {
        width = 0; // Width
        height = 0; // Height
        scrollSpeed = 0.06; // Scroll speed

        arrowEmpty = "\a3\3DEN\Data\Controls\ctrlDefault\arrowEmpty_ca.paa"; // Arrow
        arrowFull = "\a3\3DEN\Data\Controls\ctrlDefault\arrowFull_ca.paa"; // Arrow when clicked on
        border = "\a3\3DEN\Data\Controls\ctrlDefault\border_ca.paa"; // Slider background (stretched vertically)
        thumb = "\a3\3DEN\Data\Controls\ctrlDefault\thumb_ca.paa"; // Dragging element (stretched vertically)

        color[] = {1,1,1,1}; // Scrollbar color
    };
};
class MARS_gui_ctrlDefaultText: MARS_gui_ctrlDefault
{
    sizeEx = SIZEEX_PURISTA(SIZEEX_M); // Text size
    font = FONT_NORMAL; // Font from CfgFontFamilies
    shadow = 1; // Shadow (0 - none, 1 - directional, color affected by colorShadow, 2 - black outline)
};
class MARS_gui_ctrlDefaultButton: MARS_gui_ctrlDefaultText
{
    soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1}; // Sound played after control is activated in format {file, volume, pitch}
    soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1}; // Sound played when mouse cursor enters the control
    soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1}; // Sound played when the control is pushed down
    soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1}; // Sound played when the control is released after pushing down
};