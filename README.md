# Aurora Depths Theme

A carefully crafted dark theme combining the deep, dreamy aesthetics of **Poimandres** with the arctic coolness of **Nord**, designed following **Material Design 3** principles and **WCAG AA accessibility** standards.

## Design Philosophy

- **Contrast Ratios**: All text meets WCAG 2.1 AA standards (4.5:1 for normal text, 3:1 for large text)
- **Eye Comfort**: Avoids pure black (#000000) and pure white (#FFFFFF) to reduce eye strain
- **Semantic Colors**: Consistent meaning across all applications (errors=red, success=green, warnings=yellow)
- **Depth Hierarchy**: Progressive background layers create visual depth without harsh contrasts

## Color Palette

### Base Colors (Background Hierarchy)

| Name     | Hex       | Usage                        |
|----------|-----------|------------------------------|
| bg0      | `#1a1d26` | Deepest background           |
| bg1      | `#252936` | Elevated surfaces            |
| bg2      | `#2e3340` | Panels, sidebars             |
| bg3      | `#3a3f4f` | Selections, highlights       |
| bg4      | `#4a5163` | Borders, separators          |

### Foreground Colors

| Name     | Hex       | Contrast | Usage                    |
|----------|-----------|----------|--------------------------|
| fg0      | `#e5eaf2` | ~13:1    | Primary text             |
| fg1      | `#b8c5d4` | ~8:1     | Secondary text, comments |
| fg2      | `#8a95a6` | ~5:1     | Muted text, placeholders |
| fg3      | `#6a7586` | ~3.5:1   | Disabled, line numbers   |

### Accent Colors (Syntax & UI)

| Name     | Hex       | Semantic Meaning                    |
|----------|-----------|-------------------------------------|
| blue     | `#8fc6d9` | Keywords, operators, links          |
| cyan     | `#7fccbf` | Strings, constants                  |
| teal     | `#5fb3a1` | Functions, methods                  |
| green    | `#9dc08b` | Success states, additions, booleans |
| yellow   | `#e6c783` | Warnings, classes, types            |
| orange   | `#d4927a` | Numbers, special constants          |
| pink     | `#c78db0` | Special keywords, regex             |
| red      | `#c76b75` | Errors, deletions                   |
| purple   | `#a699c9` | Variables, parameters               |

## Installation

### Neovim

**With lazy.nvim (recommended):**

```lua
{
  dir = "~/path/to/aurora-depths-theme/nvim",
  -- Or if published to GitHub:
  -- "yourusername/aurora-depths.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme aurora-depths")
  end,
}
```

**Manual installation:**

Copy the `nvim/` folder contents to your Neovim config:

```bash
cp -r nvim/lua ~/.config/nvim/
cp -r nvim/colors ~/.config/nvim/
```

Then add to your config:

```lua
vim.cmd('colorscheme aurora-depths')
```

#### Lualine Integration

```lua
-- In your lualine plugin config:
require('lualine').setup {
  options = {
    theme = require('aurora-depths').lualine()
  }
}
```

#### Bufferline Integration

```lua
-- In your bufferline plugin config:
require('bufferline').setup {
  highlights = require('aurora-depths').bufferline()
}
```

#### Custom Colors Access

You can access the color palette for custom configurations:

```lua
local colors = require('aurora-depths').colors
-- colors.teal, colors.blue, colors.bg0, etc.
```

### Cursor IDE / VS Code

1. Copy the `cursor/` folder to your extensions directory:
   ```bash
   # For Cursor
   cp -r cursor ~/.cursor/extensions/aurora-depths-theme

   # For VS Code
   cp -r cursor ~/.vscode/extensions/aurora-depths-theme
   ```

2. Restart Cursor/VS Code

3. Open Command Palette (`Cmd+Shift+P`) → "Preferences: Color Theme" → Select "Aurora Depths"

### SketchyBar

1. Copy the theme file:
   ```bash
   cp sketchybar/aurora-depths.sh ~/.config/sketchybar/theme/
   ```

2. Update your `sketchybarrc` to use the new theme:
   ```bash
   # Change this line:
   source "$CONFIG_DIR/theme/catppuccin.sh"
   # To:
   source "$CONFIG_DIR/theme/aurora-depths.sh"
   ```

3. Restart sketchybar:
   ```bash
   sketchybar --reload
   ```

### Starship Prompt

**Option 1**: Replace your config entirely:
```bash
cp starship/starship.toml ~/.config/starship.toml
```

**Option 2**: Merge with your existing config - add the palette and update module styles:
```bash
# Add the palette definition from starship/starship.toml to your config
# Then update your module styles to use the palette colors
```

### Ghostty

Copy `ghostty/config` to `~/.config/ghostty/` or merge with existing config.

### tmux

Add the contents of `tmux/aurora-depths.conf` to your `~/.tmux.conf`:

```bash
source-file ~/.config/tmux/aurora-depths.conf
```

## Accessibility Notes

This theme was designed with accessibility in mind:

- Primary text (#e5eaf2) on background (#1a1d26) = **13:1 contrast ratio** (exceeds AAA)
- Secondary text (#b8c5d4) on background = **8:1 contrast ratio** (exceeds AAA)
- All accent colors maintain minimum **4.5:1 contrast** for syntax highlighting
- UI elements maintain minimum **3:1 contrast** per WCAG 1.4.11

## Credits

- [Poimandres Theme](https://github.com/drcmda/poimandres-theme) by @drcmda
- [Nord Theme](https://www.nordtheme.com/)
- [Material Design 3](https://m3.material.io/) color system guidelines
- [WCAG 2.1](https://www.w3.org/WAI/WCAG21/Understanding/contrast-minimum.html) accessibility standards
