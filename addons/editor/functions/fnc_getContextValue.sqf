/*
 * Author: Kingsley
 * Gets a value from the given context item (config or array) using the given key
 *
 * Arguments:
 * 0: Item <CONFIG, ARRAY>
 * 1: Key <STRING>
 * 2: Default value if not found <ANY>
 *
 * Return Value:
 * Value of the key, or default value if not found <ANY>
 *
 * Example:
 * _labels = [_item, "labels"] call mars_editor_fnc_getContextValue;
 *
 * Public: No
 */

#include "script_component.hpp"

params [
    ["_item", [], [configNull, []]],
    ["_key", "", [""]],
    ["_default", nil]
];

private _result = "";

if (_item isEqualType configNull) then {
    private _prop = (_item >> _key);
    
    if (isNull _prop) then {
        if (!isNil "_default") then {
            _result = _default;
        };
    } else {
        switch (true) do {
            case (isText _prop): {
                private _text = toLower (getText _prop);
                
                if (_text in ["true","false"]) then {
                    _result = [false,true] select (_text == "true");
                } else {
                    _result = getText _prop;
                };
            };
            case (isNumber _prop): {_result = getNumber _prop};
            case (isArray _prop): {_result = getArray _prop};
        };
    };
} else {
    if (_item isEqualType []) then {
        private _item = (_item select {toLower (_x select 0) == toLower _key}) param [0, []];
        
        if !(_item isEqualTo []) then {
            _result = _item param [1, _default];
        } else {
            _result = _default;
        };
    };
};

_result