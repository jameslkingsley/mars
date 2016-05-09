/*
 * Author: Kingsley
 * Opens date/time dialog
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: Yes
 */

#include "script_component.hpp"

[] spawn {
    closeDialog 0;
    createDialog QGVAR(datetime);
};