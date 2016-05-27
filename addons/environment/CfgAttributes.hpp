class GVARMAIN(attributes) {
    class ADDON {
        class environment {
            displayName = CSTRING(Title);
            actionConfirm = "";
            actionCancel = "";
            class AttributeCategories {
                class DateTime {
                    class AttributeItem0 {
                        displayName = CSTRING(Date_Name);
                        tooltipText = CSTRING(Date_Tooltip);
                        class AttributeControls {
                            class Year {
                                condition = "true";
                                type = "COMBO";
                                values = "_years = []; for '_i' from 1982 to 2050 do {_years pushBack _i}; _years";
                                labels = "_years = []; for '_i' from 1982 to 2050 do {_years pushBack str _i}; _years";
                                selected = "date select 0";
                                expression = QUOTE([parseNumber(_this lbData (lbCurSel _this))] call FUNC(setDateTime));
                            };
                            class Month: Year {
                                values[] = {1,2,3,4,5,6,7,8,9,10,11,12};
                                labels[] = {"January","Febuary","March","April","May","June","July","August","September","October","November","December"};
                                selected = "date select 1";
                                expression = QUOTE([ARR_2(-1, parseNumber(_this lbData (lbCurSel _this)))] call FUNC(setDateTime));
                            };
                            class Day: Year {
                                values = "_days = []; for '_i' from 1 to 31 do {_days pushBack _i}; _days";
                                labels = "_days = []; for '_i' from 1 to 31 do {_days pushBack str _i}; _days";
                                selected = "date select 2";
                                expression = QUOTE([ARR_3(-1, -1, parseNumber(_this lbData (lbCurSel _this)))] call FUNC(setDateTime));
                            };
                        };
                    };
                    class AttributeItem1 {
                        displayName = CSTRING(Time_Hour_Name);
                        tooltipText = CSTRING(Time_Hour_Tooltip);
                        class AttributeControls {
                            class Hour {
                                condition = "true";
                                type = "SLIDER";
                                range[] = {0, 23};
                                step = 1;
                                position = "date select 3";
                                expression = QUOTE([ARR_4(-1, -1, -1, (sliderPosition _this))] call FUNC(setDateTime));
                                onSliderPosChanged = "_ctrl = _this select 0; _ctrl ctrlSetTooltip str(sliderPosition _ctrl)";
                            };
                        };
                    };
                    class AttributeItem2 {
                        displayName = CSTRING(Time_Min_Name);
                        tooltipText = CSTRING(Time_Min_Tooltip);
                        class AttributeControls {
                            class Minute {
                                condition = "true";
                                type = "SLIDER";
                                range[] = {0, 59};
                                step = 1;
                                position = "date select 4";
                                expression = QUOTE([ARR_5(-1, -1, -1, -1, (sliderPosition _this))] call FUNC(setDateTime));
                                onSliderPosChanged = "_ctrl = _this select 0; _ctrl ctrlSetTooltip str(sliderPosition _ctrl)";
                            };
                        };
                    };
                };
                class Weather {
                    class AttributeItem0 {
                        displayName = "Overcast";
                        tooltipText = "Change the overcast of the current running mission";
                        class AttributeControls {
                            class Start {
                                condition = "true";
                                type = "SLIDER";
                                range[] = {0, 1};
                                step = 0.1;
                                position = "overcast";
                                expression = QUOTE([(sliderPosition _this)] remoteExec [ARR_2(QUOTE(QFUNC(setOvercast)), REMOTE_GLOBAL)]);
                                onSliderPosChanged = "_ctrl = _this select 0; _ctrl ctrlSetTooltip str(sliderPosition _ctrl)";
                            };
                        };
                    };
                    class AttributeItem1 {
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
                    class AttributeItem2 {
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
                    class AttributeItem3 {
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
                class Fog {
                    class AttributeItem0 {
                        displayName = "Fog Value";
                        tooltipText = "Value for fog at base level";
                        class AttributeControls {
                            class Start {
                                condition = "true";
                                type = "SLIDER";
                                range[] = {0, 1};
                                step = 0.01;
                                position = "fogParams select 0";
                                expression = QUOTE([ARR_3((sliderPosition _this), -1, -1)] remoteExec [ARR_2(QUOTE(QFUNC(setFog)), REMOTE_SERVER)]);
                                onSliderPosChanged = "_ctrl = _this select 0; _ctrl ctrlSetTooltip str(sliderPosition _ctrl)";
                            };
                        };
                    };
                    class AttributeItem1 {
                        displayName = "Fog Decay";
                        tooltipText = "Decay of fog density with altitude";
                        class AttributeControls {
                            class Start {
                                condition = "true";
                                type = "SLIDER";
                                range[] = {0, 1};
                                step = 0.01;
                                position = "fogParams select 1";
                                expression = QUOTE([ARR_3(-1, (sliderPosition _this), -1)] remoteExec [ARR_2(QUOTE(QFUNC(setFog)), REMOTE_SERVER)]);
                                onSliderPosChanged = "_ctrl = _this select 0; _ctrl ctrlSetTooltip str(sliderPosition _ctrl)";
                            };
                        };
                    };
                    class AttributeItem2 {
                        displayName = "Fog Base";
                        tooltipText = "Base altitude of fog (in meters)";
                        class AttributeControls {
                            class Start {
                                condition = "true";
                                type = "SLIDER";
                                range[] = {0, 250};
                                step = 10;
                                position = "fogParams select 2";
                                expression = QUOTE([ARR_3(-1, -1, (sliderPosition _this))] remoteExec [ARR_2(QUOTE(QFUNC(setFog)), REMOTE_SERVER)]);
                                onSliderPosChanged = "_ctrl = _this select 0; _ctrl ctrlSetTooltip str(sliderPosition _ctrl)";
                            };
                        };
                    };
                };
            };
        };
    };
};
