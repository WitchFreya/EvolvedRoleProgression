#include "script_component.hpp"

[QGVARMAIN(doSave), {
    params ["_whoSaved"];
    INFO_1("Save initiated",_whoSaved);
    call FUNC(saveAllPlayerPlaytimes);
    missionNamespace setVariable [QGVARMAIN(history), call FUNC(getRoleHistory), true];
    [QGVARMAIN(saved), [_whoSaved]] call CBA_fnc_globalEvent;
}] call CBA_fnc_addEventHandler;
