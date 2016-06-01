class GVARMAIN(context) {
    class ADDON {
        class GVAR(attributes) {
            displayName = "Attributes";
            requiresPosition = false;
            condition = QUOTE('CAManBase' countType GVAR(selection) == count GVAR(selection));
            action = QUOTE([ARR_2('__objects', 'CAManBase')] call EFUNC(attributes,openAttributes));
            order = 100;
        };
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