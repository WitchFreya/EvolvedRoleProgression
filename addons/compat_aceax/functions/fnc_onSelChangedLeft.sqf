#include "script_component.hpp"
#include "defines.hpp"

/*
 * Author: Maid
 * Pass along the change event to aceax and then our stuff.
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
    TRACE_2("Not ours, calling aceax",ace_arsenal_currentLeftPanel,_this);
    _this call aceax_arsenal_fnc_onSelChangedLeft;
};

TRACE_1("onSelChangedLeft",_this);

[QEGVAR(arsenal,roleSelected), _this] call CBA_fnc_localEvent;
