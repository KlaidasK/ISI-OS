#Įvedami parametrai
param (
    [string]$katalogas, #Katalogo vieta
    [string]$zodis #Žodis pagal kurį bus trinama
)

# Patikrinama ar parametrai įvesti
if (-not ($katalogas -and $zodis)) {
    Write-Host "Turite ivesti katalogo vieta ir zodi."
}
else {
    # Patikrinama ar katalogas egzistuoja
    if (Test-Path $katalogas -PathType Container) {
        #Ieškomi failai su žodžiu
        $files = Get-ChildItem $katalogas -File | Where-Object { $_.Name -match $zodis }

        # Patikrinama ar buvo rasti failai su žodžiu
        if ($files.Count -gt 0) {
            # Ištrinami failai su žodžiu
            foreach ($file in $files) {
                Remove-Item $file.FullName -Force
                Write-Host "Failas $($file.Name) buvo istrintas."
            }
        }
        else {
            Write-Host "Failai su  '$zodis' nebuvo rasti."
        }
    }
    else {
        Write-Host "Katalogas '$katalogas' nebuvo rastas."
    }
}

#Paleidimo atvejis
#.\Scenarijus9.ps1 -katalogas "C:\Users\klaid\Desktop\Study-Year-2\2-semestras\Operacines sistemos\3_prakt" -zodis "pavadinimas"