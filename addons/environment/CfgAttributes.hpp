class GVARMAIN(attributes) {
    class ADDON {
        class environment {
            displayName = "Environment";
            actionConfirm = "";
            actionCancel = "";
            class AttributeCategories {
                class DateTime {
                    class AttributeItem0 {
                        displayName = "Date";
                        tooltipText = "Change the date of the current running mission";
                        class AttributeControls {
                            class Year {
                                condition = "true";
                                type = "COMBO";
                                values = "_years = []; for '_i' from 1982 to 2050 do {_years pushBack _i}; _years";
                                labels = "_years = []; for '_i' from 1982 to 2050 do {_years pushBack str _i}; _years";
                                selected = "date select 0";
                                expression = "";
                                onLBSelChanged = "systemChat str _this";
                            };
                            class Month: Year {
                                values[] = {1,2,3,4,5,6,7,8,9,10,11,12};
                                labels[] = {"January","Febuary","March","April","May","June","July","August","September","October","November","December"};
                                selected = "date select 1";
                            };
                            class Day: Year {
                                values = "_days = []; for '_i' from 1 to 31 do {_days pushBack _i}; _days";
                                labels = "_days = []; for '_i' from 1 to 31 do {_days pushBack str _i}; _days";
                                selected = "date select 2";
                            };
                        };
                    };
                    class AttributeItem1 {
                        displayName = "Time";
                        tooltipText = "Change the time of the current running mission";
                        class AttributeControls {
                            class Time {
                                condition = "true";
                                type = "SLIDER";
                                range[] = {0, 23};
                                step = 1;
                                position = "date select 3";
                                expression = "";
                                onSliderPosChanged = "systemChat str _this";
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
                                expression = "";
                                onSliderPosChanged = "systemChat str _this";
                            };
                        };
                    };
                    class AttributeItem1 {
                        displayName = "Fog";
                        tooltipText = "Change the fog of the current running mission";
                        class AttributeControls {
                            class Start {
                                condition = "true";
                                type = "SLIDER";
                                range[] = {0, 1};
                                step = 0.1;
                                position = "fog";
                                expression = "";
                                onSliderPosChanged = "systemChat str _this";
                            };
                        };
                    };
                    class AttributeItem2 {
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
                                onSliderPosChanged = "systemChat str _this";
                            };
                        };
                    };
                    class AttributeItem3 {
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
                                onSliderPosChanged = "systemChat str _this";
                            };
                        };
                    };
                    class AttributeItem4 {
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
                                onSliderPosChanged = "systemChat str _this";
                            };
                        };
                    };
                };
            };
        };
    };
};
