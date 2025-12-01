;;; 10-ui.el --- UI configuration and themes -*- lexical-binding: t; -*-

;;; Commentary:
;; Theme management, powerline, and UI tweaks

;;; Code:

;;
;; Theme Management
;;

;; Load default theme
(load-theme 'misterioso)

;; Theme switching functions
(defun disable-all-themes ()
  "Disable all active themes."
  (dolist (i custom-enabled-themes)
    (disable-theme i)))

(defun day ()
  "Make it useful in bright environment."
  (interactive)
  (disable-all-themes)
  (load-theme 'leuven)
  (powerline-reset))

(defun afternoon ()
  "Just a darkish theme."
  (interactive)
  (disable-all-themes)
  (load-theme 'tango-dark)
  (powerline-reset))

(defun night ()
  "Take it back!!!"
  (interactive)
  (disable-all-themes)
  (load-theme 'misterioso)
  (powerline-reset))

(defun altnight ()
  "For greener nights!"
  (interactive)
  (disable-all-themes)
  (load-theme 'wombat)
  (powerline-reset))

(defun latenight ()
  "Just a really dark theme."
  (interactive)
  (disable-all-themes)
  (load-theme 'deeper-blue)
  (powerline-reset))

;;
;; UI Elements
;;

;; Remove unnecessary UI elements
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Font scaling
(set-face-attribute 'default nil :height 90) ;; 110

(defun zoomin ()
  "Zoom in font size."
  (interactive)
  (set-face-attribute 'default nil :height 160))

(defun zoomout ()
  "Zoom out font size."
  (interactive)
  (set-face-attribute 'default nil :height 90))

;;
;; Scrolling
;;

;; Smooth scrolling
(use-package smooth-scrolling
  :ensure t
  :config
  (smooth-scrolling-mode 1)
  (setq smooth-scroll-margin 3))

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

;;
;; Powerline
;;

(add-to-list 'load-path "~/.emacs.d/vendor/powerline")
(require 'powerline)
(require 'powerline-MCSH)

;;
;; Line Numbers
;;

(global-display-line-numbers-mode)

;;
;; Winner Mode (window change tracking)
;;

(winner-mode +1)
(define-key winner-mode-map (kbd "<M-left>") #'winner-undo)
(define-key winner-mode-map (kbd "<M-right>") #'winner-redo)

;;
;; New Frame Size
;;

(add-hook 'after-make-frame-functions
          '(lambda (fr)
             (set-frame-height fr 40)
             (set-frame-width fr 80)))

;;
;; Misc UI Settings
;;

;; Stop the bloody beep
(setq ring-bell-function 'ignore)

;; Ask "y" or "n" instead of "yes" or "no"
(fset 'yes-or-no-p 'y-or-n-p)

;; Just follow symlinks
(setq vc-follow-symlinks t)

;; Highlight TODO keywords
(use-package hl-todo
  :ensure t
  :config
  (global-hl-todo-mode 1))

(provide '10-ui)
;;; 10-ui.el ends here
