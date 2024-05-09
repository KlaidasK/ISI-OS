param (
    [string]$username
)

# Patikrinamas, ar buvo perduotas naudotojo vardas kaip parametras
if (-not $username) {
    Write-Host "Prašome įvesti naudotojo vardą kaip parametrą."
}
else {
    #Gaunama naudotojo prisijungimo informacija
    $user = Get-WmiObject -Class Win32_UserAccount | Where-Object { $_.Name -eq $username }

    # Patikrinama ar naudotojas buvo rastas
    if ($user) {
        # Patikrinama ar yra prisijungimo informacija
        if ($user.LastLogin) {
            # Gaunamas naudotojo prisijungimo laikas
            $lastLogin = $user.ConvertToDateTime($user.LastLogin)

            # Paskaičiuojama, kiek laiko naudotojas dirba
            $timeDiff = (Get-Date) - $lastLogin

            # Išvedamas rezultatas
            Write-Host "Naudotojas '$username' dirba sistemoje jau $($timeDiff.Days) dienų, $($timeDiff.Hours) valandų ir $($timeDiff.Minutes) minučių."
        }
        else {
            Write-Host "Naudotojas '$username' neturi prisijungimo informacijos."
        }
    }
    else {
        Write-Host "Naudotojas '$username' nerastas sistemoje."
    }
}

#Paleidimo atvejis
#.\Scenarijus7 -username "user01"