# Dotfiles

Personal dev environment — Sway WM, terminal tools, and editor configs.

## Quick Setup

```bash
git clone git@github.com:SeyBoo/dotfiles.git
cd dotfiles && bash setup.sh
```

`setup.sh` installs everything from scratch:
- System packages (git, curl, jq, fzf, ripgrep, fd, zoxide, bat, eza, neovim)
- Python + uv
- Node.js + nvm (LTS)
- Go
- Rust (rustup)
- Docker
- Claude Code + OpenCode
- Nerd Fonts (JetBrains Mono)
- Starship prompt
- Lazygit
- MCP servers (Playwright, Context7, Serena)

## Structure

```
.config/
├── claude/          # Claude Code config
│   ├── CLAUDE.md    # Global preferences
│   ├── settings.json
│   ├── statusline.sh
│   ├── mcp-setup.sh
│   └── hooks/
├── git/
│   └── gitconfig    # Git aliases + delta
├── kitty/           # Terminal emulator
├── nvim/            # Neovim config (lazy.nvim)
├── sway/            # Tiling WM
├── waybar/          # Status bar
├── ghostty/         # Alternative terminal
├── rofi/            # App launcher
├── btop/            # System monitor
├── wallust/         # Color scheme generator
├── wezterm/         # Alternative terminal
└── ...
```

## Neovim

Plugins managed by [lazy.nvim](https://github.com/folke/lazy.nvim):

| Plugin | Purpose |
|--------|---------|
| catppuccin | Theme (mocha) |
| telescope | Fuzzy finder |
| nvim-treesitter | Syntax highlighting |
| nvim-lspconfig + mason | LSP servers |
| nvim-cmp + luasnip | Autocompletion |
| gitsigns | Git hunks |
| nvim-tree | File explorer |
| lualine | Status line |
| harpoon | Quick file navigation |
| which-key | Keybinding hints |
| indent-blankline | Indent guides |
| Comment.nvim | Toggle comments |
| nvim-autopairs | Auto-close brackets |

Key bindings (leader = space):

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>e` | Toggle file explorer |
| `<leader>a` | Harpoon: add file |
| `<leader>1-4` | Harpoon: select file |
| `gd` | Go to definition |
| `gr` | References |
| `<leader>rn` | Rename |
| `<leader>ca` | Code action |
| `<leader>fm` | Format |

## Git Aliases

| Alias | Command |
|-------|---------|
| `git st` | status |
| `git civ` | commit -v |
| `git la` | Detailed log (hash, date, author, branch, message) |
| `git lol` | One-line graph |
| `git lg` | One-line graph + decorate |
| `git br` | branch |
| `git co` | checkout |
| `git unstage` | reset HEAD -- |
| `git amend` | commit --amend |
| `git wip` | commit -m 'wip' |
| `git fixup` | commit --fixup |
| `git squash` | rebase -i --autosquash |
| `git undo` | reset HEAD~1 --mixed |

## Claude Code

Real-time usage statusline + MCP servers:

- **Playwright** — browser automation
- **Context7** — library docs lookup
- **Serena** — semantic code search

Run `claude` and the statusline shows session/weekly usage % automatically.

## Sway

Tiling Wayland WM with:
- **waybar** — status bar (catppuccin theme)
- **rofi** — app launcher
- **wallust** — dynamic color scheme from wallpaper
- **swaync** — notifications
- **swaylock** — screen lock
- **wlogout** — logout menu
