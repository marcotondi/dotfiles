# .dotfiles

Personal Windows dotfiles — Neovim, Git, PowerShell, and fastfetch configurations managed via symlinks.

## Quick Start

```powershell
git clone https://github.com/marcotondi/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
.\init.ps1
```

Restart your terminal to pick up the new profile. Running `init.ps1` will:

1. Install required PowerShell modules (`posh-git`, `PSFzf`, `Terminal-Icons`, etc.)
2. Ask if you want to run `winget configure` for Windows settings + essential dev tools
3. Create symlinks for all config files (profile, gitconfig, nvim, fastfetch)

## Usage

| Command | What it does |
|---|---|
| `.\init.ps1` | Full bootstrap (modules → winget → symlinks) |
| `.\windows\winget.ps1` | `winget configure` + `winget import` (all apps) |
| `.\windows\winget.ps1 -SkipConfigure` | Only `winget import` (bulk apps from `app.json`) |
| `.\windows\winget.ps1 -SkipImport` | Only `winget configure` (settings + essential tools) |
| `winget configure -f .\windows\configuration.winget --accept-configuration-agreements --disable-interactivity` | Apply Windows settings + dev tools directly |
| `.\windows\debloat.ps1` | Remove Windows pre-installed bloatware (one-shot) |
| `.\uninstall.ps1` | Remove all symlinks created by `init.ps1` |

## Contents

| Directory/File | Description |
|---|---|
| `init.ps1` | Bootstrap — installs modules and creates symlinks (idempotent) |
| `uninstall.ps1` | Removes all symlinks created by `init.ps1` |
| `modules/` | Modular setup scripts (powershell, git, nvim, fastfetch) |
| `windows/` | `configuration.winget` (DSC v3 — settings + tools), `winget.ps1` (configure + import), `debloat.ps1` (bloatware removal) |
| `powershell/` | Modular profile (`coreutils.ps1` + 7 personal modules) + oh-my-posh themes |
| `nvim/init.lua` | Neovim config (lazy.nvim, LSP, cmp, treesitter) |
| `git/` | `.gitconfig` — aliases, editor, diff/merge tooling |
| `fastfetch/` | System info display config |

## Uninstall

```powershell
.\uninstall.ps1
```

Inspiration: [craftzdog/dotfiles-public](https://github.com/craftzdog/dotfiles-public), [jayharris/dotfiles-windows](https://github.com/jayharris/dotfiles-windows)
