#include "script_component.hpp"

/*
 * Author: Maid
 * Toggle edit mode.
 *
 * Arguments:
 * 0: Control <OBJECT>
 *
 * Return Value:
 * Diary record created <OBJECT>
 *
 * Public: No
 */

GVAR(editing) = !GVAR(editing);

private _display = findDisplay IDD_RolesMenu;

if (_display isEqualTo displayNull) exitWith {
  TRACE_1("Display not found",IDD_RolesMenu);
};

private _ctrl = _display displayCtrl IDC_Edit;

if (_ctrl isEqualTo controlnull) exitWith {
  TRACE_2("Control not found",_IDD_RolesMenu,IDC_Edit);
};

_ctrl ctrlShow !GVAR(editing);
