#include "script_component.hpp"

[QGVARMAIN(doSave), {
  params ["_whoSaved"];
  INFO_1("Save initiated",_whoSaved);
  call FUNC(saveAllPlayerPlaytimes);
}] call CBA_fnc_addEventHandler;
