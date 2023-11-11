#include "script_component.hpp"
#include "XEH_PREP.hpp"

private _rolesCache = uiNamespace getVariable QEGVAR(roles,cache);
if (isNil "_rolesCache") exitWith {
    ERROR_1("Could not find roles cache",_rolesCache);
};

private _traits = [_rolesCache] call FUNC(createRoleTraitMap);
uiNamespace setVariable [QGVAR(traits), compileFinal _traits];
