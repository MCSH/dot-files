;;; archived-configs.el --- Disabled/unused configurations -*- lexical-binding: t; -*-

;;; Commentary:
;; This file contains configurations that are currently disabled but kept for reference.
;; To use any of these, uncomment the relevant section and add
;; (load (expand-file-name "config/archived-configs.el" user-emacs-directory))
;; to your .emacs file.

;;; Code:

;;
;; ============================================================================
;; ORG-ROAM CONFIGURATION (No longer in use)
;; ============================================================================
;;

;; (setq org-directory (concat (getenv "HOME") "/src/roam/"))

;; (use-package org-roam
;;   :after org
;;   :ensure t
;;   :init (setq org-roam-v2-ack t)
;;   :custom
;;   (org-roam-directory (file-truename org-directory))
;;   (org-roam-complete-everywhere t)
;;   (org-roam-capture-templates
;;    '(
;;      ("d" "default" plain "%?"
;;       :target (file+head "${slug}.org" "#+title: ${title}\n#+date: %U\n") :unnarrowed t :immediate-finish t)
;;      ("b" "book notes" plain (file "~/src/roam/templates/BookNoteTemplate.org")
;;       :target (file+head "${slug}.org" "#+title: ${title}\n#+date: %U\n") :unnarrowed t :immediate-finish t)
;;      ("f" "finance" plain (file "~/src/roam/templates/FinanceTemplate.org")
;;       :target (file+head "finance/${slug}.org" "#+title: ${title}\n#+date: %U\n#+filetags: :Finance:draft:\n") :unarrowed t :immediate-finish t )
;;      ("l" "programming language" plain (file "~/src/roam/templates/LanguageTemplate.org")
;;       :target (file+head "${slug}.org" "#+title: ${title}\n#+date: %U\n") :unnarrowed t :immediate-finish t)))
;;   :config
;;   (org-roam-setup)
;;   :bind (("C-c n f" . org-roam-node-find)
;;          ("C-c n g" . org-roam-graph)
;;          ("C-c n r" . org-roam-node-random)
;;          ("C-c n c" . org-roam-capture)
;;          ("C-c n J" . org-roam-dailies-goto-today)
;;          (:map org-mode-map
;;                (("C-c n i" . org-roam-node-insert)
;;                 ("C-c n o" . org-id-get-create)
;;                 ("C-c n t" . org-roam-tag-add)
;;                 ("C-c n a" . org-roam-alias-add)
;;                 ("C-c n l" . org-roam-buffer-toggle)
;;                 ("C-c n b" . helm-bibtex)
;;                 ("C-M-i" . completion-at-point))))
;;   :bind-keymap
;;   ("C-c n j" . org-roam-dailies-map))

;; (defadvice org-roam-insert (around put-cursor-after-text activate)
;;   "Make it so that org roam insert cursor goes after the inserted text"
;;   (insert " ")
;;   (save-excursion
;;     (backward-char)
;;     ad-do-it)
;;   (insert " "))

