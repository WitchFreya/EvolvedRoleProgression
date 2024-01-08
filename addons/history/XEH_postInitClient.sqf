#include "script_component.hpp"

[QGVARMAIN(saved), {
  params ["_history"];
  player setVariable [QGVARMAIN(history), _history, true];
}] call CBA_fnc_addEventHandler;

[QEGVAR(db,buildHistory), [getPlayerUID player]] call CBA_fnc_serverEvent;
[QEGVAR(db,updateName), [getPlayerUID player, name player]] call CBA_fnc_serverEvent;
[QEGVAR(db,uidHistory), {
  params ["_uid", "_history"];
  if (getPlayerUID player != _uid) exitWith {
    TRACE_2("History for another unit",_history);
  };
  player setVariable [QGVARMAIN(history), _history, true];
}] call CBA_fnc_addEventHandler;
