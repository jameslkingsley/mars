class MARS_gui_ctrlCombo: MARS_gui_ctrlDefaultText {
    type = CT_COMBO;
    style = ST_LEFT + LB_TEXTURES + ST_NO_RECT;
    colorBackground[] = {0.05,0.05,0.05,1};
    colorSelectBackground[] = {COLOR_ACTIVE_RGBA};
    colorText[] = {COLOR_TEXT_RGBA};
    colorDisabled[] = {COLOR_TEXT_RGB,0.25};
    colorSelect[] = {0,0,0,1};
    colorTextRight[] = {1,1,1,1};
    colorSelectRight[] = {1,1,1,0.25};
    colorSelect2Right[] = {1,1,1,1};
    colorPicture[] = {1,1,1,1};
    colorPictureSelected[] = {1,1,1,1};
    colorPictureDisabled[] = {1,1,1,0.25};
    colorPictureRight[] = {1,1,1,1};
    colorPictureRightSelected[] = {1,1,1,1};
    colorPictureRightDisabled[] = {1,1,1,0.25};
    arrowEmpty = "\a3\3DEN\Data\Controls\ctrlCombo\arrowEmpty_ca.paa";
    arrowFull = "\a3\3DEN\Data\Controls\ctrlCombo\arrowFull_ca.paa";
    wholeHeight = 10 * SIZE_M * GRID_H;
    maxHistoryDelay = 1;
    soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
    soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
    soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
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

    class ComboScrollBar {
        width = 0;
        height = 0;
        scrollSpeed = 0.01;
        arrowEmpty = "\a3\3DEN\Data\Controls\ctrlDefault\arrowEmpty_ca.paa";
        arrowFull = "\a3\3DEN\Data\Controls\ctrlDefault\arrowFull_ca.paa";
        border = "\a3\3DEN\Data\Controls\ctrlDefault\border_ca.paa";
        thumb = "\a3\3DEN\Data\Controls\ctrlDefault\thumb_ca.paa";
        color[] = {1,1,1,1};
    };
};

class MARS_gui_ctrlComboToolbar: MARS_gui_ctrlCombo {
    colorBackground[] = {0.05,0.05,0.05,1};
    colorSelectBackground[] = {COLOR_ACTIVE_RGBA};
    arrowEmpty = "\a3\3DEN\Data\Controls\ctrlCombo\arrowEmptyToolbar_ca.paa";
    arrowFull = "\a3\3DEN\Data\Controls\ctrlCombo\arrowEmptyToolbar_ca.paa";
    wholeHeight = 12 * SIZE_M * GRID_H;
};