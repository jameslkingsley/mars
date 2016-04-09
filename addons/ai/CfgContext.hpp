class GVARMAIN(Context) {
    class ADDON {
        class GVAR(infantry) {
            displayName = "Infantry";
            requiresPosition = false;
            condition = "_this isKindOf 'Man'";
            action = "";
            class GVAR(patrolArea) {
                displayName = "Patrol Area";
                requiresPosition = true;
                condition = "alive _this";
                action = QUOTE(_this call FUNC(patrolArea));
            };
            class GVAR(fleeArea) {
                displayName = "Flee Area";
                requiresPosition = false;
                condition = "alive _this";
                action = QUOTE(_this call FUNC(fleeArea));
                class GVAR(fleeArea_a) {
                    displayName = "Flee Area (A)";
                    requiresPosition = false;
                    condition = "alive _this";
                    action = QUOTE(_this call FUNC(fleeArea));
                };
                class GVAR(fleeArea_b) {
                    displayName = "Flee Area (B)";
                    requiresPosition = false;
                    condition = "alive _this";
                    action = QUOTE(_this call FUNC(fleeArea));
                };
                class GVAR(fleeArea_c) {
                    displayName = "Flee Area (C)";
                    requiresPosition = false;
                    condition = "alive _this";
                    action = QUOTE(_this call FUNC(fleeArea));
                };
            };
        };
        class GVAR(air) {
            displayName = "Air";
            requiresPosition = false;
            condition = "_this isKindOf 'Air'";
            action = "";
            class GVAR(air_attack) {
                displayName = "Attack";
                requiresPosition = true;
                condition = "";
                action = QUOTE(_this call FUNC(airAttack));
            };
            class GVAR(air_land) {
                displayName = "Land";
                requiresPosition = true;
                condition = "";
                action = QUOTE(_this call FUNC(airLand));
                class GVAR(air_land_a) {
                    displayName = "Land (A)";
                    requiresPosition = true;
                    condition = "";
                    action = QUOTE(_this call FUNC(airLand));
                };
                class GVAR(air_land_b) {
                    displayName = "Land (B)";
                    requiresPosition = true;
                    condition = "";
                    action = QUOTE(_this call FUNC(airLand));
                };
                class GVAR(air_land_c) {
                    displayName = "Land (C)";
                    requiresPosition = true;
                    condition = "";
                    action = QUOTE(_this call FUNC(airLand));
                };
            };
            class GVAR(air_para) {
                displayName = "Paradrop";
                requiresPosition = true;
                condition = "";
                action = QUOTE(_this call FUNC(airParadrop));
            };
            class GVAR(air_orbit) {
                displayName = "Orbit";
                requiresPosition = true;
                condition = "";
                action = QUOTE(_this call FUNC(airOrbit));
            };
        };
    };
};