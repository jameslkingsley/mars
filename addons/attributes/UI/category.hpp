class GVAR(AttributeCategory): MARS_gui_ctrlControlsGroupNoScrollbars {
    y = 2 * pixelH;
    w = (WINDOW_EDITATTRIBUTES_W - 1) * GRID_W;
    class Controls {
        class Title: MARS_gui_ctrlButtonStatic {
            idc = IDC_EDITATTRIBUTES_CATEGORIES_TITLE;
            x = 0 * GRID_W;
            y = pixelH;
            w = (WINDOW_EDITATTRIBUTES_W - SIZE_M) * GRID_W;
            h = SIZE_M * GRID_H;
        };
        class Attributes: MARS_gui_ctrlControlsGroupNoScrollbars {
            idc = IDC_EDITATTRIBUTES_CATEGORIES_ITEMS;
            y = SIZE_S * GRID_H + 4 * pixelH;
            w = (WINDOW_EDITATTRIBUTES_W - 5) * GRID_W;
            class Controls {};
        };
    };
};