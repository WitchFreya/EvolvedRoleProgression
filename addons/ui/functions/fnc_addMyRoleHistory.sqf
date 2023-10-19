#include "script_component.hpp"

/*
 * Author: Maid
 * Add a player's role history to their diary.
 *
 * Arguments:
 * 0: The roles map from CfgRoles cache <HASHMAP>
 * 1: The ordered array of the role classnames <ARRAY>
 * 2: The history of roles player from the server <HASHMAP>
 *
 * Return Value:
 * Diary record created <OBJECT>
 *
 * Public: No
 */

params [["_rolesHistory", createHashMap]];
private _roles = uiNamespace getVariable QEGVAR(roles,cache);
private _order = uiNamespace getVariable QEGVAR(roles,order);
if (isNil "_roles" || { isNil "_order" }) exitWith {
    ERROR_3("Cache not found", _rolesHistory, _roles, _order);
};

private _diarySubject = "roles";
if (!(player diarySubjectExists _diarySubject)) then {
    player createDiarySubject [_diarySubject, "Roles", QPATHTOEF(arsenal,data\sws_icon_howl_ca.paa)];
};
private _title = "My Role History";
private _body = [_order, {
    params ["_prev", "_curr"];
    private _role = _roles get _curr;
    private _name = _role get "name";
    private _opsAsRole = _rolesHistory getOrDefault [_curr, 0];
    private _currText = format ["%1: %2", _name, _opsAsRole];
    if (_prev == "") exitWith {
        _currText;
    };

    format ["%1<br/>%2",_prev,_currText];
}, ""] call EFUNC(common,reduce);
TRACE_1("Body",_body);

private _previousRecord = player getVariable QGVAR(myRoleHistoryRecord);
if (!isNull _previousRecord) then {
    player removeDiaryRecord [_diarySubject, _previousRecord];
};
private _newRecord = player createDiaryRecord [_diarySubject, [_title, _body]];
player setVariable [QGVAR(myRoleHistoryRecord), _newRecord];
