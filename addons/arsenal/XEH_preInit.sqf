#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"
ADDON = true;

#include "defines.hpp"

["ace_arsenal_leftPanelFilled", {
    _this call FUNC(fillLeftPanel);
}] call CBA_fnc_addEventHandler;

#ifdef DEBUG_MODE_FULL
[QGVAR(leftPanelFilled), {
    TRACE_1(QGVAR(leftPanelFilled), _this);
}] call CBA_fnc_addEventHandler;
#endif

[QGVAR(leftPanelFilled), {
    params ["_display"];
    private _currentRole = player getVariable [QGVARMAIN(role), QUOTE(DEFAULT_ROLE)];

    _this call FUNC(selectCurrentRole);
}] call CBA_fnc_addEventHandler;
