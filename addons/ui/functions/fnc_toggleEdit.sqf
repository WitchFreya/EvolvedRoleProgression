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

private _editCtrl = _display displayCtrl IDC_Edit;
private _playCtrl = _display displayCtrl IDC_OK;
_playCtrl ctrlEnable false;
_editCtrl ctrlShow !GVAR(editing);
