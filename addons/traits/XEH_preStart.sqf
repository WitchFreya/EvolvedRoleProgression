#include "script_component.hpp"
#include "XEH_PREP.hpp"

private _roles = call EFUNC(roles,classNames);

ASSERT_FALSE_EXIT(isNil {_roles},"Invalid roles cache",nil);

private _roleProperties = [_roles] call FUNC(scanConfig);
uiNamespace setVariable [QGVAR(roleProperties), compileFinal _roleProperties];
