#include "script_component.hpp"

// TODO: Configure default role with CBA settings.
player setVariable [QGVARMAIN(role), QUOTE(DEFAULT_ROLE), true];

#ifdef DEBUG_MODE_FULL
[QGVAR(roleSelected), {
    TRACE_1(QGVAR(roleSelected), _this);
}] call CBA_fnc_addEventHandler;
#endif

