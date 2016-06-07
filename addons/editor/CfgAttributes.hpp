class GVARMAIN(attributes) {
    class ADDON {
        class settings_camera {
            displayName = "Camera Settings";
            actionConfirm = "";
            actionCancel = QUOTE(GVAR(freeCamera) camSetFov GVAR(camZoom));
            class AttributeCategories {
                class Main {
                    class AttributeItems {
                        class Speed {
                            displayName = "Speed";
                            tooltipText = "Speed of the camera movement";
                            class AttributeControls {
                                class Speed {
                                    condition = "true";
                                    type = "SLIDER";
                                    range[] = {0.1, 25};
                                    step = 1;
                                    position = QUOTE(GVAR(camSpeed));
                                    expression = QUOTE(\
                                        GVAR(camSpeed) = _this;\
                                        [ARR_2(QUOTE(QGVAR(camSpeed)), _this)] call EFUNC(common,saveSetting)\
                                    );
                                    onSliderPosChanged = QUOTE(\
                                        _ctrl = _this select 0;\
                                        _ctrl ctrlSetTooltip str([ARR_2(sliderPosition _ctrl, 2)] call EFUNC(common,roundToN));\
                                        GVAR(camSpeed) = sliderPosition _ctrl;\
                                    );
                                };
                            };
                        };
                        class Zoom {
                            displayName = "Zoom";
                            tooltipText = "Field of view of the camera";
                            class AttributeControls {
                                class Zoom {
                                    condition = "true";
                                    type = "SLIDER";
                                    range[] = {0.01, 2};
                                    step = 0.01;
                                    position = QUOTE(GVAR(camZoom));
                                    expression = QUOTE(\
                                        GVAR(camZoom) = _this;\
                                        GVAR(freeCamera) camSetFov _this;\
                                        [ARR_2(QUOTE(QGVAR(camZoom)), -_this)] call EFUNC(common,saveSetting)\
                                    );
                                    onSliderPosChanged = QUOTE(\
                                        _ctrl = _this select 0;\
                                        _ctrl ctrlSetTooltip str([ARR_2(sliderPosition _ctrl, 2)] call EFUNC(common,roundToN));\
                                        GVAR(freeCamera) camSetFov (sliderPosition _ctrl);\
                                    );
                                };
                            };
                        };
                    };
                };
            };
        };
    };
};