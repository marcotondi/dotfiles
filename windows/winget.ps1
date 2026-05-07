#Requires -Version 5.1

[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$appJsonPath = Join-Path $scriptDir 'app.json'
$debloatPath = Join-Path $scriptDir 'debloat.ps1'

if (-not (Test-Path $appJsonPath)) {
    Write-Error "File app.json non trovato in: $appJsonPath"
    exit 1
}

# --- Debloat ---
$debloatResponse = Read-Host "Vuoi eseguire il debloat delle app Windows preinstallate? (y/N)"
if ($debloatResponse -eq 'y' -or $debloatResponse -eq 'Y') {
    if (Test-Path $debloatPath) {
        Write-Host "Avvio debloat..." -ForegroundColor Yellow
        & $debloatPath
    } else {
        Write-Warning "debloat.ps1 non trovato in: $debloatPath"
    }
}

# --- Import app ---
Write-Host "Importazione applicazioni da app.json..." -ForegroundColor Green
winget import --import-file $appJsonPath `
    --accept-package-agreements `
    --accept-source-agreements `
    --ignore-unavailable `
    --ignore-versions
