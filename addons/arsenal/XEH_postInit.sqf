#include "script_component.hpp"

player setVariable [QGVARMAIN(role), QUOTE(DEFAULT_ROLE), true];

[QGVAR(roleSelected), {
    TRACE_1(QGVAR(roleSelected),_this);
}] call CBA_fnc_addEventHandler;
