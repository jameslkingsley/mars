class Execution {
    displayName = "Execution";
    actionConfirm = "";
    actionCancel = "";
    class Main {
        class Code {
            displayName = "Code";
            tooltipText = "Enter SQF code here that you want to execute.";
            class Control {
                condition = "(true)";
                identifier = "CodeBox";
                type = "EDIT";
                rows = 15;
                expression = "";
            };
        };
        class Targets {
            displayName = "Target";
            tooltipText = "Where do you want to execute the code?";
            class Server {
                condition = "(true)";
                type = "BUTTON";
                textPlain = "Server";
                action = QUOTE(['server'] call FUNC(execTarget));
            };
            class Global: Server {
                textPlain = "Global";
                action = QUOTE(['global'] call FUNC(execTarget));
            };
            class HC: Server {
                textPlain = "HC";
                action = QUOTE(['hc'] call FUNC(execTarget));
            };
            class Local: Server {
                textPlain = "Local";
                action = QUOTE(['local'] call FUNC(execTarget));
            };
        };
    };
};
