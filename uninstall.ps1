###############################################################################
### Uninstall .DotFile Configurations                                         #
###############################################################################

function Write-Step {
    param([string]$Message, [string]$Color = "Red")
    Write-Host ">>> $Message" -ForegroundColor $Color
}

$links = @(
    "$env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
    "$env:USERPROFILE\Documents\PowerShell\takuya.omp.json"
    "$env:USERPROFILE\Documents\PowerShell\amro.omp.json"
    "$env:USERPROFILE\.gitconfig"
    "$env:USERPROFILE\.gitconfig-personal"
    "$env:USERPROFILE\AppData\Local\nvim\init.lua"
    "$env:USERPROFILE\AppData\Local\fastfetch\config.jsonc"
)

Write-Step "Removing symlinks..." "Yellow"

foreach ($link in $links) {
    if (Test-Path $link) {
        Remove-Item -Path $link -Force
        Write-Step "Removed: $link" "Red"
    } else {
        Write-Step "Not found: $link" "DarkGray"
    }
}

Write-Step "Done. Your dotfiles symlinks have been removed." "Green"
