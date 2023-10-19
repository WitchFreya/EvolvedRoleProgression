#include "script_component.hpp"

[QGVAR(doSave), {
    call FUNC(saveAllPlayerPlaytimes);
    missionNamespace setVariable [QGVARMAIN(history), call FUNC(getRoleHistory), true];
}] call CBA_fnc_addEventHandler;
