#include "script_component.hpp"

[QGVARMAIN(roleChanged), { _this call FUNC(onRoleChange); }] call CBA_fnc_addEventHandler;
