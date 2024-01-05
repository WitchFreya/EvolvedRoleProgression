#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"
ADDON = true;

#include "defines.hpp"

["ace_arsenal_leftPanelFilled", {
  // leftPanelFilled is called before the function of leftPanelFilled is done.
  [{ _this call FUNC(fillLeftPanel); }, _this] call CBA_fnc_execNextFrame;
  // i know
  // it hurts me too
  // one day i will request an API
  // for now i will simply sob
}] call CBA_fnc_addEventHandler;

[QGVAR(leftPanelFilled), {
  private _currentRole = ace_arsenal_center getVariable [QGVARMAIN(role), QUOTE(DEFAULT_ROLE)];
  params ["_display"];
  [_display, _currentRole] call FUNC(lbSelectRole);
}] call CBA_fnc_addEventHandler;

[QGVAR(onSelChangedLeft), {
  _this call FUNC(onSelChangedLeft);
}] call CBA_fnc_addEventHandler;

