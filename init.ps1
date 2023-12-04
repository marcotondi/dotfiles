###############################################################################
### Init .DotFile Configurations                                              #
###############################################################################
# SymbolicLink # HardLink

#INSTALL MODULE
Install-Module -Name  posh-git -Scope CurrentUser -Force
Install-Module -Name PSFzf -Scope CurrentUser -Force
Install-Module -Name  Terminal-Icons -Scope CurrentUser -Force

# SymbolicLink # HardLink
# PowerShell profile
new-item -itemtype symboliclink -path "$env:USERPROFILE\Documents\PowerShell" -name Microsoft.PowerShell_profile.ps1 -value "$env:USERPROFILE\.dotfile\powershell\profile.ps1"
new-item -itemtype symboliclink -path "$env:USERPROFILE\Documents\PowerShell" -name takuya.omp.json -value "$env:USERPROFILE\.dotfile\powershell\takuya.omp.json"
    
# .gitconifg
New-Item -ItemType symboliclink -Path "$env:USERPROFILE" -Name ".gitconfig" -Value "$env:USERPROFILE\.dotfile\.gitconfig"

# NeoVim
mkdir $env:USERPROFILE\AppData\Local\nvim
New-Item -ItemType symboliclink -Path "$env:USERPROFILE\AppData\Local\nvim" -Name "init.lua" -Value "$env:USERPROFILE\.dotfile\nvim\init.lua"

