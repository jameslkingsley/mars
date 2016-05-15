class MARS_gui_ctrlProgress: MARS_gui_ctrlDefault
{
	type = CT_PROGRESS; // Type

	texture = "#(argb,8,8,3)color(1,1,1,1)"; // Bar texture
	colorBar[] = {1,1,1,1}; // Bar color
	colorFrame[] = {0,0,0,1}; // Frame color

	onCanDestroy = "";
	onDestroy = "";
};