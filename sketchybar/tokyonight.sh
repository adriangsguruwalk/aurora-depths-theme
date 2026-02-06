#!/usr/bin/env bash
# ──────────────────────────────────────────────────────────────────────────────
# Tokyo Night Theme for SketchyBar
# Based on folke/tokyonight.nvim - Night variant
# A clean, dark theme with vibrant colors
# ──────────────────────────────────────────────────────────────────────────────

# PRIMARY BLUE FAMILY (The Hero)
export _SSDF_CM_BLUE=0xff7aa2f7        # Functions, primary accent (hero)
export _SSDF_CM_BLUE_BRIGHT=0xff8db0ff # Bright blue
export _SSDF_CM_BLUE_DIM=0xff3d59a1    # Dim blue

# CYAN FAMILY
export _SSDF_CM_CYAN=0xff7dcfff        # Keywords, bright accent
export _SSDF_CM_CYAN_BRIGHT=0xffa4daff # Bright cyan
export _SSDF_CM_BLUE1=0xff2ac3de       # Types

# MAGENTA/PURPLE FAMILY
export _SSDF_CM_MAGENTA=0xffbb9af7     # Types, classes
export _SSDF_CM_PURPLE=0xff9d7cd8      # Keywords italic
export _SSDF_CM_MAGENTA_BRIGHT=0xffc7a9ff # Bright magenta

# GREEN FAMILY
export _SSDF_CM_GREEN=0xff9ece6a       # Strings
export _SSDF_CM_GREEN1=0xff73daca      # Properties
export _SSDF_CM_GREEN_BRIGHT=0xff9fe044 # Bright green
export _SSDF_CM_TEAL=0xff1abc9c        # Info

# WARM COLORS
export _SSDF_CM_ORANGE=0xffff9e64      # Numbers, constants
export _SSDF_CM_YELLOW=0xffe0af68      # Warnings
export _SSDF_CM_YELLOW_BRIGHT=0xfffaba4a # Bright yellow
export _SSDF_CM_RED=0xfff7768e         # Errors
export _SSDF_CM_RED_BRIGHT=0xffff899d  # Bright red
export _SSDF_CM_RED1=0xffdb4b4b        # Dark red

# LEGACY ALIASES (backwards compatibility)
export _SSDF_CM_EMERALD=$_SSDF_CM_GREEN1
export _SSDF_CM_TEAL_BRIGHT=$_SSDF_CM_CYAN
export _SSDF_CM_TEAL_DIM=$_SSDF_CM_TEAL
export _SSDF_CM_VIOLET=$_SSDF_CM_PURPLE
export _SSDF_CM_PINK=$_SSDF_CM_MAGENTA
export _SSDF_CM_ROSE=$_SSDF_CM_RED
export _SSDF_CM_ROSE_BRIGHT=$_SSDF_CM_RED_BRIGHT
export _SSDF_CM_CORAL=$_SSDF_CM_RED1
export _SSDF_CM_PEACH=$_SSDF_CM_ORANGE
export _SSDF_CM_GOLD=$_SSDF_CM_YELLOW
export _SSDF_CM_AMBER=$_SSDF_CM_YELLOW_BRIGHT
export _SSDF_CM_MINT=$_SSDF_CM_GREEN
export _SSDF_CM_SAND=$_SSDF_CM_GREEN
export _SSDF_CM_FROST=$_SSDF_CM_CYAN
export _SSDF_CM_LAVENDER=$_SSDF_CM_MAGENTA
export _SSDF_CM_AQUA=$_SSDF_CM_CYAN_BRIGHT
export _SSDF_CM_SEAFOAM=$_SSDF_CM_GREEN1

# FOREGROUND COLORS (text hierarchy)
export _SSDF_CM_SUBTEXT_1=0xffc0caf5   # Primary text
export _SSDF_CM_SUBTEXT_0=0xffa9b1d6   # Secondary text
export _SSDF_CM_OVERLAY_1=0xff565f89   # Muted text (comment)
export _SSDF_CM_OVERLAY_0=0xff737aa2   # Disabled text (dark5)
export _SSDF_CM_SURFACE_2=0xff3b4261   # Borders, separators (fg_gutter)
export _SSDF_CM_SURFACE_1=0xff292e42   # Selections, highlights (bg_highlight)
export _SSDF_CM_SURFACE_0=0xff16161e   # Panels, sidebars (bg_dark)

# BACKGROUND COLORS
export _SSDF_CM_MANTLE=0xdd1a1b26          # Main background (with transparency)
export _SSDF_CM_MANTLE_LIGHT=0xff16161e    # Darker surfaces
export _SSDF_CM_MANTLE_LIGHTER=0xff292e42  # Selections

# WORKSPACE DOT COLORS (using Tokyo Night accents)
export _SSDF_WS_BLUE=0xff7aa2f7        # Blue accent (primary)
export _SSDF_WS_CYAN=0xff7dcfff        # Cyan accent
export _SSDF_WS_MAGENTA=0xffbb9af7     # Magenta accent
export _SSDF_WS_GREEN=0xff9ece6a       # Green accent

# Legacy workspace aliases
export _SSDF_WS_TEAL=$_SSDF_WS_CYAN
export _SSDF_WS_TEAL_BRIGHT=$_SSDF_WS_CYAN
export _SSDF_WS_EMERALD=$_SSDF_WS_GREEN
export _SSDF_WS_PURPLE=$_SSDF_WS_MAGENTA
export _SSDF_WS_ROSE=$_SSDF_CM_RED
export _SSDF_WS_ORANGE=$_SSDF_CM_ORANGE

# UTILITY
export TRANSPARENT=0x00000000
