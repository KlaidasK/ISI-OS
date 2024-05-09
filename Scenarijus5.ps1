# Patikrinkite, ar yra pateiktas bent vienas argumentas
if ($args.Count -eq 0) {
    Write-Host "Nepateiktas argumentas."
}
else {
    # Patikrinkite, ar argumentas yra failo vardas
    if (Test-Path $args[0] -PathType Leaf) {
        Write-Host "$($args[0]) yra failo vardas."
    }
    # Patikrinkite, ar argumentas yra direktorijos vardas
    elseif (Test-Path $args[0] -PathType Container) {
        Write-Host "$($args[0]) yra direktorijos vardas."
    }
    else {
        Write-Host "Argumentas $($args[0]) nesa nei failo nei direktorijos vardas."
    }
}
