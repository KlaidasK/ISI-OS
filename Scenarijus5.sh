#!/bin/bash

# Patikrinamas ar buvo perduotas argumentas
if [ $# -eq 0 ]; then
    echo "Prašome įvesti failo arba katalogo vardą kaip argumentą."
    exit 1
fi

# Patikrinamas ar egzistuoja failas
if [ -f "$1" ]; then
    echo "$1 yra failo vardas."
# Patikrinamas ar egzistuoja katalogas
elif [ -d "$1" ]; then
    echo "$1 yra katalogo vardas."
# Jei nei failas, nei katalogas, tai kažkas kita
else
    echo "$1 yra nežinomas objekto tipas."
fi

