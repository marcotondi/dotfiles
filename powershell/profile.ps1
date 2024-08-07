# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

Import-Module posh-git
$omp_config = Join-Path $PSScriptRoot ".\takuya.omp.json"
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression
Import-Module -Name Terminal-Icons

# PSReadLine
# Set-PSReadLineOption -EditMode Emacs
# Set-PSReadLineOption -BellStyle None
# Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History
# menu complete using TAB instead of CTRL+SPACE
Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete
# up&down arrow for history search
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Env
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"

# Alias
Set-Alias -Name vim -Value nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias k 'kubectl'
Set-Alias cat 'bat-np'

# Utilities
function bat-np {
    bat --paging=never $args
}

function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function mkcd {
	Param($directory)
	mkdir -p $directory
	cd $directory
}

function reload {
    clear
	& $profile
}

# Start fastfetch
fastfetch

Write-Host "            ╔╗───────────────────────╔╗"        -ForegroundColor Yellow
Write-Host "            ║║───────────────────────║║"        -ForegroundColor Yellow
Write-Host "            ║╚═╦══╦══╦══╦╗─╔╗╔══╦══╦═╝╠╦═╗╔══╗" -ForegroundColor Yellow
Write-Host "            ║╔╗║╔╗║╔╗║╔╗║║─║║║╔═╣╔╗║╔╗╠╣╔╗╣╔╗║" -ForegroundColor Yellow
Write-Host "            ║║║║╔╗║╚╝║╚╝║╚═╝║║╚═╣╚╝║╚╝║║║║║╚╝║" -ForegroundColor Yellow
Write-Host "            ╚╝╚╩╝╚╣╔═╣╔═╩═╗╔╝╚══╩══╩══╩╩╝╚╩═╗║" -ForegroundColor Yellow
Write-Host "            ──────║║─║║─╔═╝║──────────────╔═╝║" -ForegroundColor Yellow
Write-Host "            ──────╚╝─╚╝─╚══╝──────────────╚══╝" -ForegroundColor Yellow
Write-Host
