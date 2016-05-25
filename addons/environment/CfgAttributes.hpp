class GVARMAIN(attributes) {
    class ADDON {
        class environment {
            displayName = "Environment";
            actionConfirm = "";
            actionCancel = "";
            class AttributeCategories {
                class Date {
                    displayName = "Date";
                    tooltipText = "This is where you change the date.";
                    class Year {
                        displayName = "Year";
                        tooltipText = "";
                        condition = "true";
                        type = "COMBO";
                        values = "_years = []; for '_i' from 1982 to 2050 do {_years pushBack _i}; _years";
                        labels = "_years = []; for '_i' from 1982 to 2050 do {_years pushBack str _i}; _years";
                        selected = "date select 0";
                        expression = "";
                    };
                    class Month: Year {
                        displayName = "Month";
                        values[] = {1,2,3,4,5,6,7,8,9,10,11,12};
                        labels[] = {"January","Febuary","March","April","May","June","July","August","September","October","November","December"};
                        selected = "date select 1";
                    };
                    class Day: Year {
                        displayName = "Day";
                        values = "_days = []; for '_i' from 1 to 31 do {_days pushBack _i}; _days";
                        labels = "_days = []; for '_i' from 1 to 31 do {_days pushBack str _i}; _days";
                        selected = "date select 2";
                    };
                };
            };
        };
    };
};
