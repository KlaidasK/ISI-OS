#!/bin/bash

# Patikrinamas parametrai
if [ $# -eq 0 ]; then
    echo "Prašome įvesti naudotojo varda."
    exit 1
fi

# Gaunama naudotojo prisijungimo informaciją
last_log=$(last "$1" | head -n 1)

# Patikrinamas ar naudotojas buvo rastas
if [ -n "$last_log" ]; then
    # Ištraukti paskutinio prisijungimo laiką
    last_login=$(echo "$last_log" | awk '{print $4, $5, $6, $7}')

    # Konvertuoti paskutinio prisijungimo laiką į sekundes nuo epochos
    last_login_seconds=$(date -d "$last_login" +%s)

    # Paskaičiuoti, kiek laiko naudotojas dirba
    current_time_seconds=$(date +%s)
    time_diff=$((current_time_seconds - last_login_seconds))
    days=$((time_diff / (60*60*24)))
    hours=$((time_diff / (60*60) % 24))
    minutes=$((time_diff / 60 % 60))

    # Išvesti rezultatą
    echo "Naudotojas '$1' dirba sistemoje jau $days dienų, $hours valandų ir $minutes minučių."
else
    echo "Naudotojas '$1' nerastas sistemoje."
fi

