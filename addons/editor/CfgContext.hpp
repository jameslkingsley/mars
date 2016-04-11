class GVARMAIN(Context) {
    class ADDON {
        class GVAR(debug) {
            displayName = "Debug";
            requiresPosition = false;
            condition = "true";
            action = "";
            class GVAR(logSelection) {
                displayName = "Log Selection to RPT";
                requiresPosition = false;
                condition = "true";
                action = QUOTE(_this call FUNC(logSelection));
            };
        };
    };
};