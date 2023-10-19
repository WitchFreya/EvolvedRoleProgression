#include "script_component.hpp"

[QGVAR(doSave), { call FUNC(saveAllPlayerPlaytimes); }] call CBA_fnc_addEventHandler;
