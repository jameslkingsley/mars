class GVARMAIN(attributes) {
    class ADDON {
        class sandbox {
            displayName = "Attributes Sandbox";
            actionConfirm = "";
            actionCancel = "";
            class AttributeCategories {
                class Positional {
                    class AttributeItems {
                        class Teleport {
                            displayName = "Teleport";
                            tooltipText = "Teleport yourself to a desired location";
                            class AttributeControls {
                                class Map {
                                    condition = "true";
                                    type = "MAP";
                                    position[] = {0,0,0};
                                    expression = QUOTE(\
                                        systemChat str _this;\
                                    );
                                };
                            };
                        };
                    };
                };
            };
        };
    };
};