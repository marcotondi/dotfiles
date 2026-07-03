# posh-git (serve per lo stato di git nel prompt)
Import-Module posh-git -ErrorAction SilentlyContinue

# Oh-My-Posh
$omp_config = Join-Path $PSScriptRoot "..\amro.omp.json"  # Torna alla root
if (Test-Path $omp_config) {
    oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression
} else {
    Write-Warning "Oh-My-Posh config non trovata in $omp_config"
}
