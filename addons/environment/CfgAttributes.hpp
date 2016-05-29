class GVARMAIN(attributes) {
    class ADDON {
        class environment {
            displayName = CSTRING(Title);
            actionConfirm = "";
            actionCancel = "";
            class AttributeCategories {
                class DateTime {
                    class AttributeItems {
                        class Date {
                            displayName = CSTRING(Date_Name);
                            tooltipText = CSTRING(Date_Tooltip);
                            class AttributeControls {
                                class Year {
                                    condition = "true";
                                    type = "COMBO";
                                    values = "_years = []; for '_i' from 1900 to 2050 do {_years pushBack _i}; _years";
                                    labels = "_years = []; for '_i' from 1900 to 2050 do {_years pushBack str _i}; _years";
                                    selected = "date select 0";
                                    expression = QUOTE([(_this select 1)] call FUNC(setDateTime));
                                };
                                class Month: Year {
                                    values[] = {1,2,3,4,5,6,7,8,9,10,11,12};
                                    labels[] = {"January","Febuary","March","April","May","June","July","August","September","October","November","December"};
                                    selected = "date select 1";
                                    expression = QUOTE([ARR_2(-1, (_this select 1))] call FUNC(setDateTime));
                                };
                                class Day: Year {
                                    values = "_days = []; for '_i' from 1 to 31 do {_days pushBack _i}; _days";
                                    labels = "_days = []; for '_i' from 1 to 31 do {_days pushBack str _i}; _days";
                                    selected = "date select 2";
                                    expression = QUOTE([ARR_3(-1, -1, (_this select 1))] call FUNC(setDateTime));
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
                                    expression = QUOTE([ARR_4(-1, -1, -1, (_this select 0))] call FUNC(setDateTime));
                                    onSliderPosChanged = "_ctrl = _this select 0; _ctrl ctrlSetTooltip str(sliderPosition _ctrl)";
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
                                    expression = QUOTE([ARR_5(-1, -1, -1, -1, (_this select 0))] call FUNC(setDateTime));
                                    onSliderPosChanged = "_ctrl = _this select 0; _ctrl ctrlSetTooltip str(sliderPosition _ctrl)";
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
                                    expression = QUOTE([(_this select 0)] remoteExec [ARR_2(QUOTE(QFUNC(setOvercast)), REMOTE_GLOBAL)]);
                                    onSliderPosChanged = "_ctrl = _this select 0; _ctrl ctrlSetTooltip str(sliderPosition _ctrl)";
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
                                    expression = "";
                                    onSliderPosChanged = "_ctrl = _this select 0; _ctrl ctrlSetTooltip str(sliderPosition _ctrl)";
                                };
                            };
                        };
                        class Test0 {
                            displayName = "Test 0";
                            tooltipText = "";
                            class AttributeControls {
                                class Test {
                                    condition = "true";
                                    type = "EDIT";
                                    textPlain = "Placeholder";
                                    rows = 1;
                                    expression = "";
                                };
                            };
                        };
                        class Test1 {
                            displayName = "Test 1";
                            tooltipText = "";
                            class AttributeControls {
                                class Test {
                                    condition = "true";
                                    type = "EDIT";
                                    textPlain = "Placeholder";
                                    rows = 5;
                                    expression = "";
                                };
                            };
                        };
                        class Test2 {
                            displayName = "Test 2";
                            tooltipText = "";
                            class AttributeControls {
                                class Test {
                                    condition = "true";
                                    type = "EDIT";
                                    textPlain = "Placeholder";
                                    rows = 10;
                                    expression = "";
                                };
                            };
                        };
                        class Test3 {
                            displayName = "Test 3";
                            tooltipText = "";
                            class AttributeControls {
                                class Test {
                                    condition = "true";
                                    type = "EDIT";
                                    textPlain = "Placeholder";
                                    rows = 1;
                                    expression = "";
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
                                    expression = "";
                                    onSliderPosChanged = "_ctrl = _this select 0; _ctrl ctrlSetTooltip str(sliderPosition _ctrl)";
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
                                    expression = "";
                                    onSliderPosChanged = "_ctrl = _this select 0; _ctrl ctrlSetTooltip str(sliderPosition _ctrl)";
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
                                    expression = QUOTE([ARR_3((_this select 0), -1, -1)] remoteExec [ARR_2(QUOTE(QFUNC(setFog)), REMOTE_SERVER)]);
                                    onSliderPosChanged = "_ctrl = _this select 0; _ctrl ctrlSetTooltip str(sliderPosition _ctrl)";
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
                                    expression = QUOTE([ARR_3(-1, (_this select 0), -1)] remoteExec [ARR_2(QUOTE(QFUNC(setFog)), REMOTE_SERVER)]);
                                    onSliderPosChanged = "_ctrl = _this select 0; _ctrl ctrlSetTooltip str(sliderPosition _ctrl)";
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
                                    expression = QUOTE([ARR_3(-1, -1, (_this select 0))] remoteExec [ARR_2(QUOTE(QFUNC(setFog)), REMOTE_SERVER)]);
                                    onSliderPosChanged = "_ctrl = _this select 0; _ctrl ctrlSetTooltip str(sliderPosition _ctrl)";
                                };
                            };
                        };
                    };
                };
            };
        };
    };
};
