#include "script_component.hpp"
#include "XEH_PREP.hpp"

private _rolesCache = uiNamespace getVariable QEGVAR(roles,cache);
if (isNil "_rolesCache") exitWith {
    ERROR_1("Could not find roles cache",_rolesCache);
};

private _roleProperties = [_rolesCache] call FUNC(scanConfig);
uiNamespace setVariable [QGVAR(roleProperties), compileFinal _roleProperties];
