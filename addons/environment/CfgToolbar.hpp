class GVARMAIN(toolbar) {
    class ADDON {
        class environment {
            displayName = "Environment";
            class datetime {
                displayName = "Date/Time";
                action = QUOTE([] call FUNC(openDateTime));
            };
            class weather {
                displayName = "Weather";
                action = QUOTE([] call FUNC(openWeather));
            };
            class fog {
                displayName = "Fog";
                action = QUOTE([] call FUNC(openFog));
            };
            class time_multiplier {
                displayName = "Time Multiplier";
                action = QUOTE([] call FUNC(openTimeMultiplier));
            };
        };
    };
};
