#include "script_component.hpp"

[QGVARMAIN(doSave), {
  INFO_1("Save initiated",_this);
  _this call FUNC(recordOp);
}] call CBA_fnc_addEventHandler;
