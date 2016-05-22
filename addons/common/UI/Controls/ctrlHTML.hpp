class MARS_gui_ctrlHTML: MARS_gui_ctrlDefaultText {
    type = CT_HTML;
    colorBackground[] = {0,0,0,0};
    colorText[] = {COLOR_TEXT_RGBA};
    colorBold[] = {COLOR_TEXT_RGB,0.5};
    colorLink[] = {COLOR_TEXT_RGBA};
    colorLinkActive[] = {COLOR_ACTIVE_RGBA};
    colorPicture[] = {1,1,1,1};
    colorPictureBorder[] = {0,0,0,0};
    colorPictureLink[] = {1,1,1,1};
    colorPictureSelected[] = {1,1,1,1};
    prevPage = "\a3\3DEN\Data\Controls\CtrlHTML\prevPage_ca.paa";
    nextPage = "\a3\3DEN\Data\Controls\CtrlHTML\nextPage_ca.paa";
    filename = "";
    cycleLinks = 0;
    cycleAllLinks = 0;
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
    onHTMLLink = "";

    class P {
        font = FONT_NORMAL;
        fontBold = FONT_BOLD;
        sizeEx = SIZEEX_PURISTA_M;
    };

    class H1: P {
        sizeEx = SIZEEX_PURISTA_XL;
    };

    class H2: P {
        sizeEx = SIZEEX_PURISTA_L;
    };

    class H3: P {};

    class H4: P {};

    class H5: P {};

    class H6: P {
        font = FONT_THIN;
        fontBold = FONT_THIN;
    };
};