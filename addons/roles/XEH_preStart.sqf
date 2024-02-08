#include "script_component.hpp"
#include "XEH_PREP.inc.sqf"

[configFile] call FUNC(scanConfig) params ["_cache", "_order"];

uiNamespace setVariable [QGVAR(classNames), _order];
