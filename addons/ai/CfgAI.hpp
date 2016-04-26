class GVARMAIN(ai) {
    class CAManBase {
        class jobs {
            class move {
                functions = QUOTE(_this call FUNC(CAManBase_Move));
                priority = 0.88;
                conditions[] = {
                    {"canMove", 1.1, 0},
                    {"isInVehicle", 0, 1}
                };
                class profiles {
                    class walk {
                        priority = 0.33;
                        init = "walk";
                        conditions[] = {
                            {"isSuppressed", 1.33, 1}
                        };
                    };
                    class run {
                        priority = 0.66;
                        init = "run";
                        conditions[] = {
                            {"isSuppressed", 1.33, 0.33}
                        };
                    };
                    class sprint {
                        priority = 0.88;
                        init = "sprint";
                        conditions[] = {
                            {"isSuppressed", 1.33, 0.66}
                        };
                    };
                };
            };
        };
    }:
};
