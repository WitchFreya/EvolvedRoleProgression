#include "script_component.hpp"

/*
 * Author: Maid
 * Toggle edit mode.
 *
 * Arguments:
 * 0: Control <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

hint "Editing not yet supported, ask Maid to adjust certs manually.";

if (true) exitWith {INFO("Exiting early until I can get edit mode working.")};
GVAR(editing) = !GVAR(editing);

private _display = findDisplay IDD_RolesMenu;

if (_display isEqualTo displayNull) exitWith {
  TRACE_1("Display not found",IDD_RolesMenu);
};

private _editCtrl = _display displayCtrl IDC_Edit;
private _playCtrl = _display displayCtrl IDC_OK;
_playCtrl ctrlEnable false;
_editCtrl ctrlShow !GVAR(editing);
