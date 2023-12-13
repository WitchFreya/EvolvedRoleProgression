/*
 * Author: Maid
 * Sum an array of numbers.
 *
 * Arguments:
 * 0: An array of numbers <number[]>.
 *
 * Return Value:
 * Sum <NUMBER>
 *
 * Public: Yes
 */

params [
  ["_arr", [], [[]]]
];

[_arr, {
  params [
    ["_sum", 0, [0]],
    ["_el", 0, [0]]
  ];

  _sum + _el;
}, 0] call FUNCMAIN(reduce);
