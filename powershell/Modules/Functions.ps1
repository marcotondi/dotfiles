# Funzione per Bat senza paging
function Get-BatNp {
    bat --paging=never $args
}

# Funzione touch
function Update-File {
    param ([string]$Path)
    if (-not (Test-Path -Path $Path)) {
        New-Item -ItemType File -Path $Path | Out-Null
    } else {
        (Get-Item -Path $Path).LastWriteTime = Get-Date
    }
}

# Funzione which
function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
        Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

# Funzione mkcd
function mkcd {
    param($directory)
    New-Item -ItemType Directory -Path $directory -Force | Out-Null
    Set-Location $directory
}

# Funzione reload profile (rs)
function rs {
    Clear-Host
    & $profile
}

# Funzione per la cronologia PERSISTENTE (questa è la nuova versione)
function Get-PSReadHistory {
    param(
        [int]$Last = 0,
        [int]$First = 0
    )
    $historyPath = (Get-PSReadLineOption).HistorySavePath
    $lines = Get-Content $historyPath

    if ($Last -gt 0) {
        $lines = $lines | Select-Object -Last $Last
    } elseif ($First -gt 0) {
        $lines = $lines | Select-Object -First $First
    }

    $i = 0
    foreach ($line in $lines) {
        "{0} {1}" -f $i++, $line
    }
}
