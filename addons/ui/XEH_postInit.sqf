#include "script_component.hpp"

if (is3DEN) exitWith {};

addMissionEventHandler ["Map", {
    params ["_isOpen"];
    if (!_isOpen) exitWith {};
    private _history = missionNamespace getVariable QGVARMAIN(history);
    if (isNil "_history") exitWith {
        ERROR_1("Role history was empty", _history);
    };
    private _uid = getPlayerUID player;
    private _myHistory = _history get _uid;
    [_myHistory] call FUNC(addMyRoleHistory);
}];
