#include "script_component.hpp"

/*
 * Author: Maid
 * Open the UI for editing a unit's ranks.
 *
 * Arguments:
 * 0: unit <OBJECT> - The unit to open the UI on
 * 1: onConfirm <CODE> - Optional; will do the default change behavior if not provided. Otherwise, passses the result of the UI along to this function.
 *
 * Return Value:
 * true on success
 *
 * Example:
 * [player] call erp_roles_fnc_openUnitRankUI
 *
 * Public: No
 */

params [
  ["_target", objNull, [objNull]],
  "_onConfirm"
];

private _fnc_updateRank = {
  params ["_changes", "_target"];
  private _newChanges = _changes select {
    _x params ["_role", "_rank"];
    _rank != [_target, _role] call EFUNC(history,rank);
  };
  [QGVAR(updateRank), [_target, _changes]] call CBA_fnc_serverEvent;
};

private _cb = [
  _fnc_updateRank,
  _onConfirm
] select (IS_FUNCTION(_onConfirm));

private _roleControls /* ZEN_CONTROL[] */ = [] call FUNC(classNames) apply {
  private _roleClass /* string */ = _x;
  private _roleName /* string */ = [_x] call FUNC(displayName);
  private _roleDescription /* string */ = [_x] call FUNC(description);
  private _rankConfigs /* config[] */ = [
    _roleClass,
    // Get the list of possible ranks.
    { (toString {true}) configClasses (configFile >> "CfgRoles" >> _this >> "CfgRanks"); },
    // Sort the ranks
    {
      private _fnc_sortByConfigOrdinal = { [_x, "ordinal", -1] call BIS_fnc_returnConfigEntry; };
      [_this, [], _fnc_sortByConfigOrdinal] call BIS_fnc_sortBy;
    }
  ] call FUNCMAIN(pipe);
  private _rankClasses /* string[] */ =  _rankConfigs apply {
    configName _x;
  };
  private _currentRank /* string */ = [_target, _roleClass] call EFUNC(history,rank);
  private _rankPrettyNames /* ZEN_COMBO_PRETTYNAME[] */ = _rankClasses apply {
    private _isCurrentRank = _currentRank isEqualTo _x;
    private _displayName /* string */ = [_roleClass, _x] call FUNC(rankDisplayName);
    private _tooltip /* string | nil */ = [nil, "This is the unit's saved rank."] select _isCurrentRank;
    private _picture /* PATH<string> */ = [_roleClass, _x] call FUNC(rankIcon);
    private _color = [
      [1,1,1,1], /* white */
      [0.98,0.79,0.87,1] /* light pink */
    ] select _isCurrentRank;
    [_displayName, _tooltip, _picture, _color];
  };
  private _currentSelectionIndex /* number */ = _rankClasses find _currentRank;

  private _comboBoxTitle = [_roleName, _roleDescription];
  private _comboBoxControlArgs = [
    _rankClasses apply { [_roleClass, _x] },
    _rankPrettyNames,
    _currentSelectionIndex
  ];

  [
    "COMBO",
    [_roleName, _roleDescription],
    _comboBoxControlArgs,
    true
  ];
};

[
  format ["Adjust Role Rank for %1", name _target],
  _roleControls,
  _cb /* onConfirm */,
  {} /* onCancel */,
  _target
] call zen_dialog_fnc_create;
