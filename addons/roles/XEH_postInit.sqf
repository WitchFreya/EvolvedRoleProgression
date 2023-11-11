#include "script_component.hpp"

if (!hasInterface) exitWith {};

private _playerRole = player getVariable QGVARMAIN(role);

if (!isNil "_playerRole") exitWith {
    TRACE_1("Player has a role already, exiting",_playerRole);
};

[player, QUOTE(DEFAULT_ROLE)] call EFUNC(common,setUnitRole);
