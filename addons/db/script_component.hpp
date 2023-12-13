#define COMPONENT db
#define COMPONENT_BEAUTIFIED Database
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

#define ASSERT_DB(db,msg,varExit) ASSERT_FALSE_EXIT(isNil {"getVersion" call db},msg,varExit)

// nil sucks
#define NOTHING "$NOTHING"
#define IS_NOTHING(var0) IS_STRING(var0) && {var0 == NOTHING}
