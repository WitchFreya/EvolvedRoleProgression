#include "script_component.hpp"

[QGVARMAIN(saved), {
  params ["_history"];
  player setVariable [QGVARMAIN(history), _history, true];
}] call CBA_fnc_addEventHandler;
