#include "script_component.hpp"
#include "defines.hpp"

/*
 * Author: Maid
 * Select the current role in the ui.
 *
 * Arguments:
 * 0: The left panel display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_display", "_role"];

private _ctrlPanel = _display displayCtrl IDC_leftTabContent;
private _index = 0;

for "_lbIndex" from 0 to (lbSize _ctrlPanel) - 1 do {
    if ((_ctrlPanel lbData _lbIndex) == _role) exitWith {
        _index = _lbIndex;
    };
};

_ctrlPanel lbSetCurSel _index;
