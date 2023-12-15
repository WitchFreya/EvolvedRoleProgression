#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"
ADDON = true;

if (is3DEN) exitWith {};
private _netMode = call BIS_fnc_getNetMode;

if (_netMode == "SinglePlayer") exitWith {
  private _uid = "_SP_PLAYER_";
  TRACE_2("Single player mode; populating history early",_uid,player);
  [_uid] spawn {
    params ["_uid"];
    private _history = [_uid] call FUNC(buildHistoryForUID);
    player setVariable [QGVARMAIN(history),_history,true];
  };
};

addMissionEventHandler ["PlayerConnected", FUNC(onPlayerConnected)];
