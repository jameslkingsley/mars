class Hint {
    displayName = "Hint";
    actionConfirm = "";
    actionCancel = "";
    class General {
        class Content {
            displayName = "Content";
            tooltipText = "Content of the hint. Can be structured text.";
            class Edit {
                type = "EDIT";
                rows = 10;
                expression = QUOTE((parseText _this) remoteExecCall [ARR_2('hint', 0)]);
            };
        };
    };
};
