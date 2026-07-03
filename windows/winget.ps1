#Requires -Version 5.1

[CmdletBinding()]
param(
    [switch]$SkipConfigure,
    [switch]$SkipImport
)

$ErrorActionPreference = 'Stop'

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$configPath = Join-Path $scriptDir 'configuration.winget'
$appJsonPath = Join-Path $scriptDir 'app.json'
$debloatPath = Join-Path $scriptDir 'debloat.ps1'

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

# --- Phase 1: winget configure (settings + essential tools) ---
if (-not $SkipConfigure -and (Test-Path $configPath)) {
    Write-Host ">>> Applicazione configurazione Windows (settings + dev tools)..." -ForegroundColor Green
    Write-Host "    winget configure -f $configPath" -ForegroundColor Cyan
    & winget configure -f $configPath --accept-configuration-agreements --disable-interactivity
    if ($LASTEXITCODE -ne 0) {
        Write-Warning "winget configure terminato con exit code $LASTEXITCODE. Alcune risorse potrebbero non essere state applicate."
    }
} elseif (-not (Test-Path $configPath)) {
    Write-Warning "configuration.winget non trovato in: $configPath"
}

# --- Phase 2: winget import (app bulk) ---
if (-not $SkipImport) {
    if (-not (Test-Path $appJsonPath)) {
        Write-Error "app.json non trovato in: $appJsonPath"
        exit 1
    }
    Write-Host ">>> Importazione applicazioni da app.json..." -ForegroundColor Green
    & winget import --import-file $appJsonPath `
        --accept-package-agreements `
        --accept-source-agreements `
        --ignore-unavailable `
        --ignore-versions
}
