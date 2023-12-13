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

private _diarySubject = "roles";
if (!(player diarySubjectExists _diarySubject)) then {
  player createDiarySubject [_diarySubject, "Roles", QPATHTOEF(common,data\sws_icon_howl_ca.paa)];
};
private _title = "[My Role History]";

private _body = [player] call FUNC(buildUnitRoleRecord);

private _previousRecord = player getVariable QGVAR(myRoleHistoryRecord);
if (!isNull _previousRecord) then {
  player removeDiaryRecord [_diarySubject, _previousRecord];
};
private _newRecord = player createDiaryRecord [_diarySubject, [_title, _body]];
player setVariable [QGVAR(myRoleHistoryRecord), _newRecord];
