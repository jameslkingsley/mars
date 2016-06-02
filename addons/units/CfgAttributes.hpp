class GVARMAIN(attributes) {
    class __objects {
        class CAManBase {
            displayName = "Edit %1";
            actionConfirm = "";
            actionCancel = "";
            class AttributeCategories {
                class Debug {
                    class AttributeItems {
                        class Name {
                            displayName = "Variable Name";
                            tooltipText = "Set a global variable name for this unit.";
                            class AttributeControls {
                                class Edit {
                                    condition = QUOTE(count EGVAR(editor,selection) == 1);
                                    type = "EDIT";
                                    rows = 1;
                                    textCode = "vehicleVarName (_this select 0)";
                                    expression = "";
                                };
                            };
                        };
                        class Init {
                            displayName = "Execution";
                            tooltipText = "Execute code on unit (_this). Code is executed where the given object is local.";
                            class AttributeControls {
                                class Edit {
                                    condition = "true";
                                    type = "EDIT";
                                    rows = 5;
                                    expression = "";
                                };
                            };
                        };
                    };
                };
            };
        };
    };
};