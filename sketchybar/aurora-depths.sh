#!/usr/bin/env bash
# ──────────────────────────────────────────────────────────────────────────────
# Aurora Depths Theme for SketchyBar - Purple Edition
# Sophisticated purple-first palette with WCAG AA compliance
# ──────────────────────────────────────────────────────────────────────────────

# PRIMARY PURPLE FAMILY (The Hero)
export _SSDF_CM_PURPLE=0xffc4b5f0   # Functions, primary accent
export _SSDF_CM_VIOLET=0xffa78bfa   # Decorators, properties

# PINK/MAGENTA FAMILY - Keywords
export _SSDF_CM_PINK=0xfff0a0c8     # Keywords, operators
export _SSDF_CM_MAGENTA=0xffe879a8  # Control flow

# COMPLEMENTARY - Types
export _SSDF_CM_CYAN=0xff7dd3d0     # Types, classes
export _SSDF_CM_TEAL=0xff5ccfb8     # Type parameters

# SUPPORTING ACCENTS
export _SSDF_CM_SAGE=0xffa8d4a8     # Strings
export _SSDF_CM_MINT=0xff8ce0a0     # Success, booleans
export _SSDF_CM_YELLOW=0xffe8d088   # Warnings
export _SSDF_CM_PEACH=0xffe8a888    # Numbers, constants
export _SSDF_CM_CORAL=0xffe88090    # Errors
export _SSDF_CM_SKY=0xff88c4f0      # Variables
export _SSDF_CM_ROSE=0xffe0a8c0     # Imports

# LEGACY ALIASES (backwards compatibility)
export _SSDF_CM_BLUE=$_SSDF_CM_SKY
export _SSDF_CM_RED=$_SSDF_CM_CORAL
export _SSDF_CM_ORANGE=$_SSDF_CM_PEACH
export _SSDF_CM_GREEN=$_SSDF_CM_MINT
export _SSDF_CM_FROST=$_SSDF_CM_SAGE
export _SSDF_CM_LAVENDER=$_SSDF_CM_VIOLET

# FOREGROUND COLORS (text hierarchy)
export _SSDF_CM_SUBTEXT_1=0xffe8e6f0 # Primary text (12:1 contrast)
export _SSDF_CM_SUBTEXT_0=0xffc4c0d4 # Secondary text (8:1 contrast)
export _SSDF_CM_OVERLAY_1=0xff908ca4 # Muted text (5:1 contrast)
export _SSDF_CM_OVERLAY_0=0xff686480 # Disabled text (3.5:1 contrast)
export _SSDF_CM_SURFACE_2=0xff4a4565 # Borders, separators
export _SSDF_CM_SURFACE_1=0xff3a3550 # Selections, highlights
export _SSDF_CM_SURFACE_0=0xff2e293c # Panels, sidebars

# BACKGROUND COLORS (purple-tinted depth layers)
export _SSDF_CM_MANTLE=0xdd1a1825         # Deepest background (with transparency)
export _SSDF_CM_MANTLE_LIGHT=0xff242030   # Elevated surfaces
export _SSDF_CM_MANTLE_LIGHTER=0xff2e293c # Panels, floating windows

# WORKSPACE DOT COLORS (using Aurora Depths accents)
export _SSDF_WS_PURPLE=0xffc4b5f0   # Purple accent (primary)
export _SSDF_WS_PINK=0xfff0a0c8     # Pink accent
export _SSDF_WS_CYAN=0xff7dd3d0     # Cyan accent
export _SSDF_WS_VIOLET=0xffa78bfa   # Violet accent

# Legacy workspace aliases
export _SSDF_WS_TEAL=$_SSDF_WS_CYAN
export _SSDF_WS_BLUE=$_SSDF_WS_CYAN
export _SSDF_WS_GREEN=0xff8ce0a0
export _SSDF_WS_ORANGE=$_SSDF_CM_PEACH

# UTILITY
export TRANSPARENT=0x00000000
