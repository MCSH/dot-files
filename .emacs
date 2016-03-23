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

;; powerline
(require 'powerline)
;; (powerline-default-theme)

(powerline-center-evil-theme)

;; powerline for evil
;; (require 'powerline-evil)

;; change theme
;; (powerline-evil-vim-color-theme)

;; backup files
;; (defconst emacs-tmp-dir (format "%s/%s%s/" temporary-file-directory "emacs" (user-uid)))
;; (setq backup-directory-alist
;;      '((".*" . ,emacs-tmp-dir)))
;; (setq auto-save-file-name-transforms
;;      '(("." ,emacs-tmp-dir t)))
;;(setq auto-save-list-file-prefix
;;      emacs-tmp-dir)

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

;; modify evil
(evil-ex-define-cmd "k[ill]" 'kill-this-buffer)
;; (evil-ex-define-cmd "q" 'kill-this-buffer)

;;(evil-define-command evil-quit (&optional force)
;;  "Closes the current window, current frame, Emacs.
;;If the current frame belongs to some client the client connection
;;is closed."
;;  :repeat nil
;;  (interactive "<!>")
;;  (if (not(equal (buffer-name) "*scratch*"))
;;      (kill-this-buffer)
;;  (condition-case nil
;;      (delete-window)
;;    (error
;;     (if (and (boundp 'server-buffer-clients)
;;              (fboundp 'server-edit)
;;              (fboundp 'server-buffer-done)
;;              server-buffer-clients)
;;         (if force
;;             (server-buffer-done (current-buffer))
;;           (server-edit))
;;       (condition-case nil
;;           (delete-frame)
;;         (error
;;          (if force
;;              (kill-emacs)
;;            (save-buffers-kill-emacs)))))))))



;; tabbar
(require 'tabbar)
(tabbar-mode)

(global-set-key [(meta left)] 'tabbar-backward)
(global-set-key [(meta right)] 'tabbar-forward)


