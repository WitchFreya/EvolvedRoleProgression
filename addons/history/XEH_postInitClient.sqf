#include "script_component.hpp"

//--- Update history variable on save
[QGVARMAIN(saved), {
  params ["_history"];
  player setVariable [QGVARMAIN(history), _history, true];
}] call CBA_fnc_addEventHandler;

//--- Request and receive server to construct build history
[QEGVAR(db,uidHistory), {
  params ["_uid", "_history"];
  if (getPlayerUID player != _uid) exitWith {
    TRACE_3("History for another unit",getPlayerUID player,_uid,_history);
  };
  player setVariable [QGVARMAIN(history), _history, true];
}] call CBA_fnc_addEventHandler;
[QEGVAR(db,buildHistory), [getPlayerUID player]] call CBA_fnc_serverEvent;

//--- Ensure the name on the server ini files matches the profile name
[QEGVAR(db,updateName), [getPlayerUID player, name player]] call CBA_fnc_serverEvent;

