;;; 50-custom.el --- Custom functions and utilities -*- lexical-binding: t; -*-

;;; Commentary:
;; Custom helper functions, scripts, and personal utilities
;; Archived/unused configs moved to archived-configs.el

;;; Code:

;;
;; Custom Window Splitting Functions
;;

(defun MCSH/split-right ()
  "Split right, the right way."
  (interactive)
  (split-window-right)
  (other-window 1))

(defun MCSH/split-below ()
  "Split below, the right way."
  (interactive)
  (split-window-below)
  (other-window 1))

(global-set-key (kbd "C-x C-3") 'MCSH/split-right)
(global-set-key (kbd "C-x C-2") 'MCSH/split-below)

;;
;; Kill Emacs Confirmation
;;

(defun no-kill (orig-kill &rest args)
  "Ask before killing Emacs."
  (if (y-or-n-p "Are you sure you want to kill?")
      (apply orig-kill args)))

(advice-add 'kill-emacs :around #'no-kill)

;;
;; Custom Dashboards and Utilities
;;

;; Dashboard
(require 'scratchify-MCSH)

;; SAM
(require 'sam)

;; Rumi
(require 'rumi)

;; Sin
(require 'sin)

;; Telegram
(use-package request
  :ensure t)

(require 'tg)

;; Load secrets
(require 'my-secrets)

;;
;; Remote Development
;;

;; SLIME over RPI
(defvar *current-tramp-path* nil)

(defun connect-to-host (path)
  "Connect SLIME to remote host at PATH."
  (setq *current-tramp-path* path)
  (setq slime-translate-from-lisp-filename-function
    (lambda (f)
      (concat *current-tramp-path* f)))
  (setq slime-translate-to-lisp-filename-function
    (lambda (f)
      (substring f (length *current-tramp-path*))))
  (slime-connect "192.168.0.164" 4005))

(defun rpi-slime ()
  "Connect to RPI SLIME."
  (interactive)
  (connect-to-host "/ssh:192.168.0.164:"))

(defun rpi-home-dir ()
  "Open RPI home directory."
  (interactive)
  (find-file (concat "/ssh:192.168.0.164:" "/home/sajjad/")))

(defun connect-tornado ()
  "Setup SLIME path mapping for tornado project."
  (interactive)
  (setq mslime-dirlist '(("/home/sajjad/src/2023/3.torn/" . "/root/tornado/")
                         ("/home/sajjad/common-lisp/clog/" . "/root/quicklisp/dists/quicklisp/software/clog-20230618-git/")
                         ("/home/sajjad/quicklisp/dists/quicklisp/software/lispcord-20200925-git/" . "/root/quicklisp/dists/quicklisp/software/lispcord-20230618-git/")
                         ("/home/sajjad/quicklisp/" . "/root/quicklisp/")))
    (setq slime-from-lisp-filename-function
          (lambda (f)
            (let ((dirs (car (seq-filter (lambda (x) (string-prefix-p (cdr x) f)) mslime-dirlist))))
              (if dirs
                  (concat (car dirs) (substring f (length (cdr dirs))))
                f))))
    (setq slime-to-lisp-filename-function
          (lambda (f)
            (let ((dirs (car (seq-filter (lambda (x) (string-prefix-p (car x) f)) mslime-dirlist))))
              (if dirs
                  (concat (cdr dirs) (substring f (length (car dirs))))
                f)))))

(connect-tornado)

;;
;; Utilities and Tools
;;

;; Presentation mode
(use-package epresent
  :ensure t
  :config
  (add-hook 'epresent-start-presentation-hook (lambda () (evil-insert-state))))

;; Code screenshots
(use-package carbon-now-sh
  :ensure t)

;; 2048 game
(use-package 2048-game
  :ensure t
  :config (defun 2048-g()
            (interactive)
            (2048-game)
            (evil-insert-state)))

;;
;; IRC/ERC Configuration
;;

(setq erc-default-server "irc.libera.chat")
(setq erc-autojoin-channels-alist
          '(("irc.libera.chat" "#lisp")))
(setq erc-nick '("MCSH"))

;;
;; Set Custom File Location
;;

(setq custom-file "~/.emacs.d/.custom.el")
(load custom-file)

;;
;; Optional: Archived configurations
;;

;; For disabled/unused configs (copilot, tabnine, dashboard, etc.),
;; see archived-configs.el
;; To enable, uncomment in archived-configs.el and load it in .emacs

(provide '50-custom)
;;; 50-custom.el ends here
