class MARS_gui_ctrlCombo: MARS_gui_ctrlDefaultText
{
	type = CT_COMBO; // Type
	style = ST_LEFT + LB_TEXTURES + ST_NO_RECT; // Style

	colorBackground[] = {0.05,0.05,0.05,1}; // Fill color
	colorSelectBackground[] = {COLOR_ACTIVE_RGBA}; // Selected item fill color

	colorText[] = {COLOR_TEXT_RGBA}; // Text and frame color
	colorDisabled[] = {COLOR_TEXT_RGB,0.25}; // Disabled text color
	colorSelect[] = {0,0,0,1}; // Text selection color

	colorTextRight[] = {1,1,1,1}; //Color of text on the right when item is unselected
	colorSelectRight[] = {1,1,1,0.25}; //First color of text on the right when item is selected
	colorSelect2Right[] = {1,1,1,1}; //Second color of text on the right when item is selected

	colorPicture[] = {1,1,1,1}; // Picture color
	colorPictureSelected[] = {1,1,1,1}; // Selected picture color
	colorPictureDisabled[] = {1,1,1,0.25}; // Disabled picture color

	colorPictureRight[] = {1,1,1,1}; //Color of picture on the right when item is unselected
	colorPictureRightSelected[] = {1,1,1,1}; //Color of picture on the right when item is selected
	colorPictureRightDisabled[] = {1,1,1,0.25}; //Color of picture on the right when ListBox is disabled

	arrowEmpty = "\a3\3DEN\Data\Controls\ctrlCombo\arrowEmpty_ca.paa"; // Expand arrow
	arrowFull = "\a3\3DEN\Data\Controls\ctrlCombo\arrowFull_ca.paa"; // Collapse arrow

	wholeHeight = 10 * SIZE_M * GRID_H; // Maximum height of expanded box (including the control height)
	maxHistoryDelay = 1; // Time since last keyboard type search to reset it

	soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1}; // Sound played when the list is expanded
	soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1}; // Sound played when the list is collapsed
	soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1}; // Sound played when an item is selected

	// Scrollbar configuration (applied only when LB_TEXTURES style is used)
	class ComboScrollBar
	{
		width = 0; // Unknown?
		height = 0; // Unknown?
		scrollSpeed = 0.01; // Unknown?

		arrowEmpty = "\a3\3DEN\Data\Controls\ctrlDefault\arrowEmpty_ca.paa"; // Arrow
		arrowFull = "\a3\3DEN\Data\Controls\ctrlDefault\arrowFull_ca.paa"; // Arrow when clicked on
		border = "\a3\3DEN\Data\Controls\ctrlDefault\border_ca.paa"; // Slider background (stretched vertically)
		thumb = "\a3\3DEN\Data\Controls\ctrlDefault\thumb_ca.paa"; // Dragging element (stretched vertically)

		color[] = {1,1,1,1}; // Scrollbar color
	};

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
};
class MARS_gui_ctrlComboToolbar: MARS_gui_ctrlCombo
{
	colorBackground[] = {0.05,0.05,0.05,1}; // Fill color
	colorSelectBackground[] = {COLOR_ACTIVE_RGBA}; // Selected item fill color
	arrowEmpty = "\a3\3DEN\Data\Controls\ctrlCombo\arrowEmptyToolbar_ca.paa";
	arrowFull = "\a3\3DEN\Data\Controls\ctrlCombo\arrowEmptyToolbar_ca.paa";
	wholeHeight = 12 * SIZE_M * GRID_H;
};