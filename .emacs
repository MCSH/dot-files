
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
(use-package solarized-theme
  :ensure t
  :config
  (load-theme 'solarized-dark t)
  )

(use-package org
  :ensure t)

(use-package evil
  :ensure t
  :config
  (setcdr evil-insert-state-map nil)
  (define-key evil-insert-state-map (kbd "<escape>") 'evil-normal-state)
  )
  

;; Remove the useless stuff
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Interactively do things
(setq ido-enable-flex-matching t)
(ido-mode 1)

;; No default backup
(setq backup-inhibited nil
      make-backup-files nil
      auto-save-default nil
      auto-save-list-file-prefix nil)

;; javascript mode
(setq js-indent-level 2)

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
  (hl-todo-mode 1)
  )


;; Window
(windmove-default-keybindings)

;; EOF
