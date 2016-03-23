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
  '(evil goto-chg undo-tree goto-chg undo-tree))

(require 'evil)
(evil-mode 1)

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
