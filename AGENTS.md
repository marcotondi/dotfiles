# Agent Notes

## Platform
- **Windows-only**. All setup is PowerShell. Paths are Windows-style. Do not run on macOS/Linux.

## Deployment Model
- `init.ps1` creates **symbolic links** from standard Windows config paths into this repo.
  - PowerShell profile → `~/Documents/PowerShell/Microsoft.PowerShell_profile.ps1`
  - `coreutils.ps1` → `~/Documents/PowerShell/coreutils.ps1`
  - Personal modules → `~/Documents/PowerShell/Modules/*.ps1` (7 files)
  - oh-my-posh themes → `~/Documents/PowerShell/`
  - `git/.gitconfig` → `~/.gitconfig`
  - `git/.gitconfig-personal` → `~/.gitconfig-personal` (incluso condizionalmente dal main `.gitconfig`)
  - Neovim `init.lua` → `~/AppData/Local/nvim/init.lua`
  - fastfetch config → `~/AppData/Local/fastfetch/config.jsonc`
- `init.ps1` delegates to `modules/{powershell,git,nvim,fastfetch}.ps1` — edit those for symlink changes.
- **After editing config files here, re-run `.\init.ps1`** to refresh symlinks. It is fully idempotent.
- `init.ps1` also installs PowerShell modules (`posh-git`, `PSFzf`, `Terminal-Icons`, `PSWindowsUpdate`) only if missing.
- `uninstall.ps1` removes all symlinks created by `init.ps1`.

## Git
- Default identity is work email. Personal repos under `C:/dev/personal/` auto-switch to personal email via `.gitconfig-personal` (`includeIf`).
- Editor/diff/merge tool is `nvim`. LFS is enabled. `autocrlf = false`, `eol = lf`.
- Aliases are extensive (`st`, `lg`, `sw`, `ds`, `amend`, `bclean`, etc.).

## Neovim
- Uses **lazy.nvim** for plugins. The bootstrap auto-install is **enabled** — lazy.nvim installs automatically if missing.
- Hardcoded `shiftwidth = 2`, `tabstop = 2` despite `.editorconfig` specifying 4 spaces.
- LSP servers configured: `lua_ls`, `pyright`, `ts_ls`, `gopls`, `rust_analyzer`. Add more in the `servers` list in `nvim/init.lua`.
- Autocomplete via nvim-cmp with LSP + snippet + buffer + path sources.
- Treesitter installed for `lua`, `python`, `go`, `rust`, `typescript`, `javascript`; auto-install enabled.

## PowerShell Profile
- Expects `amro.omp.json` in the same directory for oh-my-posh.
- Runs `fastfetch` on every shell start.
- Loads `fnm` for Node.js version management (`--shell powershell` flag).
- `winget.ps1` runs `winget configure` (settings + essential tools) then `winget import` (bulk apps).
- `windows/configuration.winget` — DSC v3 config: Windows settings (dark theme, dev mode, Explorer) + essential dev tools (PowerShell 7, Terminal, Neovim, Git, OhMyPosh, etc.).
- `windows/debloat.ps1` removes Windows bloatware (also one-shot).

## Structure
- `modules/` — standalone `.ps1` scripts called by `init.ps1`
- `windows/` — `configuration.winget` (settings + dev tools), `winget.ps1` (install packages), `debloat.ps1` (bloatware)
