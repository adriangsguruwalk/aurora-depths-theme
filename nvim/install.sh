#!/usr/bin/env bash
#
# Aurora Depths - Neovim Theme Installer
# A Poimandres x Nord inspired colorscheme
#

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color
BOLD='\033[1m'

# Theme info
THEME_NAME="aurora-depths"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Determine Neovim config directory
if [[ -n "$XDG_CONFIG_HOME" ]]; then
    NVIM_CONFIG="$XDG_CONFIG_HOME/nvim"
else
    NVIM_CONFIG="$HOME/.config/nvim"
fi

# Print banner
print_banner() {
    echo -e "${CYAN}"
    echo "  ╔═══════════════════════════════════════════╗"
    echo "  ║         Aurora Depths for Neovim          ║"
    echo "  ║   A Poimandres x Nord inspired theme      ║"
    echo "  ╚═══════════════════════════════════════════╝"
    echo -e "${NC}"
}

# Print colored messages
info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

success() {
    echo -e "${GREEN}[OK]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Neovim is installed
check_neovim() {
    if ! command -v nvim &> /dev/null; then
        error "Neovim is not installed or not in PATH"
        exit 1
    fi

    local nvim_version
    nvim_version=$(nvim --version | head -n1)
    info "Found: $nvim_version"
}

# Install theme by copying files
install_copy() {
    info "Installing Aurora Depths theme (copy mode)..."

    # Create directories
    mkdir -p "$NVIM_CONFIG/colors"
    mkdir -p "$NVIM_CONFIG/lua/$THEME_NAME"

    # Copy files
    cp "$SCRIPT_DIR/colors/aurora-depths.lua" "$NVIM_CONFIG/colors/"
    success "Copied colors/aurora-depths.lua"

    cp "$SCRIPT_DIR/lua/aurora-depths/init.lua" "$NVIM_CONFIG/lua/$THEME_NAME/"
    success "Copied lua/aurora-depths/init.lua"

    success "Theme installed successfully!"
}

# Install theme by creating symlinks (useful for development)
install_symlink() {
    info "Installing Aurora Depths theme (symlink mode)..."

    # Create directories
    mkdir -p "$NVIM_CONFIG/colors"
    mkdir -p "$NVIM_CONFIG/lua"

    # Remove existing files/symlinks
    rm -rf "$NVIM_CONFIG/colors/aurora-depths.lua"
    rm -rf "$NVIM_CONFIG/lua/$THEME_NAME"

    # Create symlinks
    ln -sf "$SCRIPT_DIR/colors/aurora-depths.lua" "$NVIM_CONFIG/colors/aurora-depths.lua"
    success "Linked colors/aurora-depths.lua"

    ln -sf "$SCRIPT_DIR/lua/aurora-depths" "$NVIM_CONFIG/lua/$THEME_NAME"
    success "Linked lua/aurora-depths/"

    success "Theme installed successfully (symlinked)!"
}

# Uninstall theme
uninstall() {
    info "Uninstalling Aurora Depths theme..."

    if [[ -f "$NVIM_CONFIG/colors/aurora-depths.lua" ]] || [[ -L "$NVIM_CONFIG/colors/aurora-depths.lua" ]]; then
        rm -f "$NVIM_CONFIG/colors/aurora-depths.lua"
        success "Removed colors/aurora-depths.lua"
    fi

    if [[ -d "$NVIM_CONFIG/lua/$THEME_NAME" ]] || [[ -L "$NVIM_CONFIG/lua/$THEME_NAME" ]]; then
        rm -rf "$NVIM_CONFIG/lua/$THEME_NAME"
        success "Removed lua/$THEME_NAME/"
    fi

    success "Theme uninstalled successfully!"
}

# Print usage instructions
print_usage() {
    echo -e "${BOLD}Aurora Depths - Neovim Theme Installer${NC}"
    echo ""
    echo "Usage: $0 [OPTION]"
    echo ""
    echo "Options:"
    echo "  install     Install theme by copying files (default)"
    echo "  symlink     Install theme using symlinks (for development)"
    echo "  uninstall   Remove the theme"
    echo "  help        Show this help message"
    echo ""
    echo "After installation, add this to your Neovim config:"
    echo ""
    echo -e "  ${CYAN}-- init.lua${NC}"
    echo -e "  ${GREEN}vim.cmd('colorscheme aurora-depths')${NC}"
    echo ""
    echo "Or for lazy.nvim users:"
    echo ""
    echo -e "  ${CYAN}-- plugins/aurora-depths.lua${NC}"
    echo -e "  ${GREEN}return {"
    echo -e "    dir = '$SCRIPT_DIR',"
    echo -e "    lazy = false,"
    echo -e "    priority = 1000,"
    echo -e "    config = function()"
    echo -e "      vim.cmd('colorscheme aurora-depths')"
    echo -e "    end,"
    echo -e "  }${NC}"
    echo ""
}

# Print post-install instructions
print_instructions() {
    echo ""
    echo -e "${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BOLD}  Activation Instructions${NC}"
    echo -e "${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    echo "Add one of the following to your Neovim config:"
    echo ""
    echo -e "${YELLOW}Option 1: init.lua${NC}"
    echo -e "  ${GREEN}vim.cmd('colorscheme aurora-depths')${NC}"
    echo ""
    echo -e "${YELLOW}Option 2: init.vim${NC}"
    echo -e "  ${GREEN}colorscheme aurora-depths${NC}"
    echo ""
    echo -e "${YELLOW}Option 3: Lazy.nvim plugin spec${NC}"
    echo -e "  ${GREEN}{"
    echo -e "    'aurora-depths/aurora-depths.nvim',"
    echo -e "    lazy = false,"
    echo -e "    priority = 1000,"
    echo -e "    config = function()"
    echo -e "      vim.cmd('colorscheme aurora-depths')"
    echo -e "    end,"
    echo -e "  }${NC}"
    echo ""
    echo -e "Config location: ${CYAN}$NVIM_CONFIG${NC}"
    echo ""
}

# Main
main() {
    print_banner

    case "${1:-install}" in
        install)
            check_neovim
            install_copy
            print_instructions
            ;;
        symlink|link|dev)
            check_neovim
            install_symlink
            print_instructions
            ;;
        uninstall|remove)
            uninstall
            ;;
        help|--help|-h)
            print_usage
            ;;
        *)
            error "Unknown option: $1"
            echo ""
            print_usage
            exit 1
            ;;
    esac
}

main "$@"
