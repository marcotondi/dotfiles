###############################################################################
### Init .DotFile Configurations                                              #
###############################################################################

$dotfilesRoot = $PSScriptRoot

function Write-Step {
    param([string]$Message, [string]$Color = "Green")
    Write-Host ">>> $Message" -ForegroundColor $Color
}

function Install-ModuleIfMissing {
    param([string]$Name)
    if (-not (Get-Module -ListAvailable -Name $Name)) {
        Write-Step "Installing module: $Name" "Yellow"
        Install-Module -Name $Name -Scope CurrentUser -Force -SkipPublisherCheck
    } else {
        Write-Step "Module already installed: $Name" "Cyan"
    }
}

# --- Install PowerShell Modules ---
Write-Step "Installing PowerShell modules..." "Yellow"
Install-ModuleIfMissing "posh-git"
Install-ModuleIfMissing "PSFzf"
Install-ModuleIfMissing "Terminal-Icons"
Install-ModuleIfMissing "Microsoft.WinGet.CommandNotFound"
Install-ModuleIfMissing "PSWindowsUpdate"

# --- Windows Configuration (winget configure) ---
$configFile = "$dotfilesRoot\windows\configuration.winget"
if (Test-Path $configFile) {
    $response = Read-Host ">>> Applicare configurazione Windows (tema scuro, esplora file, dev tools)? (y/N)"
    if ($response -eq 'y' -or $response -eq 'Y') {
        Write-Step "Eseguo winget configure..." "Yellow"
        winget configure -f $configFile --accept-configuration-agreements --disable-interactivity
        if ($LASTEXITCODE -eq 3010 -or $LASTEXITCODE -eq 1641) {
            Write-Step "Riavvio necessario per completare la configurazione." "Magenta"
        }
    }
} else {
    Write-Step "Configurazione Windows non trovata (windows\configuration.winget), salto." "Magenta"
}

# --- Create Symbolic Links ---
Write-Step "Creating symbolic links..." "Yellow"

. "$dotfilesRoot\modules\powershell.ps1" -DotfilesRoot $dotfilesRoot
. "$dotfilesRoot\modules\git.ps1" -DotfilesRoot $dotfilesRoot
. "$dotfilesRoot\modules\nvim.ps1" -DotfilesRoot $dotfilesRoot
. "$dotfilesRoot\modules\fastfetch.ps1" -DotfilesRoot $dotfilesRoot

Write-Step "Done! Restart your terminal to apply changes." "Green"
