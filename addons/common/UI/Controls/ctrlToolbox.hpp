class MARS_gui_ctrlToolbox: MARS_gui_ctrlDefaultText {
    type = CT_TOOLBOX;
    style = ST_CENTER;
    colorBackground[] = {COLOR_OVERLAY_RGBA};
    colorText[] = {1,1,1,1};
    colorTextSelect[] = {1,1,1,1};
    rows = 1;
    columns = 1;
    strings[] = {};
    values[] = {};
    color[] = {1,0,1,1};
    colorSelect[] = {0,0,0,0};
    colorTextDisable[] = {0,0,0,0};
    colorDisable[] = {0,0,0,0};
    colorSelectedBg[] = {QCOLOR_ACTIVE_RGBA};
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
    onToolBoxSelChanged = "";
};

class MARS_gui_ctrlToolboxPicture: MARS_gui_ctrlToolbox {
    style = ST_CENTER + ST_PICTURE;
};

class MARS_gui_ctrlToolboxPictureKeepAspect: MARS_gui_ctrlToolbox {
    style = ST_CENTER + ST_PICTURE + ST_KEEP_ASPECT_RATIO;
};