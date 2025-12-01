# Emacs Configuration Modules

This directory contains modular Emacs configuration files, loaded in numerical order.

## Structure

### `00-package-setup.el`
Package management initialization
- Sets up MELPA, ELPA, and Org package archives
- Installs and configures `use-package`
- Adds MCSH custom directory to load path

### `10-ui.el`
User interface and visual configuration
- Theme management functions (day, afternoon, night, altnight, latenight)
- Font scaling (zoomin, zoomout)
- Powerline configuration
- UI element removal (scrollbar, toolbar, menubar)
- Smooth scrolling
- Line numbers
- Winner mode (window history)
- General UI preferences

### `20-editing.el`
Editing enhancements and tools
- **Evil mode** - Vim keybindings
- **Helm** - Completion framework
- **Company** - Auto-completion
- **Yasnippet** - Snippet expansion
- **Projectile** - Project management
- **Flycheck** - Syntax checking
- **Magit** - Git interface
- **NeoTree** - File tree
- **Golden Ratio** - Automatic window sizing
- Compilation with color support
- Window navigation
- Electric pair mode

### `30-org.el`
Org-mode configuration
- Org-mode base configuration
- Org-agenda setup and helper functions
- Evil-org integration
- Org-sticky-header

**Note:** org-roam and other optional packages moved to `archived-configs.el`

### `40-languages.el`
Programming language support
- **LSP Mode** - Language Server Protocol
- **JavaScript/TypeScript** - js2-mode, rjsx-mode, tide, web-mode
- **Haskell** - haskell-mode, lsp-haskell
- **Python** - pyvenv
- **Rust** - rust-mode, flycheck-rust
- **Go** - go-mode
- **Dart/Flutter** - dart-mode, flutter, lsp-dart
- **Elixir** - elixir-mode, alchemist
- **Common Lisp** - SLIME, helm-slime
- **Agda** - agda2-mode
- **Idris/Idris2** - idris-mode, idris2-mode
- **C/C++** - LSP integration
- **Markdown** - markdown-mode
- **Others** - YAML, Vue, Bison, CMake, Lua, GLSL, Protobuf, CSV, Graphviz

### `50-custom.el`
Personal functions and utilities
- Custom window splitting functions
- Kill Emacs confirmation
- Custom dashboards (scratchify-MCSH, SAM, Rumi, Sin)
- Telegram integration
- Remote SLIME development (RPI connection)
- Presentation mode (epresent)
- Code screenshots (carbon-now-sh)
- 2048 game
- ERC/IRC configuration
- Custom file loading

**Note:** Copilot, TabNine, Dashboard, and other unused configs moved to `archived-configs.el`

### `archived-configs.el`
Disabled/unused configurations (not loaded by default)
- **Org-roam** - Full configuration (no longer in use)
- **Org-roam-ui** - UI for org-roam
- **Org-ref** - Citations for org-roam
- **Optional org packages** - org-journal, org-pomodoro, org-edna, org-babel
- **Copilot** - AI pair programming
- **TabNine** - AI completion
- **Dashboard** - Startup dashboard
- **Ido/Smex** - Replaced by Helm
- **Desktop save mode** - Session persistence
- **Undo tree** - Advanced undo
- **Origami** - Code folding

To enable any archived config: edit `archived-configs.el`, uncomment the desired section,
and add `(load (expand-file-name "config/archived-configs.el" user-emacs-directory))` to `.emacs`

## Keybindings Reference

All original keybindings are preserved. Key highlights:

### Org-mode
- `C-c l` - org-store-link
- `C-c a` - org-agenda
- `C-c c` - org-capture
- `C-c b` - org-iswitchb

### Evil Mode
- `<escape>` - Return to normal state
- `<F3>` - Toggle NeoTree

### Helm
- `M-x` - helm-M-x
- `C-c C-b` - helm-buffers-list
- `C-x C-f` - helm-find-files

### Projectile
- `C-c C-f` / `C-c f` - projectile-find-file
- `C-c p` - projectile-command-map

### Git
- `C-c g` - magit

### Window Management
- `C-x C-2` - MCSH/split-below
- `C-x C-3` - MCSH/split-right
- `<M-left>` - winner-undo
- `<M-right>` - winner-redo

### Compilation
- `C-c m` - compile

### LSP
- `g d` - lsp-find-declaration (in normal mode)
- `C-c C-h` - helm-lsp-code-actions
- `C-c C-d` - helm-lsp-diagnostics

## Theme Switching

Interactive functions for different lighting conditions:
- `M-x day` - Bright theme (leuven)
- `M-x afternoon` - Dark theme (tango-dark)
- `M-x night` - Default dark (misterioso)
- `M-x altnight` - Green dark (wombat)
- `M-x latenight` - Very dark (deeper-blue)

## Customization

To customize settings:
1. Edit the appropriate module file in `~/.emacs.d/config/`
2. Reload Emacs or use `M-x eval-buffer`

To enable commented-out features:
1. Find the relevant section in the module
2. Uncomment the configuration
3. Restart Emacs or evaluate the region

## Backup

The original monolithic configuration is backed up at:
`~/.emacs.d/.emacs.backup`

## Troubleshooting

If you encounter issues:
1. Check `*Messages*` buffer for errors
2. Try loading modules individually to isolate the problem
3. Restore from backup: `cp ~/.emacs.d/.emacs.backup ~/.emacs`
