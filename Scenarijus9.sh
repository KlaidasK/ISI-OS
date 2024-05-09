#!/bin/bash

# Patikrinama parametrai
if [ $# -ne 2 ]; then
    echo "Iveskite zodi ir aplanka."
    exit 1
fi

# Tikrinama ar nurodytas aplankalas egzistuoja
if [ ! -d "$2" ]; then
    echo "Aplankalas '$2' nerastas."
    exit 1
fi

directory=$(realpath "$2")

# Trinami failai, kuriu pavadinime yra nurodytas zodis
find "$directory" -type f -name "*$1*" -exec rm -f {} +

echo "Visi failai su zodziu '$1' iš aplankalo '$directory' buvo istrinti."

