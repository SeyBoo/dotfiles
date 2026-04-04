#!/bin/bash
# System setup script — installs all dev tools from scratch
# Usage: bash setup.sh

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

info()  { echo -e "${GREEN}✓${NC} $1"; }
warn()  { echo -e "${YELLOW}!${NC} $1"; }
error() { echo -e "${RED}✗${NC} $1"; }

# ── Detect OS ────────────────────────────────────────────
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
else
    error "Cannot detect OS"
    exit 1
fi

install_pkg() {
    case $OS in
        arch|manjaro|endeavouros)
            pacman -Syu --noconfirm "$1" 2>/dev/null || true
            ;;
        fedora)
            dnf install -y "$1" 2>/dev/null || true
            ;;
        ubuntu|debian|pop|linuxmint)
            apt-get install -y "$1" 2>/dev/null || true
            ;;
        *)
            warn "Unknown OS ($OS), skipping $1"
            ;;
    esac
}

has() { command -v "$1" &>/dev/null; }

# ── System packages ─────────────────────────────────────
echo "── System packages ──"

for pkg in git curl wget jq tree fzf ripgrep fd zoxide bat eza neovim; do
    if has "$pkg"; then info "$pkg already installed"; else install_pkg "$pkg"; fi
done

# ── Python ───────────────────────────────────────────────
echo "── Python ──"
if has python3; then info "python3 $(python3 --version)"; else install_pkg python3; fi
if has pip3; then info "pip3 installed"; else install_pkg python3-pip; fi

if ! has uv; then
    curl -LsSf https://astral.sh/uv/install.sh | sh
    export PATH="$HOME/.local/bin:$PATH"
    info "uv installed"
else
    info "uv already installed"
fi

# ── Node.js + nvm ────────────────────────────────────────
echo "── Node.js + nvm ──"
if [ -d "$HOME/.nvm" ]; then
    info "nvm already installed"
else
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    info "nvm installed"
fi

if ! has node; then
    nvm install --lts
    info "node $(node --version) installed"
else
    info "node $(node --version) already installed"
fi

# ── Go ───────────────────────────────────────────────────
echo "── Go ──"
if has go; then
    info "go $(go version)"
else
    GO_VERSION=$(curl -s https://go.dev/VERSION?m=text | head -1)
    curl -fsSL "https://golang.org/dl/${GO_VERSION}.linux-amd64.tar.gz" | tar -C /usr/local -xz
    export PATH="/usr/local/go/bin:$PATH"
    info "go installed"
fi

# ── Rust ─────────────────────────────────────────────────
echo "── Rust ──"
if has rustc; then
    info "rustc $(rustc --version)"
else
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
    info "rustc installed"
fi

# ── Claude Code ──────────────────────────────────────────
echo "── Claude Code ──"
if has claude; then
    info "claude $(claude --version 2>/dev/null || echo 'installed')"
else
    npm install -g @anthropic-ai/claude-code
    info "claude code installed"
fi

# ── OpenCode ─────────────────────────────────────────────
echo "── OpenCode ──"
if has opencode; then
    info "opencode installed"
else
    curl -fsSL https://opencode.ai/install | bash
    info "opencode installed"
fi

# ── Claude Code MCP servers ──────────────────────────────
echo "── Claude Code MCP servers ──"
export PATH="$HOME/.local/bin:$PATH"
if has claude; then
    SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
    if [ -f "$SCRIPT_DIR/.config/claude/mcp-setup.sh" ]; then
        bash "$SCRIPT_DIR/.config/claude/mcp-setup.sh"
        info "MCP servers configured"
    fi
fi

# ── Symlink dotfiles ─────────────────────────────────────
echo "── Symlinking dotfiles ──"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
bash "$SCRIPT_DIR/install.sh"

echo ""
echo "Done! Restart your terminal for all changes to take effect."
