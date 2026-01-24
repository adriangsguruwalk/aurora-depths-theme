# Aurora Depths Theme

> **Purple Edition** - A sophisticated purple-first dark theme with WCAG AA compliance

A carefully crafted dark theme combining the deep, dreamy aesthetics of **Poimandres** with the arctic coolness of **Nord**, designed following **Material Design 3** principles and **WCAG AA accessibility** standards.

## Supported Applications

| Application | Status | Description |
|-------------|--------|-------------|
| [Neovim](#neovim) | Complete | Full LSP, Treesitter, and plugin support |
| [Cursor / VS Code](#cursor-ide--vs-code) | Complete | Editor and UI theming |
| [JetBrains IDEs](#jetbrains-ides) | Complete | IntelliJ, WebStorm, PyCharm, GoLand, etc. |
| [Starship](#starship-prompt) | Complete | 5 variants including Cyberpunk editions |
| [Ghostty](#ghostty) | Complete | Terminal colors and cursor shader |
| [tmux](#tmux) | Complete | Status bar and pane styling |
| [SketchyBar](#sketchybar) | Complete | macOS menu bar |
| [LSD](#lsd) | Complete | File listing colors |

## Design Philosophy

- **Purple-First Aesthetic**: Primary accent color establishing consistent brand identity
- **Contrast Ratios**: All text meets WCAG 2.1 AA standards (4.5:1 minimum)
- **Eye Comfort**: Avoids pure black and pure white to reduce eye strain
- **Semantic Colors**: Consistent meaning across all applications
- **Depth Hierarchy**: Progressive background layers create visual depth

## Color Palette

### Base Colors (Background Hierarchy)

| Name | Hex | Usage |
|------|-----|-------|
| bg0 | `#1a1825` | Deepest background (purple-black canvas) |
| bg1 | `#242030` | Elevated surfaces |
| bg2 | `#2e293c` | Panels, sidebars, floating windows |
| bg3 | `#3a3550` | Selections, visual mode, highlights |
| bg4 | `#4a4565` | Borders, separators |

### Foreground Colors

| Name | Hex | Contrast | Usage |
|------|-----|----------|-------|
| fg0 | `#e8e6f0` | ~13:1 | Primary text (exceeds AAA) |
| fg1 | `#c4c0d4` | ~8:1 | Secondary text (exceeds AAA) |
| fg2 | `#908ca4` | ~5:1 | Muted text, comments |
| fg3 | `#686480` | ~3.5:1 | Disabled, line numbers |

### Accent Colors

| Name | Hex | Semantic Meaning |
|------|-----|------------------|
| purple | `#c4b5f0` | Functions, methods, primary accent |
| violet | `#c4a8ff` | Decorators, properties, annotations |
| pink | `#f0a0c8` | Keywords, operators, tags |
| magenta | `#e879a8` | Control flow (conditionals, loops) |
| cyan | `#7dd3d0` | Types, classes, interfaces |
| teal | `#5ccfb8` | Type parameters, escapes |
| sage | `#a8d4a8` | Strings, documentation |
| mint | `#8ce0a0` | Success states, booleans, additions |
| yellow | `#e8d088` | Warnings, classes |
| peach | `#e8a888` | Numbers, constants |
| coral | `#f0a0a8` | Errors, deletions |
| sky | `#88c4f0` | Variables, parameters |
| rose | `#e0a8c0` | Imports, macros, modules |

---

## Installation

### Neovim

**With lazy.nvim:**

```lua
{
  dir = "~/Projects/aurora-depths-theme/nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme aurora-depths")
  end,
}
```

**Manual installation:**

```bash
cp -r nvim/lua ~/.config/nvim/
cp -r nvim/colors ~/.config/nvim/
```

**Plugin integrations:**

```lua
-- Lualine
require('lualine').setup {
  options = { theme = require('aurora-depths').lualine() }
}

-- Bufferline
require('bufferline').setup {
  highlights = require('aurora-depths').bufferline()
}

-- Access colors directly
local colors = require('aurora-depths').colors
```

### Cursor IDE / VS Code

```bash
# For Cursor
cp -r cursor ~/.cursor/extensions/aurora-depths-theme

# For VS Code
cp -r cursor ~/.vscode/extensions/aurora-depths-theme
```

Restart and select "Aurora Depths" via Command Palette → "Preferences: Color Theme"

### JetBrains IDEs

Works with IntelliJ IDEA, WebStorm, PyCharm, GoLand, RubyMine, PhpStorm, CLion, Rider, and Android Studio.

```bash
# Find your IDE config directory
# macOS: ~/Library/Application Support/JetBrains/<IDE><version>/
# Linux: ~/.config/JetBrains/<IDE><version>/
# Windows: %APPDATA%\JetBrains\<IDE><version>\

# Copy theme files
IDE_DIR=~/Library/Application\ Support/JetBrains/IntelliJIdea2024.1
mkdir -p "$IDE_DIR/colors"
cp jetbrains/aurora_depths.theme.json "$IDE_DIR/colors/"
cp jetbrains/aurora_depths.xml "$IDE_DIR/colors/"
```

Restart IDE and select "Aurora Depths" in `Settings → Appearance → Theme`

See [jetbrains/README.md](jetbrains/README.md) for detailed instructions.

### Starship Prompt

Five variants available for different aesthetics:

| Variant | File | Description |
|---------|------|-------------|
| **Classic** | `starship.toml` | Clean, professional purple-first design |
| **Cyberpunk** | `aurora-depths-cyberpunk.toml` | Neural Link aesthetic with bracketed segments |
| **Ghost** | `aurora-depths-ghost.toml` | Minimal single-line, whisper-quiet |
| **Matrix** | `aurora-depths-matrix.toml` | Digital rain with Matrix green integration |
| **Glitch** | `aurora-depths-glitch.toml` | Corrupted data aesthetic, scanline delimiters |

**Installation:**

```bash
# Choose your variant
cp starship/aurora-depths-cyberpunk.toml ~/.config/starship.toml

# Or symlink for easy updates
ln -sf ~/Projects/aurora-depths-theme/starship/aurora-depths-cyberpunk.toml ~/.config/starship.toml
```

**Preview (Cyberpunk variant):**
```
┌─[󰀵]─[λ:~/project]─[±:main]─[◆:v2.0]─[󰎙:22.1]────[14:32:08]─┐
└─[󰜮:2]─❯
```

See [starship/README.md](starship/README.md) for all variant previews and customization.

### Ghostty

```bash
# Copy terminal config
cp ghostty/config ~/.config/ghostty/

# The cursor blaze shader uses Aurora Depths colors
# Located at ~/.config/ghostty/shaders/cursor_blaze.glsl
```

The cursor trail shader features the Aurora purple/magenta glow effect.

### tmux

```bash
# Add to your ~/.tmux.conf
source-file ~/Projects/aurora-depths-theme/tmux/aurora-depths.conf
```

Or copy the contents directly into your tmux config.

### SketchyBar

```bash
cp sketchybar/aurora-depths.sh ~/.config/sketchybar/theme/
```

Update your `sketchybarrc`:
```bash
source "$CONFIG_DIR/theme/aurora-depths.sh"
```

### LSD

```bash
cp lsd/colors.yaml ~/.config/lsd/
```

---

## Cyberpunk Edition (2026)

The Starship prompts include special **Cyberpunk Edition** variants designed for a 2026 hacker aesthetic:

### Extended Neon Palette

| Name | Hex | Usage |
|------|-----|-------|
| neongreen | `#39ff14` | Matrix green, active states |
| neoncyan | `#00ffff` | Electric data streams |
| neonpink | `#ff6eb4` | Alert states |
| neonred | `#ff3131` | Critical errors |
| electric | `#00d4ff` | High-energy accents |

### Design Principles

- **Information as Interface**: Data feels like a living dashboard
- **Neon on Void**: High contrast creates visual hierarchy
- **Functional Minimalism**: Every element serves a purpose
- **Glitch as Feature**: Imperfection adds character

---

## Accessibility

This theme was designed with accessibility in mind:

| Element | Contrast Ratio | WCAG Level |
|---------|----------------|------------|
| Primary text on bg | 13:1 | AAA |
| Secondary text on bg | 8:1 | AAA |
| Accent colors | 4.5:1+ | AA |
| UI elements | 3:1+ | AA (1.4.11) |

---

## File Structure

```
aurora-depths-theme/
├── nvim/                    # Neovim colorscheme
│   ├── colors/
│   └── lua/aurora-depths/
├── cursor/                  # VS Code / Cursor theme
│   └── aurora-depths-color-theme.json
├── jetbrains/               # JetBrains IDE theme
│   ├── aurora_depths.theme.json
│   ├── aurora_depths.xml
│   └── README.md
├── starship/                # Starship prompt configs
│   ├── starship.toml              # Classic
│   ├── aurora-depths-cyberpunk.toml
│   ├── aurora-depths-ghost.toml
│   ├── aurora-depths-matrix.toml
│   ├── aurora-depths-glitch.toml
│   └── README.md
├── ghostty/                 # Ghostty terminal
├── tmux/                    # tmux status bar
├── sketchybar/              # macOS menu bar
├── lsd/                     # LSD file listing
└── README.md
```

---

## Requirements

- **Fonts**: Nerd Font v3.0+ recommended (JetBrains Mono, FiraCode, Hack)
- **Terminal**: True color (24-bit) support required
- **Neovim**: 0.9+ with Treesitter
- **JetBrains**: 2023.1+ (2024.1+ recommended)

---

## Credits

- [Poimandres Theme](https://github.com/drcmda/poimandres-theme) by @drcmda
- [Nord Theme](https://www.nordtheme.com/)
- [Material Design 3](https://m3.material.io/) color system guidelines
- [WCAG 2.1](https://www.w3.org/WAI/WCAG21/Understanding/contrast-minimum.html) accessibility standards

---

## License

MIT
