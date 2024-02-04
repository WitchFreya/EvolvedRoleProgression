#include "script_component.hpp"

/*
 * Author: Maid
 * Handle save started.
 *
 * Arguments:
 * 0: time when save started <NUMBER>
 * 1: role saving with <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params [
  "_time",
  "_role"
];

hintSilent "Saving...";
