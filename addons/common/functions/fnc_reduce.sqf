/*
 * Author: Maid
 * Array reduce.
 *
 * Arguments:
 * 0: An array of elements <TArr[]>.
 * 1: A callback for changing the value; will receive params [previous value: TRes, current value: TArr, index: NUMBER]
 *      It also has the magic variables _acc for the previous value, _x for the current, and _index for the index. <CODE>
 * 2: The initial value. Optional, defaults to the first value of the array <TRes>.
 *
 * Return Value:
 * The reduced value <TRes>.
 *
 * Public: Yes
 */

params ["_arr", "_cb", "_init"];

if (isNil "_init") then {
    _init = _arr select 0;
};

{
    _init = [_init, _x, _forEachIndex] call _cb;
} forEach _arr;

_init;
