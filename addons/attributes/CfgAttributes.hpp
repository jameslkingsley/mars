class GVARMAIN(attributes) {
    class ADDON {
        class sandbox {
            displayName = "Attributes Sandbox";
            class AttributeCategories {
                class Positional {
                    class AttributeItems {
                        class List1 {
                            displayName = "List 1";
                            class AttributeControls {
                                class Control1 {
                                    condition = "true";
                                    type = "LIST";
                                    labels[] = {
                                        "Item 1",
                                        "Item 2",
                                        "Item 3",
                                        "Item 4",
                                        "Item 5"
                                    };
                                    values[] = {1,2,3,4,5};
                                    selected = 3;
                                    expression = "";
                                };
                            };
                        };
                        class List2 {
                            displayName = "List 2";
                            class AttributeControls {
                                class Control1 {
                                    condition = "true";
                                    type = "LIST";
                                    labels[] = {
                                        "Item 1",
                                        "Item 2",
                                        "Item 3",
                                        "Item 4",
                                        "Item 5"
                                    };
                                    values[] = {1,2,3,4,5};
                                    selected[] = {1,2,3};
                                    expression = "";
                                };
                            };
                        };
                        class List3 {
                            displayName = "List 3";
                            class AttributeControls {
                                class Control1 {
                                    condition = "true";
                                    type = "LIST";
                                    labels[] = {
                                        "Item 1",
                                        "Item 2",
                                        "Item 3",
                                        "Item 4",
                                        "Item 5"
                                    };
                                    values[] = {1,2,3,4,5};
                                    selected = "4";
                                    expression = "";
                                };
                            };
                        };
                        class Vector {
                            displayName = "Vector";
                            class AttributeControls {
                                class Control {
                                    condition = "true";
                                    type = "VECTOR";
                                    value = "getPosATL player";
                                    expression = "systemChat str _this";
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