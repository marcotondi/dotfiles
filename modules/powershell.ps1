param(
    [string]$DotfilesRoot
)

function Write-Step {
    param([string]$Message, [string]$Color = "Green")
    Write-Host "  [powershell] $Message" -ForegroundColor $Color
}

$psDir = "$env:USERPROFILE\Documents\PowerShell"
if (-not (Test-Path $psDir)) {
    $null = New-Item -ItemType Directory -Path $psDir -Force
}

$null = New-Item -ItemType SymbolicLink -Path $psDir -Name "Microsoft.PowerShell_profile.ps1" -Value "$DotfilesRoot\powershell\profile.ps1" -Force
Write-Step "Symlink: profile.ps1" "Cyan"

$null = New-Item -ItemType SymbolicLink -Path $psDir -Name "takuya.omp.json" -Value "$DotfilesRoot\powershell\takuya.omp.json" -Force
Write-Step "Symlink: takuya.omp.json" "Cyan"

$null = New-Item -ItemType SymbolicLink -Path $psDir -Name "amro.omp.json" -Value "$DotfilesRoot\powershell\amro.omp.json" -Force
Write-Step "Symlink: amro.omp.json" "Cyan"

$null = New-Item -ItemType SymbolicLink -Path $psDir -Name "coreutils.ps1" -Value "$DotfilesRoot\powershell\coreutils.ps1" -Force
Write-Step "Symlink: coreutils.ps1" "Cyan"

$modulesDir = "$DotfilesRoot\powershell\Modules"
if (Test-Path $modulesDir) {
    $modules = Get-ChildItem -Path $modulesDir -File
    foreach ($module in $modules) {
        $null = New-Item -ItemType SymbolicLink -Path "$psDir\Modules" -Name $module.Name -Value $module.FullName -Force
        Write-Step "Symlink: Modules\$($module.Name)" "Cyan"
    }
}
