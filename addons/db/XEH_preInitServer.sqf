#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.inc.sqf"
ADDON = true;

[QGVAR(buildHistory), FUNC(onBuildHistory)] call CBA_fnc_addEventHandler;

[QGVAR(updateName), {
  TRACE_1(QGVAR(updateName),_this);
  params ["_uid", "_name"];
  [_uid, _name] spawn FUNC(syncName);
}] call CBA_fnc_addEventHandler;
