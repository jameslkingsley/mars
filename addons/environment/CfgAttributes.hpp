class GVARMAIN(attributes) {
    class ADDON {
        class environment {
            displayName = "Environment";
            actionConfirm = "";
            actionCancel = "";
            class AttributeCategories {
                class DateTime {
                    displayName = "Date/Time";
                    tooltipText = "This is where you change the date and time";
                    class AttributeItem0 {
                        displayName = "Date";
                        tooltipText = "This is where you change the date";
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
                        tooltipText = "";
                        class AttributeControls {
                            class Time {
                                condition = "true";
                                type = "SLIDER";
                                range[] = {0, 24};
                                step = 1;
                                position = "date select 3";
                                expression = "";
                                onSliderPosChanged = "systemChat str _this";
                            };
                        };
                    };
                };
                class Overcast {
                    displayName = "Overcast";
                    tooltipText = "This is where you change the overcast";
                    class AttributeItem0 {
                        displayName = "Start";
                        tooltipText = "";
                        class AttributeControls {
                            class Start {
                                condition = "true";
                                type = "SLIDER";
                                range[] = {0, 1};
                                step = 0.1;
                                position = 0.5;
                                expression = "";
                                onSliderPosChanged = "systemChat str _this";
                            };
                        };
                    };
                    class AttributeItem1 {
                        displayName = "End";
                        tooltipText = "";
                        class AttributeControls {
                            class End {
                                condition = "true";
                                type = "SLIDER";
                                range[] = {0, 1};
                                step = 0.1;
                                position = 0.5;
                                expression = "";
                                onSliderPosChanged = "systemChat str _this";
                            };
                        };
                    };
                };
                class Fog {
                    displayName = "Fog";
                    tooltipText = "This is where you change the fog";
                    class AttributeItem0 {
                        displayName = "Start";
                        tooltipText = "";
                        class AttributeControls {
                            class Start {
                                condition = "true";
                                type = "SLIDER";
                                range[] = {0, 1};
                                step = 0.1;
                                position = 0.5;
                                expression = "";
                                onSliderPosChanged = "systemChat str _this";
                            };
                        };
                    };
                    class AttributeItem1 {
                        displayName = "End";
                        tooltipText = "";
                        class AttributeControls {
                            class End {
                                condition = "true";
                                type = "SLIDER";
                                range[] = {0, 1};
                                step = 0.1;
                                position = 0.5;
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
