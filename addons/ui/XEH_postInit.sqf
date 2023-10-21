#include "script_component.hpp"

if (is3DEN) exitWith {};

addMissionEventHandler ["Map", {
    params ["_isOpen"];
    if (!_isOpen) exitWith {};
    [player] call FUNC(addMyRoleHistory);
    [allPlayers] call FUNC(addUnitRoles);
}];
