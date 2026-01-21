#!/usr/bin/env bash
#
# Aurora Depths 2026 - Main Installation Script
# Installs all theme components or specific ones
#
# Usage:
#   ./install.sh              # Interactive mode - choose what to install
#   ./install.sh all          # Install everything
#   ./install.sh ghostty      # Install only Ghostty theme
#   ./install.sh starship     # Install only Starship config
#   ./install.sh nvim         # Install only Neovim theme
#   ./install.sh cursor       # Install only Cursor/VS Code theme
#

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
THEME_DIR="$(dirname "$SCRIPT_DIR")"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

info() { echo -e "${BLUE}[INFO]${NC} $1"; }
success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; }

print_banner() {
    echo ""
    echo -e "${CYAN}${BOLD}"
    echo "     _                                ____             _   _"
    echo "    / \\  _   _ _ __ ___  _ __ __ _   |  _ \\  ___ _ __ | |_| |__  ___"
    echo "   / _ \\| | | | '__/ _ \\| '__/ _\` |  | | | |/ _ \\ '_ \\| __| '_ \\/ __|"
    echo "  / ___ \\ |_| | | | (_) | | | (_| |  | |_| |  __/ |_) | |_| | | \\__ \\"
    echo " /_/   \\_\\__,_|_|  \\___/|_|  \\__,_|  |____/ \\___| .__/ \\__|_| |_|___/"
    echo "                                                |_|"
    echo -e "${NC}"
    echo -e "  ${BOLD}2026 Edition${NC} - Digital Hygge meets modern pastels"
    echo ""
}

install_ghostty() {
    echo ""
    echo -e "${BOLD}Installing Ghostty theme...${NC}"
    echo "────────────────────────────────────"
    bash "$SCRIPT_DIR/install-ghostty.sh"
}

install_starship() {
    echo ""
    echo -e "${BOLD}Installing Starship config...${NC}"
    echo "────────────────────────────────────"
    bash "$SCRIPT_DIR/install-starship.sh"
}

install_nvim() {
    echo ""
    echo -e "${BOLD}Installing Neovim theme...${NC}"
    echo "────────────────────────────────────"

    NVIM_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
    NVIM_COLORS_DIR="$NVIM_CONFIG_DIR/colors"
    NVIM_LUA_DIR="$NVIM_CONFIG_DIR/lua"

    # Create directories
    mkdir -p "$NVIM_COLORS_DIR"
    mkdir -p "$NVIM_LUA_DIR"

    # Symlink colors file
    COLORS_SOURCE="$THEME_DIR/nvim/colors/aurora-depths.lua"
    COLORS_DEST="$NVIM_COLORS_DIR/aurora-depths.lua"

    if [[ -L "$COLORS_DEST" ]]; then
        rm "$COLORS_DEST"
    elif [[ -f "$COLORS_DEST" ]]; then
        mv "$COLORS_DEST" "${COLORS_DEST}.backup"
        warn "Backed up existing colors file"
    fi

    ln -s "$COLORS_SOURCE" "$COLORS_DEST"
    info "Symlinked: $COLORS_DEST"

    # Symlink lua module
    LUA_SOURCE="$THEME_DIR/nvim/lua/aurora-depths"
    LUA_DEST="$NVIM_LUA_DIR/aurora-depths"

    if [[ -L "$LUA_DEST" ]]; then
        rm "$LUA_DEST"
    elif [[ -d "$LUA_DEST" ]]; then
        mv "$LUA_DEST" "${LUA_DEST}.backup"
        warn "Backed up existing lua module"
    fi

    ln -s "$LUA_SOURCE" "$LUA_DEST"
    info "Symlinked: $LUA_DEST"

    echo ""
    success "Neovim installation complete!"
    echo ""
    echo "  Add to your Neovim config:"
    echo "    vim.cmd('colorscheme aurora-depths')"
    echo ""
}

install_cursor() {
    echo ""
    echo -e "${BOLD}Installing Cursor/VS Code theme...${NC}"
    echo "────────────────────────────────────"

    # Detect which editor(s) are installed
    CURSOR_EXT_DIR="$HOME/.cursor/extensions"
    VSCODE_EXT_DIR="$HOME/.vscode/extensions"
    THEME_NAME="aurora-depths-theme"

    installed=false

    if [[ -d "$HOME/.cursor" ]]; then
        mkdir -p "$CURSOR_EXT_DIR"
        DEST="$CURSOR_EXT_DIR/$THEME_NAME"

        if [[ -L "$DEST" ]]; then
            rm "$DEST"
        elif [[ -d "$DEST" ]]; then
            rm -rf "$DEST"
        fi

        ln -s "$THEME_DIR/cursor" "$DEST"
        info "Installed for Cursor: $DEST"
        installed=true
    fi

    if [[ -d "$HOME/.vscode" ]]; then
        mkdir -p "$VSCODE_EXT_DIR"
        DEST="$VSCODE_EXT_DIR/$THEME_NAME"

        if [[ -L "$DEST" ]]; then
            rm "$DEST"
        elif [[ -d "$DEST" ]]; then
            rm -rf "$DEST"
        fi

        ln -s "$THEME_DIR/cursor" "$DEST"
        info "Installed for VS Code: $DEST"
        installed=true
    fi

    if [[ "$installed" == false ]]; then
        warn "Neither Cursor nor VS Code config directories found"
        echo "  Expected: ~/.cursor or ~/.vscode"
    else
        echo ""
        success "Editor theme installation complete!"
        echo ""
        echo "  Restart your editor, then:"
        echo "  Cmd+Shift+P -> 'Color Theme' -> 'Aurora Depths 2026'"
        echo ""
    fi
}

install_all() {
    install_ghostty
    install_starship
    install_nvim
    install_cursor

    echo ""
    echo "════════════════════════════════════════════════════════════"
    success "All components installed successfully!"
    echo "════════════════════════════════════════════════════════════"
    echo ""
}

show_menu() {
    echo "  What would you like to install?"
    echo ""
    echo "    1) All components"
    echo "    2) Ghostty terminal theme"
    echo "    3) Starship prompt"
    echo "    4) Neovim colorscheme"
    echo "    5) Cursor/VS Code theme"
    echo "    q) Quit"
    echo ""
    read -p "  Enter choice [1-5, q]: " choice

    case $choice in
        1) install_all ;;
        2) install_ghostty ;;
        3) install_starship ;;
        4) install_nvim ;;
        5) install_cursor ;;
        q|Q) echo ""; info "Goodbye!"; exit 0 ;;
        *) error "Invalid choice" ;;
    esac
}

# Main
print_banner

case "${1:-}" in
    all)
        install_all
        ;;
    ghostty)
        install_ghostty
        ;;
    starship)
        install_starship
        ;;
    nvim|neovim)
        install_nvim
        ;;
    cursor|vscode|code)
        install_cursor
        ;;
    "")
        show_menu
        ;;
    *)
        error "Unknown component: $1"
        echo ""
        echo "Usage: $0 [all|ghostty|starship|nvim|cursor]"
        exit 1
        ;;
esac
