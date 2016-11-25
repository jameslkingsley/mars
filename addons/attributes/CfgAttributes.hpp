class GVARMAIN(attributes) {
    class ADDON {
        class Confirmation {
            displayName = QUOTE(ARG_1(ATTR_ARGS,0));
            evalDisplayName = 1;
            actionConfirm = QUOTE(ARG_1(ATTR_ARGS,6) call ARG_1(ATTR_ARGS,4));
            actionCancel = QUOTE(ARG_1(ATTR_ARGS,6) call ARG_1(ATTR_ARGS,5));
            confirmText = QUOTE(ARG_1(ATTR_ARGS,2));
            cancelText = QUOTE(ARG_1(ATTR_ARGS,3));
            evalButtonText = 1;
            class Main {
                class Message {
                    displayName = "Message";
                    class Text {
                        type = "LABEL";
                        height = 3;
                        textCode = QUOTE(format [ARR_2('<t align=''center''>%1</t>', ARG_1(ATTR_ARGS,1))]);
                    };
                };
            };
        };
    };
};
