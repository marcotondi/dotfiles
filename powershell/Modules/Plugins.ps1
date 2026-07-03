# Terminal Icons
Import-Module -Name Terminal-Icons -ErrorAction SilentlyContinue

# PSFzf (con i suoi key binding)
Import-Module PSFzf -ErrorAction SilentlyContinue
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# WinGet command-not-found
Import-Module -Name Microsoft.WinGet.CommandNotFound -ErrorAction SilentlyContinue
