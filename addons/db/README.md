# DB

The purpose of this addon is to abstract database access into a single point of failure, that way it can be migrated to a different sort of database if needed in the future.

## API

**History**
Construct a role history for a unit.
Request: `erp_db_buildHistory(uid: string)`
Response: `erp_db_uidHistory(history: hashmap)`

Update the name of a unit.
Request: `erp_db_updateName(uid: string, name: string)`
Response: None
