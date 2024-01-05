#include "script_component.hpp"
#include "defines.hpp"

/*
 * Author: Maid
 * Adds additional logic to onSelChangeLeft function from ace.
 *
 * Arguments:
 * 0: Left panel control <CONTROL>
 * 1: Left panel selection <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

if (ace_arsenal_currentLeftPanel != IDC_buttonRole) exitWith {
  TRACE_1("not ours, calling raw",ace_arsenal_currentLeftPanel);
  _this call ace_arsenal_fnc_onSelChangedLeft;
};

[QGVAR(onSelChangedLeft), _this] call CBA_fnc_localEvent;
