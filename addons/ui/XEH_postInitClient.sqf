#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"

if (!hasInterface) exitWith {};

// CBA keybinds: https://github.com/CBATeam/CBA_A3/wiki/Keybinding

#define WITH_SHIFT true
#define WITH_CTRL true
#define WITH_ALT true
#define NO_SHIFT false
#define NO_CTRL false
#define NO_ALT false

// Alt+J - Open Role Menu
[COMPONENT_NAME, QGVAR(openRoleMenu), LLSTRING(OpenRoleMenu),
  // On Press
  {

  },
  // On Release
  {
    call FUNC(openRoleMenu);
  },
  [DIK_J, [NO_SHIFT, NO_CTRL, WITH_ALT], false, nil, true]
] call CBA_fnc_addKeybind;

#undef WITH_SHIFT
#undef WITH_CTRL
#undef WITH_ALT
#undef NO_SHIFT
#undef NO_CTRL
#undef NO_ALT
