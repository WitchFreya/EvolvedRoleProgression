#include "script_component.hpp"

/*
 * Author: Maid
 * Show role record completed in a fancy way.
 *
 * Arguments:
 * 0: role <STRING> - The role played
 * 1: count <NUMBER> - The new count of how many ops have been played as the role
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params [
  ["_role", "", [""]],
  ["_count", 0, [0]]
];

private _name /* string */ = name player;
private _roleName /* string */ = _role call EFUNC(roles,displayName);

private _rootFormat = "<t align='left' shadow='2' size='0.7' font='EtelkaMonospacePro'>%1</t>";
private _titleFormat = "<t>%1</t>";
private _valueFormat = "<t font='LCD14' color='#097969' size='1.0' align='right'>%1</t><br/>";
private _smallTitleFormat = "<t size='0.6'>%1</t>";
private _numberFormat = "<t font='LCD14' color='#50C878' size='1.5' align='right'>%1</t>";
[
  [
    ["Operative", _titleFormat, 4],
    [toUpper _name, _valueFormat, 7],
    ["Role", _titleFormat, 4],
    [toUpper _roleName, _valueFormat, 7],
    ["Operations as Role", _smallTitleFormat, 4],
    [str _count, _numberFormat, 35]
  ],
  0, safeZoneY + safeZoneH / 2,
  _rootFormat
] spawn BIS_fnc_typeText;
