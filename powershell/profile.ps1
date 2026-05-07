# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# Prompt (oh-my-posh)
Import-Module posh-git
$omp_config = Join-Path $PSScriptRoot "amro.omp.json"
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression

# Terminal icons
Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Env
$env:GIT_SSH = "$env:SystemRoot\system32\OpenSSH\ssh.exe"

# Aliases
Set-Alias -Name vim -Value nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias k kubectl
Set-Alias -Name touch -Value 'Update-File'
Set-Alias cat Get-BatNp

# Functions
function Get-BatNp {
    bat --paging=never $args
}

function Update-File {
    param ([string]$Path)
    if (-not (Test-Path -Path $Path)) {
        New-Item -ItemType File -Path $Path | Out-Null
    } else {
        (Get-Item -Path $Path).LastWriteTime = Get-Date
    }
}

function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
        Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function mkcd {
    param($directory)
    New-Item -ItemType Directory -Path $directory -Force | Out-Null
    Set-Location $directory
}

function rs {
    Clear-Host
    & $profile
}

# Start fastfetch
fastfetch

# Node.js via fnm
fnm env --use-on-cd --shell powershell | Out-String | Invoke-Expression

# WinGet command-not-found
Import-Module -Name Microsoft.WinGet.CommandNotFound

Write-Host "░█░█░█▀█░█▀█░█▀█░█░█░░░█▀▀░█▀█░█▀▄░▀█▀░█▀█░█▀▀" -ForegroundColor Yellow
Write-Host "░█▀█░█▀█░█▀▀░█▀▀░░█░░░░█░░░█░█░█░█░░█░░█░█░█░█" -ForegroundColor Yellow
Write-Host "░▀░▀░▀░▀░▀░░░▀░░░░▀░░░░▀▀▀░▀▀▀░▀▀░░▀▀▀░▀░▀░▀▀▀" -ForegroundColor Yellow
Write-Host

