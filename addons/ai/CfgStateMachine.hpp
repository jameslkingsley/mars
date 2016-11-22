class GVARMAIN(StateMachines) {
    class ADDON {
        list = "allUnits select {!isPlayer _x && {local _x}}";
        skipNull = 1;

        class Initial {
            onState = "";
            onStateEntered = "";
            onStateLeaving = "";

            class Moving {
                targetState = "Moving";
                condition = "speed _this > 0";
            };
        };

        class Moving {
            onStateEntered = QUOTE([ARR_2('MovingEntered', _this)] call FUNC(handleStateMachine));
            onStateLeaving = QUOTE([ARR_2('MovingLeaving', _this)] call FUNC(handleStateMachine));

            class Stopped {
                targetState = "Initial";
                condition = "speed _this <= 0";
            };
        };
    };
};
