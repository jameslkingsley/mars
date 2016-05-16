class MARS_gui_ctrlButton: MARS_gui_ctrlDefaultButton {
    type = CT_BUTTON;
    style = ST_CENTER + ST_UPPERCASE;
    colorBackground[] = {0,0,0,1};
    colorBackgroundDisabled[] = {0,0,0,0.5};
    colorBackgroundActive[] = {COLOR_ACTIVE_RGBA};
    colorFocused[] = {COLOR_ACTIVE_RGBA};
    font = FONT2_THIN;
    text = "";
    colorText[] = {COLOR_TEXT_RGBA};
    colorDisabled[] = {COLOR_TEXT_RGB,0.25};
    borderSize = 0;
    colorBorder[] = {0,0,0,0};
    colorShadow[] = {0,0,0,0};
    offsetX = 0;
    offsetY = 0;
    offsetPressedX = pixelW;
    offsetPressedY = pixelH;
    period = 0;
    periodFocus = 2;
    periodOver = 0.5;
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

    class KeyHints {
        class A {
            key = KEY_XBOX_A;
            hint = "KEY_XBOX_A";
        };
    };
};

class MARS_gui_ctrlButtonPicture: MARS_gui_ctrlButton {
    style = ST_CENTER + ST_PICTURE;
};

class MARS_gui_ctrlButtonPictureKeepAspect: MARS_gui_ctrlButton {
    style = ST_CENTER + ST_PICTURE + ST_KEEP_ASPECT_RATIO;
};

class MARS_gui_ctrlButtonOK: MARS_gui_ctrlButton {
    default = 1;
    idc = IDC_OK;
    text = $STR_DISP_OK;
};

class MARS_gui_ctrlButtonCancel: MARS_gui_ctrlButton {
    idc = IDC_CANCEL;
    text = $STR_DISP_CANCEL;
};

class MARS_gui_ctrlButtonClose: MARS_gui_ctrlButtonCancel {
    text = $STR_DISP_CLOSE;
};

class MARS_gui_ctrlButtonToolbar: MARS_gui_ctrlButtonPictureKeepAspect {
    colorBackground[] = {0,0,0,0};
    colorBackgroundDisabled[] = {0,0,0,0};
};

class MARS_gui_ctrlButtonSearch: MARS_gui_ctrlButton {
    style = ST_CENTER + ST_PICTURE + ST_KEEP_ASPECT_RATIO;
    text = "\a3\3DEN\Data\Displays\Display3DEN\search_start_ca.paa";
    textSearch = "\a3\3DEN\Data\Displays\Display3DEN\search_end_ca.paa";
    tooltip = $STR_3den_display3den_menubar_search_text;
};

class MARS_gui_ctrlButtonFilter: MARS_gui_ctrlButton {
    colorBackground[] = {0,0,0,0};
    colorBackgroundDisabled[] = {0,0,0,0};
    colorBackgroundActive[] = {1,1,1,0.3};
    colorFocused[] = {0,0,0,0};
};