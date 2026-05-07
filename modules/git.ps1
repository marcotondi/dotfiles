param(
    [string]$DotfilesRoot
)

function Write-Step {
    param([string]$Message, [string]$Color = "Green")
    Write-Host "  [git] $Message" -ForegroundColor $Color
}

$null = New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE" -Name ".gitconfig" -Value "$DotfilesRoot\.gitconfig" -Force
Write-Step "Symlink: .gitconfig" "Cyan"

$null = New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE" -Name ".gitconfig-personal" -Value "$DotfilesRoot\.gitconfig-personal" -Force
Write-Step "Symlink: .gitconfig-personal" "Cyan"
