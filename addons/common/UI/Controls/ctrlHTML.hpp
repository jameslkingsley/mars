class MARS_gui_ctrlHTML: MARS_gui_ctrlDefaultText
{
    type = CT_HTML; // Type

    colorBackground[] = {0,0,0,0}; // Fill color

    colorText[] = {COLOR_TEXT_RGBA}; // Text color
    colorBold[] = {COLOR_TEXT_RGB,0.5}; // <b> text color
    colorLink[] = {COLOR_TEXT_RGBA}; // <a> text color
    colorLinkActive[] = {COLOR_ACTIVE_RGBA}; // Active <a> text color
    colorPicture[] = {1,1,1,1}; // Picture color
    colorPictureBorder[] = {0,0,0,0}; // Picture border color
    colorPictureLink[] = {1,1,1,1}; // <a> picture color
    colorPictureSelected[] = {1,1,1,1}; // Active <a> picture color

    prevPage = "\a3\3DEN\Data\Controls\ctrlHTML\prevPage_ca.paa"; // Pagination arrow for previous page
    nextPage = "\a3\3DEN\Data\Controls\ctrlHTML\nextPage_ca.paa"; // Pagination arrow for next page
    filename = "";
    cycleLinks = 0;
    cycleAllLinks = 0;

    class P // Paragraph style
    {
        font = FONT_NORMAL; // Font from CfgFontFamilies
        fontBold = FONT_BOLD; // Bold font from CfgFontFamilies
        sizeEx = SIZEEX_PURISTA(SIZEEX_M); // Text size
    };
    class H1:P // Header 1 style (uses same attributes as P)
    {
        sizeEx = SIZEEX_PURISTA(SIZEEX_XL);
    };
    class H2:P // Header 2 style (uses same attributes as P)
    {
        sizeEx = SIZEEX_PURISTA(SIZEEX_L);
    };
    class H3:P // Header 3 style (uses same attributes as P)
    {
    };
    class H4:P // Header 4 style (uses same attributes as P)
    {
    };
    class H5:P // Header 5 style (uses same attributes as P)
    {
    };
    class H6:P // Header 6 style (uses same attributes as P)
    {
        font = FONT_THIN; // Font from CfgFontFamilies
        fontBold = FONT_THIN; // Font from CfgFontFamilies
    };

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
};