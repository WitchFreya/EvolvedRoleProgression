#include "script_component.hpp"

if (!hasInterface) exitWith {};

private _role = player getVariable QGVARMAIN(role);
TRACE_1("Role",_role);
if (isNil "_role") exitWith {
    ERROR_1("Player had no role",_role);
};

private _traitsForRole = [_role] call FUNC(getTraitsForRole);
[player, _traitsForRole] call FUNC(setUnitTraits);
