#include "script_component.hpp"

if (!hasInterface) exitWith {};

private _role = player getVariable QGVARMAIN(role);
TRACE_1("Role",_role);
if (isNil "_role") exitWith {
    ERROR_1("Player had no role",_role);
};

private _propsForRole = [_role] call FUNC(getProperiesForRole);
[player, _propsForRole] call FUNC(setUnitProperties);
