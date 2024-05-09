#Nuskaitomi įvedami parametrai
param (
    [string]$file, #Failo vardas
    [int]$start, #Pirmoji eilute
    [int]$end #Paskutine eilute
)

#Tikrinamo sąlygos
#Tikrinama ar įvesti visi parametrai
if (-not ($file -and $start -and $end)) {
    Write-Host "Turi buti ivesti failo vardas, pradzios ir pabaigos eiluciu numeriai."
}
#Jei įvesti visi parametrai einam toliau
else {
    #Patikrina ar failas egzistuoja
    if (Test-Path $file -PathType Leaf) {
        # Nuskaito failo turinį į masyvą
        $turinys = Get-Content $file

        # Patikrina ar pradžia ir pabaiga yra tinkami
        if ($start -gt 0 -and $end -le $turinys.Count -and $start -le $end) {
            # Išvedama turinys tarp nustatytos pradžios ir pabaigos
            for ($i = $start - 1; $i -lt $end; $i++) {
                Write-Host $turinys[$i]
            }
        }
         # Jei pradžia ir pabaiga nėra tinkami
        else {
            Write-Host "Netinkami pradzia ir pabaiga."
        }
    }
     # Jei failas nėra rastas
    else {
        Write-Host "Failas '$file' nerastas."
    }
}

#Paleidimo atvejis
#.\Scenarijus8.ps1 -file "Tekstas.txt" -start 4 -end 8