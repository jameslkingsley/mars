class GVARMAIN(attributes) {
    class ADDON {
        class settings_editor {
            displayName = "Editor Settings";
            actionConfirm = "";
            actionCancel = QUOTE(\
                GVAR(freeCamera) camSetFov GVAR(camZoom);\
                GVAR(camSlowDownInBuildings) = [ARR_2(QUOTE(QGVAR(camSlowDownInBuildings)), true)] call CFUNC(loadSetting);\
                GVAR(iconHoverSize) = [ARR_2(QUOTE(QGVAR(iconHoverSize)), ICON_HOVER_SIZE)] call CFUNC(loadSetting);\
                GVAR(iconDrawDistance) = [ARR_2(QUOTE(QGVAR(iconDrawDistance)), ICON_FADE_DISTANCE)] call CFUNC(loadSetting);\
            );
            class AttributeCategories {
                class Camera {
                    class AttributeItems {
                        class Speed {
                            displayName = "Camera speed";
                            tooltipText = "Speed of the camera movement";
                            class AttributeControls {
                                class Speed {
                                    condition = "(true)";
                                    type = "SLIDER";
                                    range[] = {0.1, 10};
                                    step = 1;
                                    position = QGVAR(camSpeed);
                                    expression = QUOTE(\
                                        GVAR(camSpeed) = _this;\
                                        [ARR_2(QUOTE(QGVAR(camSpeed)), _this)] call CFUNC(saveSetting)\
                                    );
                                    onSliderPosChanged = QUOTE(\
                                        _ctrl = _this select 0;\
                                        _ctrl ctrlSetTooltip str([ARR_2(sliderPosition _ctrl, 2)] call CFUNC(roundToN));\
                                        GVAR(camSpeed) = sliderPosition _ctrl;\
                                    );
                                };
                            };
                        };
                        class Zoom {
                            displayName = "Camera zoom";
                            tooltipText = "Field of view of the camera";
                            class AttributeControls {
                                class Zoom {
                                    condition = "(true)";
                                    type = "SLIDER";
                                    range[] = {0.01, 2};
                                    step = 0.01;
                                    position = QGVAR(camZoom);
                                    expression = QUOTE(\
                                        GVAR(camZoom) = _this;\
                                        GVAR(freeCamera) camSetFov _this;\
                                        [ARR_2(QUOTE(QGVAR(camZoom)), _this)] call CFUNC(saveSetting)\
                                    );
                                    onSliderPosChanged = QUOTE(\
                                        _ctrl = _this select 0;\
                                        _ctrl ctrlSetTooltip str([ARR_2(sliderPosition _ctrl, 2)] call CFUNC(roundToN));\
                                        GVAR(freeCamera) camSetFov (sliderPosition _ctrl);\
                                    );
                                };
                            };
                        };
                        class BuildingSpeed {
                            displayName = "Camera indoors";
                            tooltipText = "";
                            class AttributeControls {
                                class Bool {
                                    condition = "(true)";
                                    type = "CHECKBOX";
                                    checked = QGVAR(camSlowDownInBuildings);
                                    textPlain = "Slow speed when inside buildings";
                                    expression = QUOTE(\
                                        GVAR(camSlowDownInBuildings) = _this;\
                                        [ARR_2(QUOTE(QGVAR(camSlowDownInBuildings)), _this)] call CFUNC(saveSetting);\
                                    );
                                };
                            };
                        };
                    };
                };
                class Icons {
                    class AttributeItems {
                        class DrawDistance {
                            displayName = "Icon draw distance";
                            tooltipText = "Draw distance of icons (larger distance will reduce FPS)";
                            class AttributeControls {
                                class Slider {
                                    condition = "(true)";
                                    type = "SLIDER";
                                    range[] = {500, 10000};
                                    step = 500;
                                    position = QGVAR(iconDrawDistance);
                                    expression = QUOTE(\
                                        GVAR(iconDrawDistance) = _this;\
                                        [ARR_2(QUOTE(QGVAR(iconDrawDistance)), _this)] call CFUNC(saveSetting)\
                                    );
                                    onSliderPosChanged = QUOTE(\
                                        _ctrl = _this select 0;\
                                        _pos = sliderPosition _ctrl;\
                                        _ctrl ctrlSetTooltip format [ARR_2('%1m', round _pos)];\
                                        GVAR(iconDrawDistance) = _pos;\
                                    );
                                };
                            };
                        };
                        class HoverSize {
                            displayName = "Icon hover scale";
                            tooltipText = "Scale of group icons when hovering over them";
                            class AttributeControls {
                                class Slider {
                                    condition = "(true)";
                                    type = "SLIDER";
                                    range[] = {1, 2.5};
                                    step = 0.1;
                                    position = QGVAR(iconHoverSize);
                                    expression = QUOTE(\
                                        GVAR(iconHoverSize) = _this;\
                                        [ARR_2(QUOTE(QGVAR(iconHoverSize)), _this)] call CFUNC(saveSetting)\
                                    );
                                    onSliderPosChanged = QUOTE(\
                                        _ctrl = _this select 0;\
                                        _pos = sliderPosition _ctrl;\
                                        _ctrl ctrlSetTooltip format [ARR_3('%1%2', round (_pos * 100), '%')];\
                                        GVAR(iconHoverSize) = _pos;\
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