#include "script_component.hpp"

/*
 * Author: Maid
 * Check if candidate is in options, case-insensitive.
 *
 * Arguments:
 * 0: options <STRING[]> - Potential entities.
 * 1: candidate <STRING> - Value to find in options
 *
 * Return Value:
 * True if found, false otherwise
 *
 * Public: YES
 */

params [
  ["_options", [], [[]]],
  ["_candidate", "", [""]]
];

toLower _candidate in (_options apply { toLower _x });
