# Evolved Role Progression

- Tracks role progression based on CfgRoles.
- Persists to an inidbi2 file on the server.
- Can be updated by emitting an event with the name `erp_doSave` with the saving player as a parameter, e.g. `["erp_doSave", [player]] call CBA_fnc_serverEvent`.
- When the server has updated it'll emit an event `erp_saved` with the player who saved as a parameter.
