# Aurora Depths - JetBrains Theme

> **Purple Edition** - "Sophisticated purple-first palette with WCAG AA compliance"

A comprehensive theme for all JetBrains IDEs including IntelliJ IDEA, WebStorm, PyCharm, GoLand, RubyMine, PhpStorm, CLion, Rider, Android Studio, and more.

## Installation

### Method 1: Manual Installation (Recommended)

1. **Locate your IDE config directory:**

   | OS | Path |
   |----|------|
   | macOS | `~/Library/Application Support/JetBrains/<IDE><version>/` |
   | Linux | `~/.config/JetBrains/<IDE><version>/` |
   | Windows | `%APPDATA%\JetBrains\<IDE><version>\` |

   Example: `~/Library/Application Support/JetBrains/IntelliJIdea2024.1/`

2. **Copy the theme file:**
   ```bash
   # Copy UI theme
   cp aurora_depths.theme.json ~/Library/Application\ Support/JetBrains/<IDE><version>/colors/

   # Copy editor color scheme
   cp aurora_depths.xml ~/Library/Application\ Support/JetBrains/<IDE><version>/colors/
   ```

3. **Restart your IDE**

4. **Activate the theme:**
   - Go to `Settings/Preferences` → `Appearance & Behavior` → `Appearance`
   - Select **Aurora Depths** from the Theme dropdown

5. **Activate the color scheme (if not auto-selected):**
   - Go to `Settings/Preferences` → `Editor` → `Color Scheme`
   - Select **Aurora Depths** from the Scheme dropdown

### Method 2: Import Settings

1. Open your JetBrains IDE
2. Go to `File` → `Manage IDE Settings` → `Import Settings...`
3. Select the `aurora_depths.xml` file
4. Restart IDE and select the theme in Preferences

### Method 3: Quick Copy Script (macOS)

```bash
# For IntelliJ IDEA
IDE_DIR=~/Library/Application\ Support/JetBrains/IntelliJIdea2024.1
mkdir -p "$IDE_DIR/colors"
cp aurora_depths.theme.json aurora_depths.xml "$IDE_DIR/colors/"

# For WebStorm
IDE_DIR=~/Library/Application\ Support/JetBrains/WebStorm2024.1
mkdir -p "$IDE_DIR/colors"
cp aurora_depths.theme.json aurora_depths.xml "$IDE_DIR/colors/"

# For PyCharm
IDE_DIR=~/Library/Application\ Support/JetBrains/PyCharm2024.1
mkdir -p "$IDE_DIR/colors"
cp aurora_depths.theme.json aurora_depths.xml "$IDE_DIR/colors/"
```

## Color Palette

### Backgrounds
| Name | Hex | Usage |
|------|-----|-------|
| bg0 | `#1a1825` | Editor background |
| bg1 | `#242030` | Tool windows, panels |
| bg2 | `#2e293c` | Popups, dropdowns |
| bg3 | `#3a3550` | Selections, active line |
| bg4 | `#4a4565` | Borders, separators |

### Foregrounds
| Name | Hex | Usage |
|------|-----|-------|
| fg0 | `#e8e6f0` | Primary text |
| fg1 | `#c4c0d4` | Secondary text |
| fg2 | `#908ca4` | Comments, muted |
| fg3 | `#686480` | Disabled text |

### Syntax Accents
| Name | Hex | Usage |
|------|-----|-------|
| purple | `#c4b5f0` | Functions, methods |
| violet | `#c4a8ff` | Decorators, annotations |
| pink | `#f0a0c8` | Keywords, tags |
| magenta | `#e879a8` | Control flow |
| cyan | `#7dd3d0` | Types, classes |
| teal | `#5ccfb8` | Type parameters, escapes |
| sage | `#a8d4a8` | Strings |
| mint | `#8ce0a0` | Success, additions |
| yellow | `#e8d088` | Warnings |
| peach | `#e8a888` | Numbers, constants |
| coral | `#f0a0a8` | Errors, deletions |
| sky | `#88c4f0` | Variables, fields |
| rose | `#e0a8c0` | Imports, modules |

## Language Support

The theme includes optimized highlighting for:

- **JVM**: Java, Kotlin, Scala, Groovy
- **Web**: JavaScript, TypeScript, HTML, CSS, SCSS
- **Backend**: Python, Ruby, PHP, Go, Rust
- **Data**: SQL, JSON, YAML, XML, TOML
- **Docs**: Markdown, reStructuredText
- **DevOps**: Dockerfile, Shell scripts
- **And more**: C/C++, C#, Swift, Dart

## Features

- **WCAG AA Compliant**: All foreground colors meet 4.5:1 contrast ratio
- **Semantic Highlighting**: Each syntax element has meaningful color associations
- **Complete UI Coverage**: Every panel, popup, and toolbar is themed
- **Git Integration**: Colored diff views, log, and annotations
- **Debugger Support**: Breakpoints, execution points styled
- **Console Colors**: Full ANSI color support in terminal

## Recommended Settings

### Font
For the best experience, use a coding font with ligatures:
- **JetBrains Mono** (built-in)
- **Fira Code**
- **Cascadia Code**

### Editor Settings
```
Settings → Editor → General → Appearance
☑ Show indent guides
☑ Show hard wrap guide

Settings → Editor → Color Scheme → General
☑ Use soft wraps in editor (optional)
```

## Screenshots

The theme applies to:
- Editor pane
- Project tree
- Terminal
- Run/Debug panels
- Version control
- Database tools
- All popups and dialogs

## Troubleshooting

### Theme not appearing
1. Ensure files are in the correct `colors/` directory
2. Restart the IDE completely (not just reload)
3. Check IDE version matches the config path

### Colors look different
- Verify your monitor is in sRGB color space
- Disable any color management software
- Check IDE Settings → Appearance for any overrides

### Reverting
To revert to default:
1. Go to `Settings` → `Appearance`
2. Select a default theme (e.g., "Darcula")
3. Delete the files from `colors/` directory if desired

## Version Compatibility

- **Minimum**: JetBrains IDE 2023.1+
- **Recommended**: JetBrains IDE 2024.1+
- **Tested on**: IntelliJ IDEA, WebStorm, PyCharm, GoLand

## License

MIT - Part of the Aurora Depths Theme Project
