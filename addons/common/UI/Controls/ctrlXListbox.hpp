class MARS_gui_ctrlXListbox: MARS_gui_ctrlDefaultText
{
	type = CT_XLISTBOX; // Type
	style = SL_HORZ + ST_CENTER + LB_TEXTURES; // Style

	color[] = {1,1,1,1}; // Arrow color
	colorActive[] = {COLOR_ACTIVE_RGBA}; // Selected arrow color

	colorText[] = {COLOR_TEXT_RGBA}; // Text color
	colorSelect[] = {COLOR_ACTIVE_RGBA}; // Selected text color
	colorDisabled[] = {COLOR_TEXT_RGB,0.25}; // Disabled text color

	colorPicture[] = {1,1,1,1}; // Picture color

	cycle = 1; // Allow cycling (the first item follows the last)

	arrowEmpty = "\a3\3DEN\Data\Controls\CtrlXSlider\arrowEmpty_ca.paa"; // Arrow
	arrowFull = "\a3\3DEN\Data\Controls\CtrlXSlider\arrowFull_ca.paa"; // Arrow when clicked on
	border = "\a3\3DEN\Data\Controls\CtrlXSlider\border_ca.paa"; // Slider background (stretched vertically)

	soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1}; // Sound played when an item is selected

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
};