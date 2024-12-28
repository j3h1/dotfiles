#!/bin/bash

p=$(acpi | cut -d',' -f2) && p=${p:1:-1}
c=$(acpi | cut -d',' -f1) && c=$(echo "$c" | cut -d':' -f2) && c=${c:1}

echo "{\"percent\": $p, \"state\": \"$c\"}"