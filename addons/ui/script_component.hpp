#define COMPONENT ui
#define COMPONENT_BEAUTIFIED UI
#include "\x\erp\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_INGAME
    #define DEBUG_MODE_FULL
#endif
#ifdef DEBUG_SETTINGS_UI
    #define DEBUG_SETTINGS DEBUG_SETTINGS_INGAME
#endif

#include "\x\erp\addons\main\script_macros.hpp"

#include "\a3\ui_f\hpp\defineResincl.inc"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
#include "\a3\ui_f\hpp\defineCommonGrids.inc"
#include "\a3\ui_f\hpp\defineCommonColors.inc"

#define POS_X(N) ((N) * GUI_GRID_W + GUI_GRID_CENTER_X)
#define POS_Y(N) ((N) * GUI_GRID_H + GUI_GRID_CENTER_Y)
#define POS_W(N) ((N) * GUI_GRID_W)
#define POS_H(N) ((N) * GUI_GRID_H)

#define IDD_RolesMenu 80085

#define IDC_Title 1200
#define IDC_PlayButton IDC_OK
#define IDC_Exit IDC_CANCEL
#define IDC_Edit 1203
#define IDC_RolesList 1301
#define IDC_RoleName 1400
#define IDC_RoleDetails 1401
#define IDC_UnitRolesList 1501

// Inside IDC_RoleDetails
#define IDC_RoleDescription 1200
