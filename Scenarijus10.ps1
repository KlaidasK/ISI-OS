#Įvedami parametrai
param (
    [string]$file
)

# Patikriname, ar buvo perduotas failo vardas
if (-not $file) {
    Write-Host "Prasome ivesti tekstinio failo varda."
}
else {
    # Patikriname, ar failas egzistuoja
    if (Test-Path $file -PathType Leaf) {
        # Nuskaitome failo turinį į masyvą
        $turinys = Get-Content $file

        # Naujų eilučių ilgių kintamasis
        $newLengths = @()

        # Einame per kiekvieną dvi eilutes
        for ($i = 0; $i -lt $turinys.Count; $i += 2) {
            # Apjungiame dvi eilutes į vieną
            $combinedLine = $turinys[$i] + " " + $turinys[$i+1]

            # Apskaičiuojame naujos eilutės ilgį ir pridedame prie masyvo
            $newLength = $combinedLine.Length
            $newLengths += $newLength

            # Išvedame apjungtą eilutę
            Write-Host "Apjungta eilute ($i, $($i+1)): $combinedLine"
        }

        # Išvedame visų naujų eilučių ilgius į ekraną
        Write-Host "Nauju eilučiu ilgiai:"
        $newLengths
    }
    #Failas nerastas
    else {
        Write-Host "Failas '$file' nerastas."
    }
}

#Paleidimo atvejis
#.\Scenarijus10.ps1 -file "Tekstas.txt"