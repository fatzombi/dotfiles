#!/bin/bash

if [[ "$(uname)" == "Darwin" ]]; then
    memory=$(memory_pressure | awk '/percentage/{print $5}')
else
    memory=$(free | grep Mem | awk '{printf "%.0f%%", $3/$2 * 100.0}')
fi

echo "$memory"

