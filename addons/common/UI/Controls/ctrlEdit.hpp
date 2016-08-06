class MARS_gui_ctrlEdit: RscEdit {
    font = FONT_MONO;
    size = SIZEEX_ETELKA_S;
    sizeEx = SIZEEX_ETELKA_S;
    shadow = 0;
    autocomplete = "general";
    colorText[] = {COLOR_TEXT_RGBA};
    colorBackground[] = {COLOR_OVERLAY_RGBA};
    colorDisabled[] = {COLOR_TEXT_RGB,0.25};
    colorSelection[] = {QCOLOR_ACTIVE_RGBA};
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
    tooltipColorText[] = {COLOR_TEXT_RGBA};
    tooltipColorBox[] = {0,0,0,0};
    tooltipColorShade[] = {0,0,0,1};
};

class MARS_gui_ctrlEditMulti: MARS_gui_ctrlEdit {
    style = ST_MULTI;
    autocomplete = "scripting";
};