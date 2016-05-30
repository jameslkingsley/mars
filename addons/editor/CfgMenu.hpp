class GVARMAIN(menu) {
    class ADDON {
        class mission {
            displayName = "Mission";
            class clear_map {
                displayName = "Clear Map";
                action = "hint 'Clear Map'";
            };
            class end_scenario {
                displayName = "End Scenario";
                action = "hint 'End Scenario'";
            };
        };
        class settings {
            displayName = "Settings";
            class camera {
                displayName = "Camera";
                action = QUOTE([ARR_2(QUOTE(QUOTE(ADDON)), 'settings_camera')] call EFUNC(attributes,openAttributes));
            };
        };
    };
};
