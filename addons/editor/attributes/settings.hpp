class Settings_Editor {
    displayName = "Editor Settings";
    actionConfirm = "";
    actionCancel = QUOTE(\
        GVAR(camSlowDownInBuildings) = [ARR_2(QUOTE(QGVAR(camSlowDownInBuildings)), true)] call CFUNC(loadSetting);\
        GVAR(iconHoverSize) = [ARR_2(QUOTE(QGVAR(iconHoverSize)), ICON_HOVER_SIZE)] call CFUNC(loadSetting);\
        GVAR(iconDrawDistance) = [ARR_2(QUOTE(QGVAR(iconDrawDistance)), ICON_FADE_DISTANCE)] call CFUNC(loadSetting);\
    );
    class Camera {
        class Speed {
            displayName = "Movement speed";
            tooltipText = "Speed of the camera movement";
            class Speed {
                condition = "(true)";
                type = "SLIDER";
                range[] = {0, 10};
                step = 0.25;
                position = QGVAR(camSpeed);
                expression = QUOTE(\
                    GVAR(camSpeed) = _this;\
                    [ARR_2(QQGVAR(camSpeed), _this)] call CFUNC(saveSetting);\
                );
                onSliderPosChanged = QUOTE(\
                    _ctrl = _this select 0;\
                    _ctrl ctrlSetTooltip str([ARR_2(sliderPosition _ctrl, 2)] call CFUNC(roundToN));\
                );
            };
        };
        class Pan {
            displayName = "Pan speed";
            tooltipText = "Speed of the camera pan movement. Lower is faster, higher is slower.";
            class Speed {
                condition = "(true)";
                type = "SLIDER";
                range[] = {0, 5};
                step = 0.1;
                position = QGVAR(camPanSpeedCoef);
                expression = QUOTE(\
                    GVAR(camPanSpeedCoef) = _this;\
                    [ARR_2(QQGVAR(camPanSpeedCoef), _this)] call CFUNC(saveSetting);\
                );
                onSliderPosChanged = QUOTE(\
                    _ctrl = _this select 0;\
                    _ctrl ctrlSetTooltip str([ARR_2(sliderPosition _ctrl, 2)] call CFUNC(roundToN));\
                );
            };
        };
        class BuildingSpeed {
            displayName = "Adaptive speed";
            tooltipText = "";
            class Bool {
                condition = "(true)";
                type = "CHECKBOX";
                checked = QGVAR(camSlowDownInBuildings);
                textPlain = "Slow speed when inside buildings";
                expression = QUOTE(\
                    GVAR(camSlowDownInBuildings) = _this;\
                    [ARR_2(QQGVAR(camSlowDownInBuildings), _this)] call CFUNC(saveSetting);\
                );
            };
        };
        class LightIntensity {
            displayName = "Light Intensity";
            tooltipText = "Intensity of the camera light (toggled by L)";
            class EditNumber {
                condition = "(true)";
                type = "EDIT";
                textCode = QUOTE(str GVAR(camLightIntensity));
                expression = QUOTE(\
                    GVAR(camLightIntensity) = parseNumber _this;\
                    [ARR_2(QQGVAR(camLightIntensity), parseNumber _this)] call CFUNC(saveSetting);\
                    if (GVAR(camLightOn)) then {call FUNC(toggleLight);call FUNC(toggleLight)};\
                );
            };
        };
    };
    class Icons {
        class DrawDistance {
            displayName = "Icon draw distance";
            tooltipText = "Draw distance of icons";
            class Slider {
                condition = "(true)";
                type = "SLIDER";
                range[] = {500, 10000};
                step = 500;
                position = QGVAR(iconDrawDistance);
                expression = QUOTE(\
                    GVAR(iconDrawDistance) = _this;\
                    [ARR_2(QQGVAR(iconDrawDistance), _this)] call CFUNC(saveSetting);\
                );
                onSliderPosChanged = QUOTE(\
                    _ctrl = _this select 0;\
                    _pos = sliderPosition _ctrl;\
                    _ctrl ctrlSetTooltip format [ARR_2('%1m', round _pos)];\
                    GVAR(iconDrawDistance) = _pos;\
                );
            };
        };
        class HoverSize {
            displayName = "Icon hover scale";
            tooltipText = "Scale of icons when hovering over them";
            class Slider {
                condition = "(true)";
                type = "SLIDER";
                range[] = {1, 2.5};
                step = 0.1;
                position = QGVAR(iconHoverSize);
                expression = QUOTE(\
                    GVAR(iconHoverSize) = _this;\
                    [ARR_2(QQGVAR(iconHoverSize), _this)] call CFUNC(saveSetting);\
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
