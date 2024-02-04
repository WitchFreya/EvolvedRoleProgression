#include "script_component.hpp"

[QGVARMAIN(saved), FUNC(onSaved)] call CBA_fnc_addEventHandler;
[QGVARMAIN(saveStart), FUNC(onSaveStart)] call CBA_fnc_addEventHandler;

if (is3DEN) exitWith {};

private _action = [
  "saveRoleProgress",
  "[ERP] Record Role Progress",
  "",
  FUNC(recordProgress),
  {true}
] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions"], _action] call ace_interact_menu_fnc_addActionToZeus;
