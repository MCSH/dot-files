;; Set up package list
(require 'package)
(add-to-list 'package-archives '("elpa" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

;; Set up use package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))


;; My theme!
(load-theme 'misterioso)

;; Day and night

(defun day () "Make it usefull in bright enviornment"
       (interactive)
       (load-theme 'leuven))

(defun afternoon () "Just a darkish theme"
       (interactive)
       (load-theme 'tango-dark))

(defun night () "Take it back!!!"
       (interactive)
       (load-theme 'misterioso))

(defun latenight () "Just a really dark theem"
       (interactive)
       (load-theme 'deeper-blue))

(use-package org
  :ensure t
  :config
  (setq org-log-done t)
  (define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-ca" 'org-agenda)
  (define-key global-map "\C-cc" 'org-capture)
  (define-key global-map "\C-cb" 'org-iswitchb)
  )

(use-package evil
  :ensure t
  :config
  ;;(define-key evil-normal-state-map (kbd "i") 'evil-emacs-state)
  (setcdr evil-insert-state-map nil)
  (define-key evil-insert-state-map (kbd "<escape>") 'evil-normal-state)
  (define-key evil-emacs-state-map (kbd "<escape>") 'evil-normal-state)
  (evil-mode)
  )
  
;; Scaling fonts

(set-face-attribute 'default nil :height 130)

;; Remove the useless stuff
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Interactively do things
(setq ido-enable-flex-matching t)
(ido-mode 1)

(use-package flx-ido
   :ensure t
   :init (setq ido-enable-flex-matching t
               ido-use-faces nil)
   :config (flx-ido-mode 1))

(use-package smex
  :ensure t
  :init (smex-initialize)
  :bind ("M-x" . smex)
  ("M-X" . smex-major-mode-commands))

;; JSX
(use-package rjsx-mode
  :ensure t
  :config
  (defadvice js-jsx-indent-line (after js-jsx-indent-line-after-hack activate)
  "Workaround sgml-mode and follow airbnb component style."
  (save-excursion
    (beginning-of-line)
    (if (looking-at-p "^ +\/?> *$")
        (delete-char sgml-basic-offset))))
  (add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
  (add-to-list 'auto-mode-alist '("containers\\/.*\\.js\\'" . rjsx-mode))
  (add-to-list 'auto-mode-alist '("src\\/.*\\.js\\'" . rjsx-mode))
  )

(use-package js2-mode
  :ensure t)

;; Helm
(use-package helm
  :ensure t
  :config
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-c C-b") 'helm-buffers-list)
  ;(setq helm-display-function 'helm-display-buffer-in-own-frame
  ;      helm-display-buffer-reuse-frame t
  ;      helm-use-undecorated-frame-option t)
  )

;; No default backup
(setq backup-inhibited nil
      make-backup-files nil
      auto-save-default nil
      auto-save-list-file-prefix nil)

;; javascript mode
(setq js-indent-level 2)
(setenv "NODE_NO_READLINE" "1")

;; Auto pair
(electric-pair-mode 1)
(show-paren-mode 1)

;; Add keywords
(font-lock-add-keywords 'js-mode
   '(("\\<async\\>" 0 'font-lock-keyword-face prepend)
     ("\\<await\\>" 0 'font-lock-keyword-face prepend)))

;; Highlight stuff
(use-package hl-todo
  :ensure t
  :config
  (global-hl-todo-mode 1)
  )

;; Window
(windmove-default-keybindings)

;; Smooth scrolling
(use-package smooth-scrolling
  :ensure t
  :config
  (smooth-scrolling-mode 1)
  (setq smooth-scroll-margin 3)
  )

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time

(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling

(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

;; Agenda file
(setq org-agenda-files (list "~/TODO.org" "~/src/personal/schedule.org"))

;; Powerline
(add-to-list `load-path "~/.emacs.d/vendor/powerline")
(require 'powerline)
;(powerline-default-theme)

(add-to-list `load-path "~/.emacs.d/MCSH")
(require 'powerline-MCSH)

;; Set custom file
(setq custom-file "~/.emacs.d/.custom.el")
(load custom-file)

;; Dashboard
(require 'scratchify-MCSH)

;; No tabs
(setq-default indent-tabs-mode nil)

;; YAML MODE
(use-package yaml-mode
  :ensure t)

(require 'org-team)

;; ESC
(define-key key-translation-map (kbd "ESC") (kbd "C-g"))

;; Ask "y" or "n" instead of "yes" or "no". Yes, laziness is great.
(fset 'yes-or-no-p 'y-or-n-p)

;; Natural spliting
(defun MCSH/split-right () "Split right, the rightway"
       (interactive)
       (split-window-right)
       (other-window 1))
(defun MCSH/split-below () "Split below, the rightway"
       (interactive)
       (split-window-below)
       (other-window 1))
(global-set-key (kbd "C-x C-3") 'MCSH/split-right)
(global-set-key (kbd "C-x C-2") 'MCSH/split-below)

;; Line
(linum-mode 1)

;; git
(use-package magit
  :ensure t
  :config
  (use-package evil-magit
    :ensure t)
  (define-key global-map (kbd "C-c C-g") 'magit)
  (define-key global-map (kbd "C-c g") 'magit)
  )

;; Linum mode
(global-linum-mode)

;; Stop the bloody beep
; (global-set-key (kbd "<mouse-6>") 'ignore)
; (global-set-key (kbd "<mouse-7>") 'ignore)
(setq ring-bell-function 'ignore)

;; Neo Tree
(use-package neotree
  :ensure t
  :config
  (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
  (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
  (evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-next-line)
  (evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-previous-line)
  (evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
  (evil-define-key 'normal neotree-mode-map (kbd "r") 'neotree-refresh)
  (evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle))

;; Vue
(use-package vue-mode
  :ensure t)
(use-package vue-html-mode
  :ensure t)

;; Haskell
(use-package haskell-mode
  :ensure t)

(use-package lsp-haskell
  :ensure t
  :config
  :hook (haskell-mode . lsp)
  )

;; Markdown
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;; Rust
(use-package rust-mode
  :ensure t
  :config
  ;; (add-to-list 'auto-mode-alist '(".rs" . rust-mode))
  )


;; yasnippet
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure t)

;; No kill please
(defun no-kill (orig-kill &rest args)
  (if (y-or-n-p "Are you sure you want to kill?")
      (apply orig-kill args)
      ))
(advice-add 'kill-emacs :around #'no-kill)

;; Projectile
(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  (setq projectile-globally-ignored-directories (append '("node_modules") projectile-globally-ignored-directories))
  (define-key projectile-mode-map (kbd "C-c C-f") 'projectile-find-file)
  (define-key projectile-mode-map (kbd "C-c f") 'projectile-find-file)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

;; Company

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package company-tern
  :ensure t
  :config
  (add-to-list 'company-backends 'company-tern))

;; 2048

(use-package 2048-game
  :ensure t
  :config (defun 2048-g()
            (interactive)
            (2048-game)
            (evil-insert-state)))

;; telegram 

(use-package request
  :ensure t)

(require 'tg)

;; Flutter
(use-package dart-mode
  :ensure t
  :custom
  (dart-format-on-save t))

(use-package flutter
  :after dart-mode
  :ensure t
  :bind (:map dart-mode-map
              ("C-M-x" . #'flutter-run-or-hot-reload)))

;; GO
(use-package go-mode
  :ensure t
  :config 
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'go-mode-hook
            (lambda ()
              (setq tab-width 4)
              (setq indent-tabs-mode nil))))

(use-package go-autocomplete
  :ensure t
  :config
  (defun auto-complete-for-go ()
    (auto-complete-mode 1))
  (add-hook 'go-mode-hook 'auto-complete-for-go))

;; LSP
(use-package lsp-mode
  :ensure t
  :hook (go-mode . lsp)
  :hook (python-mode . lsp)
  :hook (c++-mode . lsp)
  :hook (c-mode . lsp)
  :hook (dart-mode . lsp)
  :commands lsp
  :config
  (evil-define-key 'normal lsp-mode-map (kbd "g d") 'lsp-find-declaration)
  (setq lsp-dart-sdk-dir "/opt/flutter/bin/cache/dart-sdk")
  )

(use-package golden-ratio
  :ensure t
  :config
  (golden-ratio-mode 1))

(defun max-lv-size-func ()
  "Ensure lv is not larger than a size"
  (message "hoof")
  )

(add-hook 'lv-window-hook 'max-lv-size-func)

(use-package company-lsp
  :ensure t
  :commands company-lsp)

(use-package helm-lsp
  :ensure t
  :commands helm-lsp-workspace-symbol)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :config
  (lsp-enable-imenu)
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-errors-list)

(use-package flycheck
  :ensure t
  :config (global-flycheck-mode)
  )

(use-package flycheck-rust
  :ensure t
  :config
  (with-eval-after-load 'rust-mode
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
  )

;; Rumi
(require 'rumi)

;; Bison and Lex
(use-package bison-mode
  :ensure t
  :config
  (setq bison-all-electricity-off t)
  (defun bison-indent-new-line () "I don't want this defined")
  (setq bison-mode-map (make-sparse-keymap))
  (define-key bison-mode-map [tab] nil))

;; Makefile
(define-key global-map "\C-cm" 'compile)

;; ASM

;; (add-to-list 'auto-mode-alist '(".ll" . asm-mode))

;; CMAKE
(use-package cmake-mode
  :ensure t)

;; Load current buffers if available
(desktop-save-mode 1)

;; farsi

(define-key global-map "\C-س" 'save-buffer)

;; lua

(use-package lua-mode
  :ensure t)

;;
(use-package org-journal
  :ensure t
  :custom
  (org-journal-dir "~/writing/journal/")
  (org-journal-file-format "%Y-%m-%d")
  (org-journal-date-format "%e %b %Y (%A)")
  )

(use-package org-pomodoro
  :ensure t)

;; config in MCSH/gcal-secret.el
(use-package org-gcal
  :ensure t
  :config
  (require 'gcal-secret)
  )

;; EOF
