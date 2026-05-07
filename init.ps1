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
Install-ModuleIfMissing "PSWindowsUpdate"

# --- Create Symbolic Links ---
Write-Step "Creating symbolic links..." "Yellow"

. "$dotfilesRoot\modules\powershell.ps1" -DotfilesRoot $dotfilesRoot
. "$dotfilesRoot\modules\git.ps1" -DotfilesRoot $dotfilesRoot
. "$dotfilesRoot\modules\nvim.ps1" -DotfilesRoot $dotfilesRoot
. "$dotfilesRoot\modules\fastfetch.ps1" -DotfilesRoot $dotfilesRoot

Write-Step "Done! Restart your terminal to apply changes." "Green"
