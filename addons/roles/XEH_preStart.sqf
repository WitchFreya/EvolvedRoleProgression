#include "script_component.hpp"
#include "XEH_PREP.hpp"

[configFile] call FUNC(scanConfig) params ["_cache", "_order"];

uiNamespace setVariable [QGVAR(cache), compileFinal _cache];
uiNamespace setVariable [QGVAR(order), _order];
