#include "script_component.hpp"

#ifndef DEBUG_MODE_FULL
if (is3DEN || { !isMultiplayer }) exitWith {};
#endif

params ["_units"];

private _headerFormat = "<font face='PuristaBold' size='15'>%1</font>";
private _valueFormat = "- <font color='#FACADE'>%1</font> - Deployment <font face='EtelkaMonospacePro' color='#50C878'>#%2</font>";

private _parseEntry = {
    params ["_unit", "_history"];
    #ifndef DEBUG_MODE_FULL
    if (!isPlayer _unit) exitWith {
        ERROR_1("Provided unit was not a player",_unit);
    };
    #endif

    private _uid = getPlayerUID _unit;
    private _unitHistory = _history get _uid;
    private _name = name _unit;
    private _role = _unit getVariable [QGVARMAIN(role), QUOTE(DEFAULT_ROLE)];
    private _roleCount = _unitHistory getOrDefault [_role, 0];
    private _text = format [_valueFormat, _name, _roleCount + 1];
    [_role, _text];
};

private _history = missionNamespace getVariable QGVARMAIN(history);

if (isNil "_history") exitWith {
    ERROR_1("History was empty", _history);
};

private _unitRoles = [_units, {
    params ["_acc", "_unit"];
    [_unit, _history] call _parseEntry params ["_role", "_text"];
    private _others = _acc getOrDefault [_role, [], true];
    _others pushback _text;
    _acc set [_role, _others];
    _acc;
}, createHashMap] call EFUNC(common,reduce);

private _activeRoles = keys _unitRoles;

private _body = [_activeRoles, {
    params ["_acc", "_role"];
    private _body = _unitRoles get _role;
    private _header = format [_headerFormat, _role];
    private _content = [_body, {
        params ["_acc", "_text"];
        if (_acc == "") exitWith {_text};
        format ["%1<br/>%2", _acc, _text];
    }, ""] call EFUNC(common,reduce);
    private _next = format [
        "%1<br/><br/>%2",
        _header,
        _content
    ];
    format ["%1<br/>%2", _acc, _next];
}, ""] call EFUNC(common,reduce);

private _diarySubject = "roles";
private _title = "[Active Unit Roles]";

private _previousRecord = player getVariable QGVAR(unitRoleHistoryRecord);
if (!isNull _previousRecord) then {
    player removeDiaryRecord [_diarySubject, _previousRecord];
};
private _newRecord = player createDiaryRecord [_diarySubject, [_title, _body]];
player setVariable [QGVAR(unitRoleHistoryRecord), _newRecord];