;; (defun mcsh/tag-new-node-as-draft ()
;;   (org-roam-tag-add '("draft")))
;; (add-hook 'org-roam-capture-new-node-hook #'mcsh/tag-new-node-as-draft)

;; (add-to-list 'display-buffer-alist
;;              '("\\*org-roam\\*"
;;                (display-buffer-in-side-window)
;;                (side . right)
;;                (slot . 0)
;;                (window-width . 0.33)
;;                (window-parameters . ((no-other-window . t)
;;                                      (no-delete-other-windows . t)))))

;; (setq org-roam-mode-section-functions
;;       (list #'org-roam-backlinks-section
;;             #'org-roam-reflinks-section
;;             #'org-roam-unlinked-references-section))

;; (require 'org-roam-protocol)

;; (setq org-roam-dailies-directory "daily/")

;; (setq org-roam-dailies-capture-templates
;;       '(("d" "default" entry
;;          "* %?"
;;          :target (file+head "%<%Y-%m-%d>.org"
;;                             "#+title: %<%Y-%m-%d>\n"))))

;; (use-package deft
;;   :after org
;;   :ensure t
;;   :bind
;;   ("C-c n d" . deft)
;;   :custom
;;   (deft-recursive t)
;;   (deft-use-filter-string-for-filename t)
;;   (deft-default-extension "org")
;;   (deft-directory org-roam-directory))

;;
;; Org Roam UI
;;

;; (use-package websocket
;;   :ensure t)
;; (use-package simple-httpd
;;   :ensure t)

;; (add-to-list 'load-path "~/.emacs.d/org-roam-ui/")
;; (load-library "org-roam-ui")

;; (setq org-roam-ui-sync-theme t
;;       org-roam-ui-follow t
;;       org-roam-ui-update-on-save t
;;       org-roam-ui-open-on-start t)

;;
;; Org Ref (Citations) - Related to org-roam
;;

;; (use-package org-ref
;;   :ensure t
;;   :config
;;   (setq org-ref-bibliography-notes "~/src/roam/bibnotes.org"
;;         org-ref-default-bibliography '("~/src/bibs/library.bib")
;;         org-ref-pdf-directory "~/src/manitoba/2.ref/")
;;   (setq bibtex-completion-bibliography "~/src/bibs/library.bib"
;;         bibtex-completion-library-path "~/src/manitoba/2.ref"
;;         bibtex-completion-notes-path "~/src/roam/"))

;; (defun mcsh/bibtex-completion-format-citation-org-cite (keys)
;;   "Format org-links using Org mode's own cite syntax."
;;   (format "cite:%s"
;;     (s-join ";"
;;             (--map (format "%s" it) keys))))

;; (use-package helm-bibtex
;;   :ensure t
;;   :config
;;   (setq bibtex-completion-format-citation-functions
;;         '((org-mode . mcsh/bibtex-completion-format-citation-org-cite)
;;           (latex-mode . bibtex-completion-format-citation-cite)
;;           (markdown-mode . bibtex-completion-format-citation-pandoc-citeproc)
;;           (python-mode . bibtex-completion-format-citation-sphinxcontrib-bibtex)
;;           (rst-mode . bibtex-completion-format-citation-sphinxcontrib-bibtex)
;;           (default . bibtex-completion-format-citation-default)))
;;   (helm-add-action-to-source "Insert Link" 'helm-bibtex-insert-citation helm-source-bibtex 0))

;; (use-package org-roam-bibtex
;;   :ensure t
;;   :config
;;   (org-roam-bibtex-mode 1))

;;
;; ============================================================================
;; ORG-MODE OPTIONAL PACKAGES
;; ============================================================================
;;

;; Org Journal
;; (use-package org-journal
;;   :ensure t
;;   :custom
;;   (org-journal-dir "~/writing/journal/")
;;   (org-journal-file-format "%Y-%m-%d")
;;   (org-journal-date-format "%e %b %Y (%A)"))

;; Org Pomodoro
;; (use-package org-pomodoro
;;   :ensure t
;;   :custom
;;   (org-pomodoro-keep-killed-pomodoro-time t))

;; Org Edna
;; (use-package org-edna
;;   :ensure t
;;   :config
;;   (org-edna-mode))

;; Org Refile
;; (setq org-refile-targets '((org-agenda-files :maxlevel . 3)))
;; (setq org-outline-path-complete-in-steps nil)
;; (setq org-refile-use-outline-path 'file)

;; Org Babel
;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((ruby . t)
;;    (shell . t)
;;    (python . t)
;;    (dot . t)
;;    (gnuplot . t)
;;    (R . t)))

;; (use-package ess
;;   :ensure t)

;; Org GCal
;; (require 'my-secrets)
;; (use-package org-gcal
;;   :ensure t)
;; (require 'org-gcal)
;; (setq plstore-cache-passphrase-for-symmetric-encryption t)
;; (setq org-gcal-fetch-file-alist
;;       '(("sajjadheydari74@gmail.com" . "~/src/personal/schedule.org")))

;;
;; ============================================================================
;; HASKELL WINGMAN (LSP extensions)
;; ============================================================================
;;

;; (lsp-make-interactive-code-action wingman-fill-hole "refactor.wingman.fillHole")
;; (define-key haskell-mode-map (kbd "C-c n") #'lsp-wingman-fill-hole)
;; (lsp-make-interactive-code-action wingman-case-split "refactor.wingman.caseSplit")
;; (define-key haskell-mode-map (kbd "C-c d") #'lsp-wingman-case-split)
;; (lsp-make-interactive-code-action wingman-refine "refactor.wingman.refine")
;; (define-key haskell-mode-map (kbd "C-c r") #'lsp-wingman-refine)
;; (lsp-make-interactive-code-action wingman-split-func-args "refactor.wingman.spltFuncArgs")
;; (define-key haskell-mode-map (kbd "C-c a") #'lsp-wingman-split-func-args)
;; (lsp-make-interactive-code-action wingman-use-constructor "refactor.wingman.useConstructor")
;; (define-key haskell-mode-map (kbd "C-c c") #'lsp-wingman-use-constructor)
;; (lsp-make-interactive-code-action wingman-homo-split "refactor.wingman.homo")
;; (define-key haskell-mode-map (kbd "C-c x") #'lsp-wingman-homo-split)

;;
;; ============================================================================
;; IDRIS PERFORMANCE FIX
;; ============================================================================
;;

;; (defun ~/evil-motion-range--wrapper (fn &rest args)
;;   "Like `evil-motion-range', but override field-beginning for performance.
;; See URL `https://github.com/ProofGeneral/PG/issues/427'."
;;   (cl-letf (((symbol-function 'field-beginning)
;;              (lambda (&rest args) 1)))
;;     (apply fn args)))
;; (advice-add #'evil-motion-range :around #'~/evil-motion-range--wrapper)

;;
;; ============================================================================
;; LATEX/AUCTEX
;; ============================================================================
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

;;
;; ============================================================================
;; COPILOT
;; ============================================================================
;;

;; (use-package editorconfig
;;   :ensure t)

;; (load-file "~/.emacs.d/copilot.el/copilot.el")

;; (add-hook 'prog-mode-hook 'copilot-mode)
;; (customize-set-variable 'copilot-enable-predicates
;;                         '(evil-insert-state-p))

;; (defun my-tab ()
;;   (interactive)
;;   (or (copilot-accept-completion)
;;       (company-indent-or-complete-common nil)))

;; (with-eval-after-load 'company
;;   (delq 'company-preview-if-just-one-frontend company-frontends)
;;   (define-key company-mode-map (kbd "C-<tab>") 'my-tab)
;;   (define-key company-mode-map (kbd "C-TAB") 'my-tab)
;;   (define-key company-active-map (kbd "C-<tab>") 'my-tab)
;;   (define-key company-active-map (kbd "C-TAB") 'my-tab))

;; (with-eval-after-load 'copilot
;;   (evil-define-key 'insert copilot-mode-map
;;     (kbd "C-<tab>") #'my-tab))

;; (add-hook 'post-command-hook (lambda ()
;;                                (copilot-clear-overlay)
;;                                (when (evil-insert-state-p)
;;                                  (copilot-complete))))

;;
;; ============================================================================
;; TABNINE
;; ============================================================================
;;

;; (use-package company-tabnine
;;   :ensure t
;;   :config
;;   (add-to-list 'company-backends #'company-tabnine)
;;   (setq company-idle-delay 0)
;;   (setq company-show-numbers t))

;;
;; ============================================================================
;; IDO/SMEX (Replaced by Helm)
;; ============================================================================
;;

;; (setq ido-enable-flex-matching t)
;; (ido-mode 1)

;; (use-package flx-ido
;;    :ensure t
;;    :init (setq ido-enable-flex-matching t
;;                ido-use-faces nil)
;;    :config (flx-ido-mode 1))

;; (use-package smex
;;   :ensure t
;;   :init (smex-initialize)
;;   :bind ("M-x" . smex)
;;   ("M-X" . smex-major-mode-commands))

;;
;; ============================================================================
;; DESKTOP SAVE MODE
;; ============================================================================
;;

;; (desktop-save-mode 1)

;;
;; ============================================================================
;; DASHBOARD
;; ============================================================================
;;

;; (use-package dashboard
;;   :ensure t
;;   :config
;;   (dashboard-setup-startup-hook)
;;   (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
;;   (setq dashboard-projects-backend 'projectile)
;;   (setq dashboard-footer-icon "Go forth and change the world!")
;;   (setq dashboard-center-content 0)
;;   (setq dashboard-items '(
;;                           (projects . 5)
;;                           (bookmarks . 5)
;;                           (agenda . 5)
;;                           (recents  . 5)))
;;   (setq dashboard-set-navigator t)
;;   (setq dashboard-show-shortcuts nil)
;;   (setq dashboard-set-footer nil)
;;   (setq dashboard-startup-banner nil)
;;   (setq dashboard-week-agenda nil)
;;   (define-key dashboard-mode-map (kbd "<cr>") 'dashboard-return))

;;
;; ============================================================================
;; UNDO TREE
;; ============================================================================
;;

;; (global-undo-tree-mode)

;;
;; ============================================================================
;; ORIGAMI (Code Folding)
;; ============================================================================
;;

;; (use-package origami
;;   :ensure t)

;;
;; ============================================================================
;; ORG TEAM (Custom package)
;; ============================================================================
;;

;; (require 'org-team)

;;
;; ============================================================================
;; COMPANY-TERN (JavaScript)
;; ============================================================================
;;

;; (use-package company-tern
;;   :ensure t
;;   :config
;;   (add-to-list 'company-backends 'company-tern))

(provide 'archived-configs)
;;; archived-configs.el ends here
