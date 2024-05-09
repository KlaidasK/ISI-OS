#!/bin/bash

# Patikrinamas ar buvo perduoti bent du argumentai
if [ $# -lt 2 ]; then
    echo "Prašome perduoti bent du failo vardus kaip argumentus."
    exit 1
fi

# Einam per kiekvieną argumentą
for file in "$@"; do
    # Tikrinamas ar failas egzistuoja
    if [ -f "$file" ]; then
        uppercase=$(echo "$file" | tr '[:lower:]' '[:upper:]')
        
        # Patikrinamas ar tokio pavadinimo failas dar neegzistuoja
        if [ ! -f "$uppercase" ]; then
            # Pervadiname failą į didžiąsias raides
            mv "$file" "$uppercase"
            echo "Failas $file pervadintas į $uppercase"
        else
            echo "Failas $uppercase jau egzistuoja."
        fi
    else
        echo "Failas $file nerastas arba tai nėra failo vardas."
    fi
done

