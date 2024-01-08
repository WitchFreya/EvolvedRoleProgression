#include "script_component.hpp"

[QGVARMAIN(doSave), {
  params ["_whoSaved"];
  INFO_1("Save initiated",_whoSaved);
  call FUNC(recordOp);
}] call CBA_fnc_addEventHandler;
