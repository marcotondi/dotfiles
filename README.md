# .dotfiles

Personal Windows dotfiles — Neovim, Git, PowerShell, and fastfetch configurations managed via symlinks.

## Quick Start

```powershell
git clone https://github.com/marcotondi/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
.\init.ps1
```

Restart your terminal to pick up the new profile.

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
