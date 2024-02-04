#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.inc.sqf"
ADDON = true;

GVAR(databases) = createHashMap;

[QGVAR(buildHistory), FUNC(onBuildHistory)] call CBA_fnc_addEventHandler;
[QGVAR(updateName), FUNC(syncName)] call CBA_fnc_addEventHandler;
