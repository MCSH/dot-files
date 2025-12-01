;;; 40-languages.el --- Programming language configurations -*- lexical-binding: t; -*-

;;; Commentary:
;; Language-specific modes and LSP configurations

;;; Code:

;;
;; LSP Mode (Language Server Protocol)
;;

(use-package lsp-mode
  :ensure t
  :hook (go-mode . lsp)
  :hook (python-mode . lsp)
  :hook (c++-mode . lsp)
  :hook (c-mode . lsp)
  :hook (dart-mode . lsp)
  :hook (rust-mode . lsp)
  :hook (haskell-mode . lsp)
  :commands lsp
  :config
  (evil-define-key 'normal lsp-mode-map (kbd "g d") 'lsp-find-declaration)
  (setq lsp-dart-sdk-dir "/opt/flutter/bin/cache/dart-sdk")
  (setq gc-cons-threshold 100000000)
  (setq read-process-output-max (* 1024 1024)) ;; 1mb
  (setq lsp-completion-provider :capf)
  (setq lsp-idle-delay 0.500)
  (setq lsp-log-io nil) ; if set to true can cause a performance hit
  (setq lsp-headerline-breadcrumb-enable nil))

(use-package helm-lsp
  :ensure t
  :config
  (define-key lsp-mode-map "\C-c\C-h" 'helm-lsp-code-actions)
  (define-key lsp-mode-map "\C-c\C-d" 'helm-lsp-diagnostics))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :config
  (lsp-enable-imenu)
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-errors-list)

;;
;; JavaScript/TypeScript
;;

;; JavaScript settings
(setq js-indent-level 2)
(setenv "NODE_NO_READLINE" "1")

;; Add async/await keywords to JS
(font-lock-add-keywords 'js-mode
   '(("\\<async\\>" 0 'font-lock-keyword-face prepend)
     ("\\<await\\>" 0 'font-lock-keyword-face prepend)))

;; JSX/React
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
  (add-to-list 'auto-mode-alist '("src\\/.*\\.js\\'" . rjsx-mode)))

(use-package js2-mode
  :ensure t
  :config
  (evil-define-key 'normal js2-mode-map (kbd "g d") 'js2-jump-to-definition)
  (add-to-list 'auto-mode-alist '("\\.mjs\\'" . js2-mode)))

;; TypeScript
(use-package typescript-mode
  :ensure t
  :config
  (setq typescript-indent-level 2))

(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))

;; TSX
(use-package web-mode
  :ensure t)

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))

(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))

