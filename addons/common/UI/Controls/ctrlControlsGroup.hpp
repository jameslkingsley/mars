class MARS_gui_ctrlControlsGroup: MARS_gui_ctrlDefault
{
	type = CT_CONTROLS_GROUP; // Type
	style = LB_TEXTURES; // Style

	x = 0; // Horizontal coordinates
	y = 0; // Vertical coordinates
	w = 1; // Width
	h = 1; // Height

	//class Controls{};

	// Scrollbar configuration (applied only when LB_TEXTURES style is used)
	class VScrollBar: ScrollBar
	{
		width = 2 * GRID_W; // Width
		height = 0; // Height

		autoScrollEnabled = 0; // 1 to enable automatic scrolling
		autoScrollDelay = 1; // Time after autoscroll is initiated
		autoScrollRewind = 1; // Repeat the autoscroll once it's finished
		autoScrollSpeed = 1; // Autoscroll speed
	};
	class HScrollBar: ScrollBar
	{
		width = 0; // Width
		height = 2 * GRID_H; // Height
	};

	onCanDestroy = "";
	onDestroy = "";
	onMouseButtonDown = "";
	onMouseButtonUp = "";
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	onMouseZChanged = "";
	onMouseMoving = "";
	onMouseHolding = "";
};

class MARS_gui_ctrlControlsGroupNoScrollbars: MARS_gui_ctrlControlsGroup
{
	class VScrollbar: VScrollbar	{width = 0;};
	class HScrollbar: HScrollbar	{height = 0;};
};
class MARS_gui_ctrlControlsGroupNoHScrollbars: MARS_gui_ctrlControlsGroup
{
	class HScrollbar: HScrollbar	{height = 0;};
};
class MARS_gui_ctrlControlsGroupNoVScrollbars: MARS_gui_ctrlControlsGroup
{
	class VScrollbar: VScrollbar	{width = 0;};
};