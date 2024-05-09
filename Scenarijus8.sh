#!/bin/bash

# Patikrinamas ar yra failo vardas, pradžios ir pabaigos eilučių numeriai
if [ $# -ne 3 ]; then
    echo "Prasome ivesti failo varda, pradzia ir pabaiga."
    exit 1
fi

# Isskiriame parametrus
file="$1"
start_line="$2"
end_line="$3"

# Tikrinamas ar failas egzistuoja
if [ ! -f "$file" ]; then
    echo "Failas '$file' nerastas."
    exit 1
fi

# Tikrinamas ar pradžios eilutės numeris yra mažesnis už pabaigos eilutės numerį
if [ "$start_line" -ge "$end_line" ]; then
    echo "Pradzios eilutes numeris turi buti mazesnis uz pabaigos eilutes numeri."
    exit 1
fi

# Nuskaitomas failas tarp nurodytu eilucių ir isvedame į ekrana
sed -n "${start_line},${end_line}p" "$file"

