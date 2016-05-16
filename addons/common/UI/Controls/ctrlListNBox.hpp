class MARS_gui_ctrlListNBox: MARS_gui_ctrlDefaultText
{
    type = CT_LISTNBOX; // Type
    style = ST_LEFT + LB_TEXTURES; // Style

    colorSelectBackground[] = {COLOR_ACTIVE_RGBA}; // Selected item fill color
    colorSelectBackground2[] = {COLOR_ACTIVE_RGBA}; // Selected item fill color (oscillates between this and colorSelectBackground)

    colorText[] = {COLOR_TEXT_RGBA}; // Text and frame color
    colorDisabled[] = {COLOR_TEXT_RGB,0.25}; // Disabled text color
    colorSelect[] = {1,1,1,1}; // Text selection color
    colorSelect2[] = {1,1,1,1}; // Text selection color (oscillates between this and colorSelect)
    colorShadow[] = {0,0,0,0.5}; // Text shadow color (used only when shadow is 1)

    colorPicture[] = {1,1,1,1}; // Picture color
    colorPictureSelected[] = {1,1,1,1}; // Selected picture color
    colorPictureDisabled[] = {1,1,1,0.25}; // Disabled picture color

    columns[] = {0}; // Horizontal coordinates of columns (relative to list width, in range from 0 to 1)

    drawSideArrows = 0; // 1 to draw buttons linked by idcLeft and idcRight on both sides of selected line. They are resized to line height
    idcLeft = -1; // Left button IDC
    idcRight = -1; // Right button IDC

    period = 1; // Oscillation time between colorSelect/colorSelectBackground2 and colorSelect2/colorSelectBackground when selected
    disableOverflow = 0; // 0 to keep overflow as it was before, 1 to crop too long text

    rowHeight = SIZEEX_PURISTA(SIZEEX_M); // Row height
    maxHistoryDelay = 1; // Time since last keyboard type search to reset it

    soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1}; // Sound played when an item is selected

    // Scrollbar configuration (applied only when LB_TEXTURES style is used)
    class ListScrollBar: ScrollBar{};

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

    onLBSelChanged = "";
    onLBDblClick = "";
};