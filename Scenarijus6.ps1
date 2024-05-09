if ($args.Count -lt 2) {
    Write-Host "Turi buti bent du failai ivesti."
}
else {
    foreach ($file in $args) {
        # Patikrinkite, ar failas egzistuoja
        if (Test-Path $file -PathType Leaf) {
            # Gauti failo pavadinima be kelio
            $filename = Split-Path -Leaf $file
            # Ar failo pavadinimas jau yra didziosiomis raidėmis
            if ($filename -cne $filename.ToUpper()) {
                # Pervadinimas
                Rename-Item $file -NewName $filename.ToUpper() -Force
                Write-Host "Failas $file pervadintas į $($filename.ToUpper())."
            }
            else {
                Write-Host "Failas $file jau yra su didziosiomis raidemis."
            }
        }
        else {
            Write-Host "$file neegzistuoja."
        }
    }
}

#Paleidimo atvejis
#.\Scenarijus6.ps1 tekst1.txt tekst2.txt