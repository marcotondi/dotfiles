# ----------------------------------------------------------------------
# 1. IMPOSTAZIONI FONDAMENTALI (UTF-8)
# ----------------------------------------------------------------------
[console]::InputEncoding = [console]::OutputEncoding = [System.Text.UTF8Encoding]::new()

# ----------------------------------------------------------------------
# 2. CARICAMENTO DI coreutils.ps1 (DEVE essere il PRIMO)
# ----------------------------------------------------------------------
$CoreUtils = Join-Path $PSScriptRoot "coreutils.ps1"
if (Test-Path $CoreUtils) {
    . $CoreUtils
}

# ----------------------------------------------------------------------
# 3. CARICAMENTO MODULI PERSONALI (dopo coreutils, per eventuali override)
# ----------------------------------------------------------------------
$PrivateModules = Join-Path $PSScriptRoot "Modules"

# Ordine di caricamento dei tuoi moduli personali
$LoadOrder = @(
    "Environment.ps1",   # Variabili d'ambiente
    "Functions.ps1",     # Le tue funzioni (Get-PSReadHistory, mkcd, which...)
    "Aliases.ps1",       # I tuoi alias (cat, ph, vim...)
    "PSReadLine.ps1",    # Configurazione PSReadLine
    "Plugins.ps1",       # Terminal-Icons, PSFzf, Winget
    "Prompt.ps1",        # Oh-My-Posh + posh-git
    "Tools.ps1"          # Fastfetch, FNM, Banner
)

foreach ($file in $LoadOrder) {
    $path = Join-Path $PrivateModules $file
    if (Test-Path $path) {
        . $path
    }
}
