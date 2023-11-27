#include "script_component.hpp"

/*
 * Author: Maid
 * Handle player connecting to the server: https://community.bistudio.com/wiki/Arma_3:_Mission_Event_Handlers#PlayerConnected
 *
 * Arguments:
 * 0: id <NUMBER> - unique DirectPlay ID (very large number). It is also the same id used for user placed markers (same as _id param)
 * 1: uid <STRING> - getPlayerUID of the joining client. The same as Steam ID (same as _uid param)
 * 2: name <STRING> - profileName of the joining client (same as _name param)
 * 3: jip <BOOLEAN> - didJIP of the joining client (same as _jip param)
 * 4: owner <NUMBER> - owner id of the joining client (same as _owner param)
 * 5: idstr <STRING> - same as id but in string format, so could be exactly compared to user marker ids
 *
 * Return Value:
 * None
 *
 * Public: No
 */

TRACE_1("OnPlayerConnected",_this);
params ["_id", "_uid", "_name", "_jip", "_owner", "_idStr"];

private _history = missionNamespace getVariable QGVARMAIN(history);
if (isNil "_history") exitWith {
    ERROR_1("Unavailable history cache",_history);
};

private _unitHistory = _history get _uid;

if (isNil "_unitHistory") then {
    [_uid, _name] call FUNC(upsertPlayer);
};

