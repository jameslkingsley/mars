class GVARMAIN(Context) {
    class ADDON {
        class GVAR(infantry) {
            displayName = "Infantry";
            requiresPosition = false;
            condition = "_this isKindOf 'Man'";
            action = "";
            class GVAR(patrol) {
                displayName = "Patrol";
                requiresPosition = true;
                condition = "alive _this";
                action = QUOTE(_this call FUNC(infPatrol));
            };
            class GVAR(defend) {
                displayName = "Defend";
                requiresPosition = true;
                condition = "alive _this";
                action = QUOTE(_this call FUNC(infDefend));
            };
        };
        class GVAR(air) {
            displayName = "Air";
            requiresPosition = false;
            condition = "_this isKindOf 'Air'";
            action = "";
            class GVAR(attack) {
                displayName = "Attack";
                requiresPosition = true;
                condition = "";
                action = QUOTE(_this call FUNC(airAttack));
            };
            /*class GVAR(land) {
                displayName = "Land";
                requiresPosition = true;
                condition = "";
                action = QUOTE(_this call FUNC(airLand));
            };
            class GVAR(paradrop) {
                displayName = "Paradrop";
                requiresPosition = true;
                condition = "";
                action = "";
                class GVAR(paradrop_low) {
                    displayName = "Low (250m)";
                    requiresPosition = true;
                    condition = "";
                    action = QUOTE([_this, 250] call FUNC(airParadrop));
                };
                class GVAR(paradrop_med) {
                    displayName = "Medium (500m)";
                    requiresPosition = true;
                    condition = "";
                    action = QUOTE([_this, 500] call FUNC(airParadrop));
                };
                class GVAR(paradrop_high) {
                    displayName = "High (750m)";
                    requiresPosition = true;
                    condition = "";
                    action = QUOTE([_this, 750] call FUNC(airParadrop));
                };
            };*/
            class GVAR(orbit) {
                displayName = "Orbit";
                requiresPosition = false;
                condition = "";
                action = "";
                class GVAR(orbit_low) {
                    displayName = "Low (250m)";
                    requiresPosition = true;
                    condition = "";
                    action = QUOTE([ARR_2(_this,250)] call FUNC(airOrbit));
                };
                class GVAR(orbit_med) {
                    displayName = "Medium (500m)";
                    requiresPosition = true;
                    condition = "";
                    action = QUOTE([ARR_2(_this,500)] call FUNC(airOrbit));
                };
                class GVAR(orbit_high) {
                    displayName = "High (750m)";
                    requiresPosition = true;
                    condition = "";
                    action = QUOTE([ARR_2(_this,750)] call FUNC(airOrbit));
                };
            };
        };
    };
};