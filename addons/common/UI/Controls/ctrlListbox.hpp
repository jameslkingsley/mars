class MARS_gui_ctrlListbox: MARS_gui_ctrlDefaultText
{
	type = CT_LISTBOX; // Type
	style = ST_LEFT + LB_TEXTURES; // Style

	colorBackground[] = {COLOR_OVERLAY_RGBA}; // Fill color
	colorSelectBackground[] = {COLOR_ACTIVE_RGBA}; // Selected item fill color
	colorSelectBackground2[] = {COLOR_ACTIVE_RGBA}; // Selected item fill color (oscillates between this and colorSelectBackground)
	colorShadow[] = {0,0,0,0.5}; // Text shadow color (used only when shadow is 1)
	colorDisabled[] = {COLOR_TEXT_RGB,0.25}; // Disabled text color

	colorText[] = {COLOR_TEXT_RGBA}; // Text and frame color
	colorSelect[] = {1,1,1,1}; // Text selection color
	colorSelect2[] = {1,1,1,1}; // Text selection color (oscillates between this and colorSelect)

	colorTextRight[] = {COLOR_TEXT_RGBA}; // Right text and frame color
	colorSelectRight[] = {1,1,1,1}; // Right text selection color
	colorSelect2Right[] = {1,1,1,1}; // Right text selection color (oscillates between this and colorSelect)

	colorPicture[] = {1,1,1,1}; // Picture color
	colorPictureSelected[] = {1,1,1,1}; // Selected picture color
	colorPictureDisabled[] = {1,1,1,0.25}; // Disabled picture color

	colorPictureRight[] = {1,1,1,1}; // Right picture color
	colorPictureRightSelected[] = {1,1,1,1}; // Selected right picture color
	colorPictureRightDisabled[] = {1,1,1,0.25}; // Disabled right picture color

	period = 1; // Oscillation time between colorSelect/colorSelectBackground2 and colorSelect2/colorSelectBackground when selected

	rowHeight = SIZEEX_PURISTA(SIZEEX_M); // Row height
	itemSpacing = 0; // Height of empty space between items
	maxHistoryDelay = 1; // Time since last keyboard type search to reset it
	canDrag = 0; // 1 (true) to allow item dragging

	soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1}; // Sound played when an item is selected

	// Scrollbar configuration (applied only when LB_TEXTURES style is used)
	class ListScrollBar: ScrollBar{};

	onCanDestroy = "";
	onDestroy = "";
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

	onLBSelChanged = "";
	onLBDblClick = "";
	onLBDrag = "";
	onLBDragging = "";
	onLBDrop = "";
};