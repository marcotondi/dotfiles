param(
    [string]$DotfilesRoot
)

function Write-Step {
    param([string]$Message, [string]$Color = "Green")
    Write-Host "  [nvim] $Message" -ForegroundColor $Color
}

$nvimDir = "$env:USERPROFILE\AppData\Local\nvim"
if (-not (Test-Path $nvimDir)) {
    $null = New-Item -ItemType Directory -Path $nvimDir -Force
    Write-Step "Created directory: $nvimDir" "Yellow"
}

$null = New-Item -ItemType SymbolicLink -Path $nvimDir -Name "init.lua" -Value "$DotfilesRoot\nvim\init.lua" -Force
Write-Step "Symlink: init.lua" "Cyan"
