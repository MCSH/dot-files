;;; 30-org.el --- Org-mode configuration -*- lexical-binding: t; -*-

;;; Commentary:
;; Org-mode, org-agenda, and related active packages
;; Archived/unused org configs moved to archived-configs.el

;;; Code:

;;
;; Org Agenda Helper Functions (defined first, before use-package)
;;

(defun MCSH/org-reset-agenda-files ()
  "Set back the original agenda files."
  (setq org-agenda-files (list "~/src/TODO.org" "~/src/personal/schedule.org")))

(defun org-sole-agenda ()
  "Set the current buffer as the only agenda file."
  (interactive)
  (setq org-agenda-files (list (file-truename (buffer-file-name)))))

(defun org-default-agenda ()
  "Reset to default agenda files."
  (interactive)
  (MCSH/org-reset-agenda-files))

(defun org-add-to-agenda ()
  "Add the current buffer to agenda."
  (interactive)
  (add-to-list 'org-agenda-files (file-truename (buffer-file-name))))

;;
;; Org Mode
;;

(use-package org
  :ensure t
  :config
  (setq org-log-done t)
  (define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-ca" 'org-agenda)
  (define-key global-map "\C-cc" 'org-capture)
  (define-key global-map "\C-cb" 'org-iswitchb)
  ;; Agenda files
  (MCSH/org-reset-agenda-files)
  (setq org-agenda-start-on-weekday nil)
  (setq org-agenda-start-day "-1d")
  (add-to-list 'org-modules 'org-habit t))

;; Org-mode image scaling
(setq org-image-actual-width nil)

;; LaTeX preview scaling
(setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))

;;
;; Evil Org
;;

(use-package evil-org
  :ensure t
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'org-mode-hook
            (lambda ()
              (electric-indent-local-mode -1)
              (visual-line-mode)))
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package org-evil
  :ensure t)

;;
;; Org Sticky Header
;;

(use-package org-sticky-header
  :ensure t
  :config
  (setq org-sticky-header-full-path 'full)
  (add-hook 'org-mode-hook 'org-sticky-header-mode))

;;
;; Org Agenda and Line Number Fix
;;

(add-hook 'org-agenda-mode-hook
          (lambda ()
            (linum-mode -1)))

;;
;; Optional: Uncomment to enable additional org packages
;;

;; For more org packages (org-roam, org-journal, org-pomodoro, etc.),
;; see archived-configs.el

(provide '30-org)
;;; 30-org.el ends here
