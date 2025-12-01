;;; .emacs --- Emacs configuration entry point -*- lexical-binding: t; -*-

;;; Commentary:
;; Modular Emacs configuration
;; Configuration files are located in ~/.emacs.d/config/
;;
;; Structure:
;;   00-package-setup.el  - Package management (package.el, use-package)
;;   10-ui.el            - UI, themes, powerline, fonts
;;   20-editing.el       - Evil, completion, projectile, magit
;;   30-org.el           - Org-mode and related packages
;;   40-languages.el     - Programming language modes and LSP
;;   50-custom.el        - Custom functions and personal utilities
;;
;; Original configuration backed up to ~/.emacs.d/.emacs.backup

;;; Code:

;; Add config directory to load path
(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))

;; Load configuration modules in order
(require '00-package-setup)
(require '10-ui)
(require '20-editing)
(require '30-org)
(require '40-languages)
(require '50-custom)

;;; .emacs ends here
