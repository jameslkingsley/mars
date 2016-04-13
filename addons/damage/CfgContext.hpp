class GVARMAIN(context) {
    class ADDON {
        class damage {
            displayName = "Damage";
            condition = "alive vehicle _this";
            class hull {
                displayName = "Hull";
            };
            class wheels {
                displayName = "Wheels";
                condition = "vehicle _this isKindOf 'Land'";
            };
            class main_rotor {
                displayName = "Main Rotor";
                condition = "vehicle _this isKindOf 'Air'";
            };
            class tail_rotor {
                displayName = "Tail Rotor";
                condition = "vehicle _this isKindOf 'Air'";
            };
        };
    };
};