class MARS_gui_ctrlEdit: MARS_gui_ctrlDefaultText {
    type = CT_EDIT;
    colorBackground[] = {COLOR_OVERLAY_RGBA};
    text = "";
    colorText[] = {COLOR_TEXT_RGBA};
    colorDisabled[] = {COLOR_TEXT_RGB,0.25};
    colorSelection[] = {COLOR_ACTIVE_RGBA};
    canModify = 1;
    autocomplete = "";
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
};

class MARS_gui_ctrlEditMulti: MARS_gui_ctrlEdit {
    style = ST_MULTI;
};