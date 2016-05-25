class MARS_gui_ctrlControlsGroup: MARS_gui_ctrlDefault {
    type = CT_CONTROLS_GROUP;
    style = LB_TEXTURES;
    x = 0;
    y = 0;
    w = 1;
    h = 1;
    onCanDestroy = "";
    onDestroy = "";
    onMouseButtonDown = "";
    onMouseButtonUp = "";
    onMouseButtonClick = "";
    onMouseButtonDblClick = "";
    onMouseZChanged = "";
    onMouseMoving = "";
    onMouseHolding = "";

    class VScrollBar: ScrollBar {
        width = 2 * GRID_W;
        height = 0;
        autoScrollEnabled = 0;
        autoScrollDelay = 1;
        autoScrollRewind = 1;
        autoScrollSpeed = 1;
    };

    class HScrollBar: ScrollBar {
        width = 0;
        height = 2 * GRID_H;
    };
};

class MARS_gui_ctrlControlsGroupNoScrollbars: MARS_gui_ctrlControlsGroup {
    class VScrollbar: VScrollbar {
        width = 0;
    };

    class HScrollbar: HScrollbar {
        height = 0;
    };
};

class MARS_gui_ctrlControlsGroupNoHScrollbars: MARS_gui_ctrlControlsGroup {
    class HScrollbar: HScrollbar {
        height = 0;
    };
};

class MARS_gui_ctrlControlsGroupNoVScrollbars: MARS_gui_ctrlControlsGroup {
    class VScrollbar: VScrollbar {
        width = 0;
    };
};