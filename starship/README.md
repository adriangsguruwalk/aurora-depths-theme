# Aurora Depths - Starship Prompt Collection

> **2026 Cyberpunk Edition** - "Jack in. The grid awaits."

A collection of starship prompt configurations built on the Aurora Depths color palette, designed for the 2026 cyberpunk/hacker aesthetic.

## Variants

### 1. `starship.toml` - Classic Aurora
The original Aurora Depths starship configuration. Clean, professional, with the purple-first aesthetic.

```
~/Projects/repo  main +2-1 󰎙 20.1 ❯
```

### 2. `aurora-depths-cyberpunk.toml` - Neural Link
Neural interface aesthetic with "connection status" indicators and bracketed segments.

```
┌─[󰀵]─[user]─[λ:~/project]─[±:main]─[◆:v2.0]─[󰎙:22.1]───────[14:32:08]─┐
└─[󰜮:2]─[󰜎:1]─❯
```

**Features:**
- Box-drawing frame architecture
- System monitoring feel
- Neon accent highlights
- Extended neon color palette

### 3. `aurora-depths-ghost.toml` - Ghost Shell
Minimal, whisper-quiet aesthetics inspired by Ghost in the Shell.

```
~/project ±main +2-1 ❯                           node●20.1 │ 2.3s │ 14:32
```

**Features:**
- Single-line left prompt
- Right-aligned context data
- Maximum information density with minimal visual noise
- Perfect for SSH sessions

### 4. `aurora-depths-matrix.toml` - Datastream
Matrix-inspired digital rain aesthetic with cascading information.

```
╭──[MAC]──λ:~/project──±:main*──△:+3-1──◇:v2.0──▣:node@22──⧗14:32:08
╰──⟨jobs:2⟩──[OK]──❯
```

**Features:**
- Iconic Matrix green palette integration
- Hex address styling
- Process monitoring terminology
- Two-line dashboard layout

### 5. `aurora-depths-glitch.toml` - Glitch Mode
Corrupted data aesthetic with broken segments and digital decay.

```
░▒▓ user@sys ▓▒░ ▌λ ~/project▐ ▌±:main▐ ▌+3-1▐ ▌⚡2.3s▐ ▌14:32▐
▓░▒ ❯
```

**Features:**
- Scanline/CRT aesthetic
- Fragmented segment delimiters
- Zalgo-inspired git state indicators
- Maximum cyberpunk immersion

## Installation

### Quick Install

```bash
# Choose your variant
cp aurora-depths-cyberpunk.toml ~/.config/starship.toml

# Or symlink for easy updates
ln -sf ~/Projects/aurora-depths-theme/starship/aurora-depths-cyberpunk.toml ~/.config/starship.toml
```

### Requirements

- **Starship** v1.18+ ([starship.rs](https://starship.rs))
- **Nerd Font** v3.0+ (recommended: JetBrains Mono, FiraCode, or Hack)
- **True Color Terminal** (iTerm2, Ghostty, Alacritty, Kitty, WezTerm)

### Verify Nerd Font

```bash
echo -e "\uf121 \ue7a8 \uf308 \ue739 \uf0e7"
# Should show: code, python, node, git, lightning icons
```

## Color Palette Reference

### Core Aurora Depths
| Name | Hex | Usage |
|------|-----|-------|
| `bg0` | `#1a1825` | Deep purple-black canvas |
| `fg0` | `#e8e6f0` | Primary text |
| `purple` | `#c4b5f0` | Primary accent, functions |
| `pink` | `#f0a0c8` | Keywords, git branches |
| `cyan` | `#7dd3d0` | Types, data structures |
| `mint` | `#8ce0a0` | Success, additions |
| `coral` | `#f0a0a8` | Errors, deletions |

### Cyberpunk Extensions
| Name | Hex | Usage |
|------|-----|-------|
| `neongreen` | `#39ff14` | Matrix green, active states |
| `neoncyan` | `#00ffff` | Electric data streams |
| `neonpink` | `#ff6eb4` | Alert states |
| `neonred` | `#ff3131` | Critical errors |
| `electric` | `#00d4ff` | High-energy accents |

## Customization

### Switching Prompt Symbols

```toml
[character]
# Classic arrow
success_symbol = "[❯](bold purple)"

# Cyberpunk alternatives
# success_symbol = "[▶](bold neongreen)"
# success_symbol = "[⟩](bold purple)"
# success_symbol = "[λ](bold cyan)"
# success_symbol = "[⚡](bold neoncyan)"
```

### Adjusting Information Density

```toml
# Show more in directory path
[directory]
truncation_length = 5  # Default: 3

# Show git metrics always
[git_metrics]
only_nonzero_diffs = false

# Enable memory usage
[memory_usage]
disabled = false
threshold = 50
```

### Creating Hybrid Variants

Mix elements from different configs:

```toml
# Use Ghost's minimal left prompt with Cyberpunk's right format
format = """$directory$git_branch$git_status$character"""
right_format = """$nodejs$python$rust$cmd_duration$time"""
```

## Design Philosophy

### 2026 Aesthetics
- **Information as interface**: Data should feel like a living dashboard
- **Neon on void**: High contrast creates visual hierarchy
- **Functional minimalism**: Every element serves a purpose
- **Glitch as feature**: Imperfection adds character

### WCAG Compliance
All variants maintain minimum 4.5:1 contrast ratio for primary elements, ensuring readability while preserving the cyberpunk aesthetic.

## Troubleshooting

### Icons not displaying
Ensure your terminal font is set to a Nerd Font variant.

### Colors look wrong
Verify true color support:
```bash
echo $COLORTERM  # Should output: truecolor or 24bit
```

### Performance
If prompt feels slow:
```toml
# Reduce scans
[directory]
truncation_length = 2

# Disable heavy modules
[git_metrics]
disabled = true

[package]
disabled = true
```

## License

MIT - Part of the Aurora Depths Theme Project
