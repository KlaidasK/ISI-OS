#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Iveskite tekstini faila."
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Failas '$1' nerastas."
    exit 1
fi

tmp_file=$(mktemp)


awk 'NR%2{printf "%s ", $0; next} 1' "$1" > "$tmp_file"

while IFS= read -r line; do
    echo "Naujos eilutes ilgis: ${#line}"
done < "$tmp_file"

rm "$tmp_file"

