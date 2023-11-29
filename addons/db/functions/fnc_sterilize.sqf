#include "script_component.hpp"

/*
 * Author: Maid
 * Sterilize a string by URL encoding. Only handles quotes at the moment.
 *
 * Arguments:
 * <STRING>
 *
 * Return Value:
 * <STRING>>
 *
 * Public: No
 */

switch (typeName _this) do {
    case "STRING": {_this regexReplace ["""", "%22"]};
    case "ARRAY": {_this apply { _x call FUNC(sterilize); }};
    default {_this};
};
