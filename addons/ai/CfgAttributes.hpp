class GVARMAIN(attributes) {
    class ADDON {
        class PopulateArea {
            displayName = "Populate Area";
            actionConfirm = QFUNC(populateArea);
            actionCancel = "";
            class AttributeCategories {
                class Faction {
                    class AttributeItems {
                        class Side {
                            displayName = "Side";
                            tooltipText = "";
                            class AttributeControls {
                                class Control {
                                    condition = "true";
                                    type = "SIDE";
                                };
                            };
                        };
                    };
                };
            };
        };
    };
};
