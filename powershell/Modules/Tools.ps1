# Node.js via fnm (deve essere eseguito per far funzionare node nella shell)
if (Get-Command fnm -ErrorAction SilentlyContinue) {
    fnm env --use-on-cd --shell powershell | Out-String | Invoke-Expression
}

# Fastfetch (se lo vuoi all'avvio, altrimenti commentalo)
if (Get-Command fastfetch -ErrorAction SilentlyContinue) {
    fastfetch
}

# Banner ASCII
Write-Host "░█░█░█▀█░█▀█░█▀█░█░█░░░█▀▀░█▀█░█▀▄░▀█▀░█▀█░█▀▀" -ForegroundColor Yellow
Write-Host "░█▀█░█▀█░█▀▀░█▀▀░░█░░░░█░░░█░█░█░█░░█░░█░█░█░█" -ForegroundColor Yellow
Write-Host "░▀░▀░▀░▀░▀░░░▀░░░░▀░░░░▀▀▀░▀▀▀░▀▀░░▀▀▀░▀░▀░▀▀▀" -ForegroundColor Yellow
Write-Host
