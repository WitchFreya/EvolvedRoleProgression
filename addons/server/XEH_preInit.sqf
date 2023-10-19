#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"
ADDON = true;

if (is3DEN) exitWith {};

private _history = call FUNC(getRoleHistory);
missionNamespace setVariable [QGVARMAIN(history), _history, true];
