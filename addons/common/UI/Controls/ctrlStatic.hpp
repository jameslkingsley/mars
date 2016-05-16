class MARS_gui_ctrlStatic: MARS_gui_ctrlDefaultText {
    type = CT_STATIC;
    colorBackground[] = {0,0,0,0};
    text = "";
    lineSpacing = 1;
    fixedWidth = 0;
    colorText[] = {1,1,1,1};
    colorShadow[] = {0,0,0,1};
    moving = 0;
    autoplay = 0;
    loops = 0;
    tileW = 1;
    tileH = 1;
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
    onVideoStopped = "";
};

class MARS_gui_ctrlStaticPicture: MARS_gui_ctrlStatic {
    style = ST_PICTURE;
};

class MARS_gui_ctrlStaticPictureKeepAspect: MARS_gui_ctrlStaticPicture {
    style = ST_PICTURE + ST_KEEP_ASPECT_RATIO;
};

class MARS_gui_ctrlStaticPictureTile: MARS_gui_ctrlStatic {
    style = ST_TILE_PICTURE;
};

class MARS_gui_ctrlStaticFrame: MARS_gui_ctrlStatic {
    style = ST_FRAME;
};

class MARS_gui_ctrlStaticLine: MARS_gui_ctrlStatic {
    style = ST_LINE;
};

class MARS_gui_ctrlStaticMulti: MARS_gui_ctrlStatic {
    style = ST_MULTI + ST_NO_RECT;
};

class MARS_gui_ctrlStaticBackground: MARS_gui_ctrlStatic {
    colorBackground[] = {COLOR_BACKGROUND_RGBA};
};

class MARS_gui_ctrlStaticOverlay: MARS_gui_ctrlStatic {
    colorBackground[] = {COLOR_OVERLAY_RGBA};
};

class MARS_gui_ctrlStaticTitle: MARS_gui_ctrlStatic {
    moving = 1;
    colorBackground[] = {COLOR_ACTIVE_RGBA};
    colorText[] = {1,1,1,1};
};

class MARS_gui_ctrlStaticFooter: MARS_gui_ctrlStatic {
    colorBackground[] = {0,0,0,0.3};
};

class MARS_gui_ctrlStaticBackgroundDisable: MARS_gui_ctrlStatic {
    x = -4;
    y = -2;
    w = 8;
    h = 4;
    colorBackground[] = {1,1,1,0.5};
};

class MARS_gui_ctrlStaticBackgroundDisableTiles: MARS_gui_ctrlStaticPictureTile {
    x = -4;
    y = -2;
    w = 8;
    h = 4;
    text = "\a3\3DEN\Data\Displays\Display3DENEditAttributes\backgroundDisable_ca.paa";
    tileW = 8 / (32 * pixelW);
    tileH = 4 / (32 * pixelH);
    colorText[] = {1,1,1,0.05};
};