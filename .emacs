;; disable splash screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(add-to-list 'load-path "~/.emacs.d/lisp/")
(let ((default-directory "~/.emacs.d/lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

;; evil mode
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)


;; got this using: C-0 M-: package-activated-list RET
(defvar my/packages
 '(auto-complete popup evil-magit magit magit-popup dash async git-commit with-editor dash async dash with-editor dash async dash async evil goto-chg undo-tree f dash s goto-chg magit magit-popup dash async git-commit with-editor dash async dash with-editor dash async dash async magit-popup dash async popup s undo-tree with-editor dash async)) 

(require 'evil)
(evil-mode 1)

(require 'evil-magit)

;; use shift-arrow to move cursor around split pages
(windmove-default-keybindings)


;; disable backup files
(setq make-backup-files nil)

;; set black background:
(add-to-list 'default-frame-alist '(foreground-color . "#E0DFDB"))
(add-to-list 'default-frame-alist '(background-color . "#000000"))

;; Line numbers:
(global-linum-mode t)

;; highlight line number:
(require 'highlight-line-number)

;; Show matching paranthesis
(show-paren-mode 1)

;; disable menus
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Load my theme and setting for powerline
(require 'powerline-MCSH)

;; modify evil
(evil-ex-define-cmd "k[ill]" 'kill-this-buffer)
;; (evil-ex-define-cmd "q" 'kill-this-buffer)

;; tabbar
(require 'tabbar)
(tabbar-mode)

(global-set-key [(meta left)] 'tabbar-backward)
(global-set-key [(meta right)] 'tabbar-forward)

;; Auto Complete
(ac-config-default)

;; Always follow symlinks
(setq vc-follow-symlinks t)
