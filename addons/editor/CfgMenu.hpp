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
                displayName = "Editor";
                action = QUOTE([] call FUNC(openEditorSettings));
            };
        };
    };
};
