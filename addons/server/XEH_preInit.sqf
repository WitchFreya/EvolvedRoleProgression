#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"
ADDON = true;

private _history = call FUNC(getRoleHistory);
missionNamespace setVariable [QGVARMAIN(history), _history];
