class GVARMAIN(context) {
    class ADDON {
        class GVAR(debug) {
            displayName = "Debug";
            requiresPosition = false;
            condition = "true";
            class GVAR(logSelection) {
                displayName = "Log Selection to RPT";
                requiresPosition = false;
                condition = "true";
                action = QUOTE(_this call FUNC(logSelection));
            };
        };
    };
};