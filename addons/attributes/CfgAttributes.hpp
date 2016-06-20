class GVARMAIN(attributes) {
    class ADDON {
        class sandbox {
            displayName = "Attributes Sandbox";
            class AttributeCategories {
                class Positional {
                    class AttributeItems {
                        class List {
                            displayName = "List";
                            class AttributeControls {
                                class Control1 {
                                    condition = "true";
                                    type = "LIST";
                                    labels[] = {
                                        {"Item 1", {1,0,0,1}, QPATHTOF(data\Controls\Date\moon_full_ca.paa), "Tooltip 1"},
                                        "Item 2",
                                        {"Item 3", {0,0,1,1}, "", "Tooltip 2"}
                                    };
                                    values[] = {1,2,3};
                                    selected = 0;
                                    multi = true;
                                    expression = "systemChat str _this";
                                };
                            };
                        };
                        class List_Right {
                            displayName = "List Right";
                            class AttributeControls {
                                class Control1 {
                                    condition = "true";
                                    type = "LIST_RIGHT";
                                    labels[] = {
                                        {"Item 1", {1,0,0,1}, QPATHTOF(data\Controls\Date\moon_full_ca.paa), "Tooltip 1"},
                                        {"Item 1", {1,0,0,1}, QPATHTOF(data\Controls\Date\moon_full_ca.paa), "Tooltip 1"},
                                        {"Item 1", {1,0,0,1}, QPATHTOF(data\Controls\Date\moon_full_ca.paa), "Tooltip 1"},
                                        {"Item 1", {1,0,0,1}, QPATHTOF(data\Controls\Date\moon_full_ca.paa), "Tooltip 1"},
                                        {"Item 1", {1,0,0,1}, QPATHTOF(data\Controls\Date\moon_full_ca.paa), "Tooltip 1"}
                                    };
                                    values[] = {1,2,3,4,5};
                                    expression = "systemChat str _this";
                                };
                            };
                        };
                        class Vector {
                            displayName = "Vector";
                            class AttributeControls {
                                class Control {
                                    condition = "true";
                                    type = "VECTOR";
                                    value[] = {500,500,500};
                                    expression = "";
                                };
                            };
                        };
                        class Checkbox {
                            displayName = "Checkbox";
                            class AttributeControls {
                                class Control {
                                    condition = "true";
                                    type = "CHECKBOX";
                                    checked = false;
                                    textPlain = "Checkbox label";
                                    expression = "";
                                };
                            };
                        };
                        /*class Teleport {
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
                        };*/
                    };
                };
            };
        };
    };
};