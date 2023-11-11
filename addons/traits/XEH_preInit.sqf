#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

#include "initSettings.sqf"

ADDON = true;

[QGVARMAIN(roleChanged), {
    TRACE_1("traits/preInit roleChanged",_this);
    _this call FUNC(onRoleChange);
}] call CBA_fnc_addEventHandler;
