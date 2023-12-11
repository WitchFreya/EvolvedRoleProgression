#define COMPONENT server
#define COMPONENT_BEAUTIFIED Server
#include "\x\erp\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_INGAME
    #define DEBUG_MODE_FULL
#endif
#ifdef DEBUG_SETTINGS_SERVER
    #define DEBUG_SETTINGS DEBUG_SETTINGS_INGAME
#endif

#include "\x\erp\addons\main\script_macros.hpp"
