class MARS_gui_ctrlActiveText: MARS_gui_ctrlDefaultButton {
    type = CT_ACTIVETEXT;
    text = "";
    color[] = {QCOLOR_ACTIVE_RGB,0.75};
    colorActive[] = {QCOLOR_ACTIVE_RGBA};
    colorDisabled[] = {QCOLOR_ACTIVE_RGBA};
    onCanDestroy = "";
    onDestroy = "";
    onMouseEnter = "";
    onMouseExit = "";
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
    onButtonClick = "";
    onButtonDown = "";
    onButtonUp = "";
};

class MARS_gui_ctrlActivePicture: MARS_gui_ctrlActiveText {
    style = ST_PICTURE;
    color[] = {COLOR_TEXT_RGBA};
};

class MARS_gui_ctrlActivePictureKeepAspect: MARS_gui_ctrlActiveText {
    style = ST_PICTURE + ST_KEEP_ASPECT_RATIO;
};