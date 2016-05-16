class MARS_gui_ctrlStatic: MARS_gui_ctrlDefaultText
{
    type = CT_STATIC; // Type

    colorBackground[] = {0,0,0,0}; // Fill color

    text = ""; // Displayed text
    lineSpacing = 1; // When ST_MULTI style is used, this defines distance between lines (1 is text height)
    fixedWidth = 0; // 1 (true) to enable monospace
    colorText[] = {1,1,1,1}; // Text color
    colorShadow[] = {0,0,0,1}; // Text shadow color (used only when shadow is 1)

    moving = 0; // 1 (true) to allow dragging the whole display by the control

    autoplay = 0; // Play video automatically (only for style ST_PICTURE with text pointing to an .ogv file)
    loops = 0; // Number of video repeats (only for style ST_PICTURE with text pointing to an .ogv file)

    tileW = 1; // Number of tiles horizontally (only for style ST_TILE_PICTURE)
    tileH = 1; // Number of tiles vertically (only for style ST_TILE_PICTURE)

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
class MARS_gui_ctrlStaticPicture: MARS_gui_ctrlStatic
{
    style = ST_PICTURE;
};
class MARS_gui_ctrlStaticPictureKeepAspect: MARS_gui_ctrlStaticPicture
{
    style = ST_PICTURE + ST_KEEP_ASPECT_RATIO;
};
class MARS_gui_ctrlStaticPictureTile: MARS_gui_ctrlStatic
{
    style = ST_TILE_PICTURE;
};
class MARS_gui_ctrlStaticFrame: MARS_gui_ctrlStatic
{
    style = ST_FRAME;
};
class MARS_gui_ctrlStaticLine: MARS_gui_ctrlStatic
{
    style = ST_LINE;
};
class MARS_gui_ctrlStaticMulti: MARS_gui_ctrlStatic
{
    style = ST_MULTI + ST_NO_RECT;
};
class MARS_gui_ctrlStaticBackground: MARS_gui_ctrlStatic
{
    colorBackground[] = {COLOR_BACKGROUND_RGBA};
};
class MARS_gui_ctrlStaticOverlay: MARS_gui_ctrlStatic
{
    colorBackground[] = {COLOR_OVERLAY_RGBA};
};
class MARS_gui_ctrlStaticTitle: MARS_gui_ctrlStatic
{
    moving = 1;
    colorBackground[] = {COLOR_ACTIVE_RGBA};
    colorText[] = {1,1,1,1};
};
class MARS_gui_ctrlStaticFooter: MARS_gui_ctrlStatic
{
    colorBackground[] = {0,0,0,0.3};
};
class MARS_gui_ctrlStaticBackgroundDisable: MARS_gui_ctrlStatic
{
    x = -4;
    y = -2;
    w = 8;
    h = 4;
    colorBackground[] = {1,1,1,0.5};
};
class MARS_gui_ctrlStaticBackgroundDisableTiles: MARS_gui_ctrlStaticPictureTile
{
    x = -4;
    y = -2;
    w = 8;
    h = 4;
    text = "\a3\3DEN\Data\Displays\Display3DENEditAttributes\backgroundDisable_ca.paa";
    tileW = 8 / (32 * pixelW);
    tileH = 4 / (32 * pixelH);
    colorText[] = {1,1,1,0.05};
};