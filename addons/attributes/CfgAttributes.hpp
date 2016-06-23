class GVARMAIN(attributes) {
    class ADDON {
        class sandbox {
            displayName = "Attributes Sandbox";
            class AttributeCategories {
                class Positional {
                    class AttributeItems {
                        class Vector {
                            displayName = "Vector";
                            class AttributeControls {
                                class Control {
                                    condition = "(true)";
                                    type = "VECTOR";
                                    value = "getPosATL player";
                                    expression = "";
                                };
                            };
                        };
                        class Checkbox {
                            displayName = "Checkbox";
                            class AttributeControls {
                                class Control {
                                    condition = "(true)";
                                    type = "CHECKBOX";
                                    checked = false;
                                    textPlain = "Checkbox label";
                                    expression = "";
                                };
                            };
                        };
                        class Teleport {
                            displayName = "Teleport";
                            tooltipText = "Teleport yourself to a desired location";
                            class AttributeControls {
                                class Map {
                                    condition = "(true)";
                                    type = "MAP";
                                    position = "getPosATL player";
                                    expression = "systemChat str _this";
                                };
                            };
                        };
                    };
                };
            };
        };
    };
};