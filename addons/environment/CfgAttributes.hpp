class GVARMAIN(attributes) {
    class ADDON {
        class environment {
            displayName = CSTRING(Title);
            actionConfirm = "";
            actionCancel = "";
            class AttributeCategories {
                class DateTime {
                    class AttributeItems {
                        class DateTest {
                            displayName = CSTRING(Date_Name);
                            tooltipText = CSTRING(Date_Tooltip);
                            class AttributeControls {
                                class Date {
                                    condition = "true";
                                    type = "DATE";
                                    year = "date select 0";
                                    month = "date select 1";
                                    day = "date select 2";
                                    expression = QFUNC(setDateTime);
                                };
                            };
                        };
                        class TimeHour {
                            displayName = CSTRING(Time_Hour_Name);
                            tooltipText = CSTRING(Time_Hour_Tooltip);
                            class AttributeControls {
                                class Hour {
                                    condition = "true";
                                    type = "SLIDER";
                                    range[] = {0, 23};
                                    step = 1;
                                    position = "date select 3";
                                    expression = QUOTE([ARR_4(-1, -1, -1, _this)] call FUNC(setDateTime));
                                    onSliderPosChanged = QUOTE(\
                                        _ctrl = _this select 0;\
                                        _value = round (sliderPosition _ctrl);\
                                        _ctrl ctrlSetTooltip (['0' + str _value, str _value] select (_value >= 10))\
                                    );
                                };
                            };
                        };
                        class TimeMinute {
                            displayName = CSTRING(Time_Min_Name);
                            tooltipText = CSTRING(Time_Min_Tooltip);
                            class AttributeControls {
                                class Minute {
                                    condition = "true";
                                    type = "SLIDER";
                                    range[] = {0, 59};
                                    step = 1;
                                    position = "date select 4";
                                    expression = QUOTE([ARR_5(-1, -1, -1, -1, _this)] call FUNC(setDateTime));
                                    onSliderPosChanged = QUOTE(\
                                        _ctrl = _this select 0;\
                                        _value = round (sliderPosition _ctrl);\
                                        _ctrl ctrlSetTooltip (['0' + str _value, str _value] select (_value >= 10))\
                                    );
                                };
                            };
                        };
                    };
                };
                class Weather {
                    class AttributeItems {
                        class Overcast {
                            displayName = "Overcast";
                            tooltipText = "Change the overcast of the current running mission";
                            class AttributeControls {
                                class Start {
                                    condition = "true";
                                    type = "SLIDER";
                                    range[] = {0, 1};
                                    step = 0.1;
                                    position = "overcast";
                                    expression = QUOTE([_this] remoteExec [ARR_2(QUOTE(QFUNC(setOvercast)), REMOTE_GLOBAL)]);
                                    onSliderPosChanged = QUOTE(_ctrl = _this select 0; _ctrl ctrlSetTooltip str([ARR_2(sliderPosition _ctrl, 2)] call EFUNC(common,roundToN)));
                                };
                            };
                        };
                        class Rain {
                            displayName = "Rain";
                            tooltipText = "Change the rain of the current running mission";
                            class AttributeControls {
                                class Start {
                                    condition = "true";
                                    type = "SLIDER";
                                    range[] = {0, 1};
                                    step = 0.1;
                                    position = "rain";
                                    expression = QUOTE([_this] call FUNC(setRain));
                                    onSliderPosChanged = QUOTE(_ctrl = _this select 0; _ctrl ctrlSetTooltip str([ARR_2(sliderPosition _ctrl, 2)] call EFUNC(common,roundToN)));
                                };
                            };
                        };
                        class Lightning {
                            displayName = "Lightning";
                            tooltipText = "Change the lightning of the current running mission";
                            class AttributeControls {
                                class Start {
                                    condition = "true";
                                    type = "SLIDER";
                                    range[] = {0, 1};
                                    step = 0.1;
                                    position = "lightnings";
                                    expression = QUOTE([_this] call FUNC(setLightning));
                                    onSliderPosChanged = QUOTE(_ctrl = _this select 0; _ctrl ctrlSetTooltip str([ARR_2(sliderPosition _ctrl, 2)] call EFUNC(common,roundToN)));
                                };
                            };
                        };
                        class Waves {
                            displayName = "Waves";
                            tooltipText = "Change the waves of the current running mission";
                            class AttributeControls {
                                class Start {
                                    condition = "true";
                                    type = "SLIDER";
                                    range[] = {0, 1};
                                    step = 0.1;
                                    position = "waves";
                                    expression = QUOTE([_this] call FUNC(setWaves));
                                    onSliderPosChanged = QUOTE(_ctrl = _this select 0; _ctrl ctrlSetTooltip str([ARR_2(sliderPosition _ctrl, 2)] call EFUNC(common,roundToN)));
                                };
                            };
                        };
                    };
                };
                class Fog {
                    class AttributeItems {
                        class FogValue {
                            displayName = "Fog Value";
                            tooltipText = "Value for fog at base level";
                            class AttributeControls {
                                class Start {
                                    condition = "true";
                                    type = "SLIDER";
                                    range[] = {0, 1};
                                    step = 0.01;
                                    position = "fogParams select 0";
                                    expression = QUOTE([ARR_3(_this, -1, -1)] remoteExec [ARR_2(QUOTE(QFUNC(setFog)), REMOTE_SERVER)]);
                                    onSliderPosChanged = QUOTE(_ctrl = _this select 0; _ctrl ctrlSetTooltip str([ARR_2(sliderPosition _ctrl, 2)] call EFUNC(common,roundToN)));
                                };
                            };
                        };
                        class FogDecay {
                            displayName = "Fog Decay";
                            tooltipText = "Decay of fog density with altitude";
                            class AttributeControls {
                                class Start {
                                    condition = "true";
                                    type = "SLIDER";
                                    range[] = {0, 1};
                                    step = 0.01;
                                    position = "fogParams select 1";
                                    expression = QUOTE([ARR_3(-1, _this, -1)] remoteExec [ARR_2(QUOTE(QFUNC(setFog)), REMOTE_SERVER)]);
                                    onSliderPosChanged = QUOTE(_ctrl = _this select 0; _ctrl ctrlSetTooltip str([ARR_2(sliderPosition _ctrl, 2)] call EFUNC(common,roundToN)));
                                };
                            };
                        };
                        class FogBase {
                            displayName = "Fog Base";
                            tooltipText = "Base altitude of fog (in meters)";
                            class AttributeControls {
                                class Start {
                                    condition = "true";
                                    type = "SLIDER";
                                    range[] = {0, 250};
                                    step = 10;
                                    position = "fogParams select 2";
                                    expression = QUOTE([ARR_3(-1, -1, _this)] remoteExec [ARR_2(QUOTE(QFUNC(setFog)), REMOTE_SERVER)]);
                                    onSliderPosChanged = "_ctrl = _this select 0; _ctrl ctrlSetTooltip str (floor (sliderPosition _ctrl))";
                                };
                            };
                        };
                    };
                };
            };
        };
    };
};