(defun setup-tide-mode ()
  "Setup function for tide."
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(flycheck-add-mode 'typescript-tslint 'web-mode)

;;
;; Haskell
;;

(use-package haskell-mode
  :ensure t
  :hook (haskell-mode . interactive-haskell-mode)
  :custom
  (haskell-interactive-popup-errors . nil)
  :config
  (setq haskell-process-type 'stack-ghci)
  (setq haskell-process-path-stack "/home/sajjad/.ghcup/bin/stack"))

(use-package lsp-haskell
  :ensure t
  :config
  (setq lsp-haskell-server-path "/home/sajjad/.ghcup/bin/haskell-language-server-wrapper")
  :hook (haskell-mode . lsp))

;; Commented: Haskell Wingman
;; (lsp-make-interactive-code-action wingman-fill-hole "refactor.wingman.fillHole")
;; (define-key haskell-mode-map (kbd "C-c n") #'lsp-wingman-fill-hole)
;; (lsp-make-interactive-code-action wingman-case-split "refactor.wingman.caseSplit")
;; (define-key haskell-mode-map (kbd "C-c d") #'lsp-wingman-case-split)
;; (lsp-make-interactive-code-action wingman-refine "refactor.wingman.refine")
;; (define-key haskell-mode-map (kbd "C-c r") #'lsp-wingman-refine)
;; (lsp-make-interactive-code-action wingman-split-func-args "refactor.wingman.spltFuncArgs")
;; (define-key haskell-mode-map (kbd "C-c a") #'lsp-wingman-split-func-args")
;; (lsp-make-interactive-code-action wingman-use-constructor "refactor.wingman.useConstructor")
;; (define-key haskell-mode-map (kbd "C-c c") #'lsp-wingman-use-constructor)
;; (lsp-make-interactive-code-action wingman-homo-split "refactor.wingman.homo")
;; (define-key haskell-mode-map (kbd "C-c x") #'lsp-wingman-homo-split)

;;
;; Python
;;

(use-package pyvenv
  :ensure t)

;;
;; Rust
;;

(use-package rust-mode
  :ensure t
  :hook (rust-mode . lsp))

(use-package flycheck-rust
  :ensure t
  :config
  (with-eval-after-load 'rust-mode
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)))

;;
;; Go
;;

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

;;
;; Dart/Flutter
;;

(use-package dart-mode
  :ensure t
  :custom
  (dart-format-on-save t))

(use-package flutter
  :after dart-mode
  :ensure t
  :bind (:map dart-mode-map
              ("C-M-x" . #'flutter-run-or-hot-reload)))

(use-package lsp-dart
  :ensure t)

;;
;; Elixir
;;

(use-package elixir-mode
  :ensure t)

(use-package alchemist
  :ensure t)

(use-package smartparens
  :hook (elixir-mode . smartparens-mode)
  :config
  (defun my-elixir-do-end-close-action (id action context)
    (when (eq action 'insert)
      (newline-and-indent)
      (previous-line)
      (indent-according-to-mode)))

  (sp-with-modes '(elixir-mode)
    (sp-local-pair "do" "end"
                   :when '(("SPC" "RET"))
                   :post-handlers '(:add my-elixir-do-end-close-action)
                   :actions '(insert))))

(add-to-list 'auto-mode-alist '("\\.eex\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.leex\\'" . web-mode))

(setq web-mode-engines-alist
      '(("elixir" . "\\.leex\\'")))

;;
;; Common Lisp / SLIME
;;

(use-package slime
  :ensure t
  :config
  (evil-define-key 'normal slime-mode-map (kbd "g d") 'slime-edit-definition)
  (evil-define-key 'normal slime-mode-map (kbd "g t d") 'slime-edit-definition-other-window)
  (evil-define-key 'normal slime-mode-map (kbd "g b") 'slime-pop-find-definition-stack)
  (evil-define-key 'normal slime-mode-map (kbd "g h") 'slime-documentation-lookup)
  (evil-define-key 'normal slime-repl-mode-map (kbd "g i") 'slime-inspect-presentation-at-point))

(setq inferior-lisp-program "sbcl")

(global-set-key (kbd "C-c C-e") 'slime-eval-last-expression-in-repl)

(use-package helm-slime
  :ensure t)

;; Common Lisp HyperSpec
(load "/home/sajjad/quicklisp/clhs-use-local.el" t)

;;
;; Agda
;;

(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))
(evil-define-key 'normal agda2-mode-map "gd" 'agda2-goto-definition-keyboard)
(setq agda2-fontset-name "mononoki")

;;
;; Idris
;;

(use-package idris-mode
  :ensure t)

;;
;; Idris2
;;

(add-to-list 'load-path "~/.emacs.d/idris2-mode/")
(require 'idris2-mode)

(setq idris2-interpreter-path "~/.idris2/bin/idris2")

;; Commented: Fixes lag when editing idris code with evil
;; (defun ~/evil-motion-range--wrapper (fn &rest args)
;;   "Like `evil-motion-range', but override field-beginning for performance.
;; See URL `https://github.com/ProofGeneral/PG/issues/427'."
;;   (cl-letf (((symbol-function 'field-beginning)
;;              (lambda (&rest args) 1)))
;;     (apply fn args)))
;; (advice-add #'evil-motion-range :around #'~/evil-motion-range--wrapper)

;;
;; C/C++
;;

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;;
;; Markdown
;;

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown")
  :config
  (setq markdown-fontify-code-blocks-natively t))

;;
;; YAML
;;

(use-package yaml-mode
  :ensure t)

;;
;; Vue
;;

(use-package vue-mode
  :ensure t)

(use-package vue-html-mode
  :ensure t)

;;
;; Bison and Lex
;;

(use-package bison-mode
  :ensure t
  :config
  (setq bison-all-electricity-off t)
  (defun bison-indent-new-line () "I don't want this defined")
  (setq bison-mode-map (make-sparse-keymap))
  (define-key bison-mode-map [tab] nil))

;;
;; CMake
;;

(use-package cmake-mode
  :ensure t)

;;
;; Lua
;;

(use-package lua-mode
  :ensure t)

;;
;; GLSL
;;

(use-package glsl-mode
  :ensure t)

;;
;; Protobuf
;;

(use-package protobuf-mode
  :ensure t)

;;
;; CSV
;;

(use-package csv-mode
  :ensure t)

;;
;; Graphviz/DOT
;;

(use-package graphviz-dot-mode
  :ensure t)

;;
;; Envy (custom mode)
;;

(add-to-list 'auto-coding-alist '("\\.envy" . default-generic-mode))

;;
;; Commented: LaTeX/AUCTeX
;;

;; (use-package auctex-latexmk
;;   :ensure t)

;; (load "auctex.el" nil t t)

;; (add-hook 'LaTeX-mode-hook 'visual-line-mode)
;; (add-hook 'LaTeX-mode-hook 'flyspell-mode)
;; (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

;; (setq TeX-parse-self t)
;; (setq-default TeX-master nil)

;; (use-package latex-preview-pane
;;   :ensure t)

(provide '40-languages)
;;; 40-languages.el ends here
