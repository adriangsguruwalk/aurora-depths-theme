#!/usr/bin/env bash
#
# Aurora Depths 2026 - Starship Installation Script
# Installs the Starship prompt configuration
#

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
THEME_DIR="$(dirname "$SCRIPT_DIR")"
STARSHIP_CONFIG="${STARSHIP_CONFIG:-${XDG_CONFIG_HOME:-$HOME/.config}/starship.toml}"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

info() { echo -e "${BLUE}[INFO]${NC} $1"; }
success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; exit 1; }

echo ""
echo "  Aurora Depths 2026 - Starship Installer"
echo "  ========================================"
echo ""

THEME_SOURCE="$THEME_DIR/starship/starship.toml"
STARSHIP_CONFIG_DIR="$(dirname "$STARSHIP_CONFIG")"

# Check if source exists
if [[ ! -f "$THEME_SOURCE" ]]; then
    error "Theme file not found: $THEME_SOURCE"
fi

# Create config directory if needed
if [[ ! -d "$STARSHIP_CONFIG_DIR" ]]; then
    info "Creating config directory: $STARSHIP_CONFIG_DIR"
    mkdir -p "$STARSHIP_CONFIG_DIR"
fi

# Handle existing config
if [[ -L "$STARSHIP_CONFIG" ]]; then
    CURRENT_TARGET="$(readlink "$STARSHIP_CONFIG")"
    if [[ "$CURRENT_TARGET" == "$THEME_SOURCE" ]]; then
        info "Aurora Depths is already installed"
        success "Nothing to do!"
        exit 0
    fi
    info "Removing existing symlink (was pointing to: $CURRENT_TARGET)..."
    rm "$STARSHIP_CONFIG"
elif [[ -f "$STARSHIP_CONFIG" ]]; then
    BACKUP="${STARSHIP_CONFIG}.backup.$(date +%Y%m%d%H%M%S)"
    warn "Backing up existing config to: $BACKUP"
    mv "$STARSHIP_CONFIG" "$BACKUP"
fi

# Create symlink
info "Creating symlink: $STARSHIP_CONFIG -> $THEME_SOURCE"
ln -s "$THEME_SOURCE" "$STARSHIP_CONFIG"

echo ""
success "Starship installation complete!"
echo ""
echo "  Config symlinked: $STARSHIP_CONFIG"
echo "  Points to:        $THEME_SOURCE"
echo ""
echo "  Open a new terminal to see the changes."
echo ""
echo "  Note: If you have customizations, you may want to merge them"
echo "  with the Aurora Depths config instead of using the symlink."
echo ""
