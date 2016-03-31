class MARS_Context {
    class ADDON {
        class GVAR(patrolArea) {
            displayName = "Patrol Area";
            requiresPosition = false;
            condition = "alive _this";
            action = QUOTE(_this call FUNC(patrolArea));
        };
        class GVAR(fleeArea) {
            displayName = "Flee Area";
            requiresPosition = false;
            condition = "alive _this";
            action = QUOTE(_this call FUNC(fleeArea));
        };
        class GVAR(air) {
            displayName = "Air";
            requiresPosition = false;
            condition = "_this isKindOf 'Air'";
            action = "";
            class GVAR(air_orbit) {
                displayName = "Orbit";
                requiresPosition = false;
                condition = "true";
                action = "";
                /*class GVAR(air_orbit_close) {
                    displayName = "Close (500m)";
                    requiresPosition = true;
                    condition = "true";
                    action = QUOTE(_this call FUNC(orbitArea));
                };*/
            };
        };
    };
};