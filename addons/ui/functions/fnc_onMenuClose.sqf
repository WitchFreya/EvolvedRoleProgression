#include "script_component.hpp"

params ["_display", "_exitCode"];

if (_exitCode != 1) exitWith {
    TRACE_1("Exit code indicated noop",_exitCode);
    true;
};

private _role = _display getVariable QGVAR(selectedRole);

if (isNil "_role") exitWith {
    ERROR_1("No role selected",_role);
    false;
};

[player, _role] call EFUNC(common,setUnitRole);
