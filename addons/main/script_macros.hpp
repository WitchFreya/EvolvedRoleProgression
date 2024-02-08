#include "\x\cba\addons\main\script_macros_common.hpp"

#define DFUNC(var1) TRIPLES(ADDON,fnc,var1)

#ifdef DISABLE_COMPILE_CACHE
  #undef PREP
  #define PREP(fncName) DFUNC(fncName) = compile preprocessFileLineNumbers QPATHTOF(functions\DOUBLES(fnc,fncName).sqf)
#else
  #undef PREP
  #define PREP(fncName) [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf), QFUNC(fncName)] call CBA_fnc_compileFunction
#endif

#define SCOPE(var0)     \
  scope = var0;         \
  scopeCurator = var0;  \
  scopeArsenal = var0

#define META            \
  dlc = QUOTE(PREFIX);  \
  author = QUOTE(AUTHOR)

#define ITEM_META(var0) \
  META;                 \
  SCOPE(var0)

#define NAME(var0) [ERP] var0
#define QNAME(var0) QUOTE(NAME(var0))

#define DEFAULT_ROLE Rifleman
#define BASE_ROLE Default

// Assertions

// Why this isn't the default behavior of assert is beyond me.
#define ASSERT_FALSE_EXIT(varAssertion,varMessage,varValue) \
  ASSERT_FALSE(varAssertion,varMessage);                    \
  if (varAssertion) exitWith {varValue}

#define TRUE 1
#define FALSE 0

// Module Magic Numbers
#define MODULE_isGlobal_SERVER 0
#define MODULE_isGlobal_GLOBAL 1
#define MODULE_isGlobal_GLOBAL_JIP 2
