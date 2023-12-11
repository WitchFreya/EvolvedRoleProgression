#include "script_component.hpp"

[QGVARMAIN(doSave), {
  params ["_whoSaved"];
  INFO_1("Save initiated",_whoSaved);
  [nil, QFUNC(saveAllPlayerPlaytimes)] call BIS_fnc_spawnOrdered;
  [[QGVARMAIN(saved), [_whoSaved]], "CBA_fnc_globalEvent"] call BIS_fnc_spawnOrdered;
}] call CBA_fnc_addEventHandler;
