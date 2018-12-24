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
  )

(use-package js2-mode
  :ensure t)

;; Helm
(use-package helm
  :ensure t
  :config
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-c C-b") 'helm-buffers-list))

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
(setq org-agenda-files (list "~/TODO.org"))

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
  )

;; escreen
(use-package escreen
  :ensure t
  :config
  (escreen-install)
  (setq escreen-prefix-char "\C-\\")
  (global-set-key escreen-prefix-char 'escreen-prefix)
  )

;; Linum mode
(global-linum-mode)

;; Stop the bloody beep
; (global-set-key (kbd "<mouse-6>") 'ignore)
; (global-set-key (kbd "<mouse-7>") 'ignore)
(setq ring-bell-function 'ignore)

;; Neo Tree
(use-package neotree
  :ensure t)

;; Vue
(use-package vue-mode
  :ensure t)
(use-package vue-html-mode
  :ensure t)

;; Day and night

(defun day () "Make it usefull in bright enviornment"
       (interactive)
       (load-theme 'tango))

(defun night () "Take it back!!!"
       (interactive)
       (disable-theme 'tango))

;; Haskell
(use-package haskell-mode
  :ensure t)

;; Markdown
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;; EOF
