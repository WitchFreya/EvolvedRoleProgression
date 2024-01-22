#include "script_component.hpp"

//--- Request and receive server to construct build history
[QEGVAR(db,uidHistory), {
  params ["_unit", "_history"];
  _unit setVariable [QGVARMAIN(history), _history];
  [QGVAR(historyUpdated), [_unit]] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;
[QEGVAR(db,buildHistory), [getPlayerUID player, player]] call CBA_fnc_serverEvent;

//--- Ensure the name on the server ini files matches the profile name
[QEGVAR(db,updateName), [getPlayerUID player, name player]] call CBA_fnc_serverEvent;

