param(
    [string]$DotfilesRoot
)

function Write-Step {
    param([string]$Message, [string]$Color = "Green")
    Write-Host "  [fastfetch] $Message" -ForegroundColor $Color
}

$ffDir = "$env:USERPROFILE\AppData\Local\fastfetch"
if (-not (Test-Path $ffDir)) {
    $null = New-Item -ItemType Directory -Path $ffDir -Force
    Write-Step "Created directory: $ffDir" "Yellow"
}

$null = New-Item -ItemType SymbolicLink -Path $ffDir -Name "config.jsonc" -Value "$DotfilesRoot\fastfetch\config.jsonc" -Force
Write-Step "Symlink: config.jsonc" "Cyan"
