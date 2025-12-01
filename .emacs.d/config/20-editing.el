;;; 20-editing.el --- Editing configuration -*- lexical-binding: t; -*-

;;; Commentary:
;; Evil mode, completion, snippets, and general editing enhancements

;;; Code:

;;
;; Evil Mode
;;

(use-package evil
  :ensure t
  :config
  (setcdr evil-insert-state-map nil)
  (define-key evil-insert-state-map (kbd "<escape>") 'evil-normal-state)
  (define-key evil-emacs-state-map (kbd "<escape>") 'evil-normal-state)
  (define-key evil-normal-state-map (kbd "<f3>") 'neotree-toggle)
  (evil-mode))

;;
;; Helm - Completion Framework
;;

(use-package helm
  :ensure t
  :config
  (helm-mode 1)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-c C-b") 'helm-buffers-list)
  (global-set-key (kbd "C-x C-f") 'helm-find-files))

(use-package helm-flx
  :ensure t
  :config
  (setq helm-flx-for-helm-find-files t ;; t by default
        helm-flx-for-helm-locate nil) ;; nil by default
  (helm-flx-mode 1))

;;
;; Company - Auto-completion
;;

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (setf company-idle-delay 0.1))

;; Commented: company-tern (if needed, uncomment)
;; (use-package company-tern
;;   :ensure t
;;   :config
;;   (add-to-list 'company-backends 'company-tern))

;;
;; Yasnippet - Snippets
;;

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure t)

;;
;; Projectile - Project Management
;;

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  (setq projectile-globally-ignored-directories
        (append '("node_modules") projectile-globally-ignored-directories))
  (setq projectile-indexing-method 'hybrid)
  (define-key projectile-mode-map (kbd "C-c C-f") 'projectile-find-file)
  (define-key projectile-mode-map (kbd "C-c f") 'projectile-find-file)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on)
  (setq projectile-completion-system 'helm
        projectile-switch-project-action 'helm-projectile))

;;
;; Flycheck - Syntax Checking
;;

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode))

;;
;; Magit - Git Interface
;;

(use-package magit
  :ensure t
  :config
  (define-key global-map (kbd "C-c g") 'magit))

;;
;; NeoTree - File Tree
;;

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

;;
;; Golden Ratio - Window Sizing
;;

(use-package golden-ratio
  :ensure t
  :config
  (golden-ratio-mode 0) ;; disable by default
  (setq golden-ratio-adjust-factor 1.0
        golden-ratio-wide-adjust-factor .8)

  (defun fix-ratio (orig &rest args)
    "Fix ratio after window switch."
    (apply orig args)
    (golden-ratio))
  (advice-add 'evil-window-next :around 'fix-ratio))

(defun max-lv-size-func ()
  "Ensure lv is not larger than a size."
  (message "hoof"))

(golden-ratio-toggle-widescreen)
(add-hook 'lv-window-hook 'max-lv-size-func)

;;
;; Smartparens
;;

(use-package smartparens
  :ensure t)

;;
;; Electric Pair and Paren Matching
;;

(electric-pair-mode 1)
(show-paren-mode 1)

;;
;; Editing Preferences
;;

;; No tabs, use spaces
(setq-default indent-tabs-mode nil)

;; No backup files
(setq backup-inhibited nil
      make-backup-files nil
      auto-save-default nil
      auto-save-list-file-prefix nil)

;; Window navigation
(windmove-default-keybindings)

;; ESC quits
(define-key key-translation-map (kbd "ESC") (kbd "C-g"))

;;
;; Surround with pair
;;

(global-set-key (kbd "M-[") 'insert-pair)
(global-set-key (kbd "M-{") 'insert-pair)
(global-set-key (kbd "M-\"") 'insert-pair)
(global-set-key (kbd "M-ج") (lambda ()
                              (interactive)
                              (insert-pair nil ?\[ ?\])))

;;
;; Compilation
;;

;; Enable colors in compilation
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  "Colorize compilation buffer."
  (toggle-read-only)
  (ansi-color-apply-on-region compilation-filter-start (point))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;; Compilation window auto close
(setq auto-hide-compilation t)

(setq compilation-finish-functions
      (lambda (buf str)
        (if (null (string-match ".*exited abnormally.*" str))
            ;; no errors, make the compilation window go away in a few seconds
            (if auto-hide-compilation
                (progn
                  (run-at-time
                   "1 sec" nil 'quit-windows-on
                   (get-buffer-create "*compilation*"))
                  (message "No Compilation Errors!"))
              nil))))

(defun toggle-compile-autohide ()
  "Toggle auto hiding compile."
  (interactive)
  (setq auto-hide-compilation (not auto-hide-compilation)))

(define-key global-map "\C-cm" 'compile)

;;
;; Default Input Method
;;

(setq default-input-method "farsi-isiri-9147")

;;
;; Exec Path from Shell
;;

(use-package exec-path-from-shell
  :ensure t)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(when (daemonp)
  (exec-path-from-shell-initialize))

(provide '20-editing)
;;; 20-editing.el ends here
