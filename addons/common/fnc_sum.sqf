#include "script_component.hpp"

/*
 * Author: Maid
 * Sum an array of numbers.
 *
 * Arguments:
 * 0..N: An array of numbers <number[]>.
 *
 * Return Value:
 * Sum <NUMBER>
 *
 * Public: Yes
 */

[_this, {
  params [
    ["_sum", 0, [0]],
    ["_el", 0, [0]]
  ];

  _sum + _el;
}, 0] call FUNCMAIN(reduce);
