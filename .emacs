;; disable splash screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(add-to-list 'load-path "~/.emacs.d/lisp/")
(let ((default-directory "~/.emacs.d/lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)


;; got this using: C-0 M-: package-activated-list RET
(defvar my/packages
 '(auto-complete popup evil-magit magit magit-popup dash async git-commit with-editor dash async dash with-editor dash async dash async evil goto-chg undo-tree f dash s goto-chg magit magit-popup dash async git-commit with-editor dash async dash with-editor dash async dash async magit-popup dash async popup s undo-tree with-editor dash async)) 


;; evil mode
;;;; Change C-z for switching evil to C-`
(require 'evil)
(evil-mode 1)

(require 'evil-magit)

;; use shift-arrow to move cursor around split pages
(windmove-default-keybindings)


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

;; Load my theme and setting for powerline
(require 'powerline-MCSH)

;; modify evil
(evil-ex-define-cmd "k[ill]" 'kill-buffer)
;; (evil-ex-define-cmd "q" 'kill-this-buffer)

;; tabbar
(require 'tabbar)
;;(tabbar-mode)

(global-set-key [(meta left)] 'tabbar-backward)
(global-set-key [(meta right)] 'tabbar-forward)

;; Auto Complete
(ac-config-default)

;; Always follow symlinks
(setq vc-follow-symlinks t)

;; evil - org mode
(require 'evil-org)

;; Set the scratch message:
(setq initial-scratch-message "Live long and prosper")




;; Set suspend emacs
(evil-ex-define-cmd "suspend" 'suspend-frame)

;; tabbar config
 ;; 1- if remove-if is not found, add here (require 'cl)
 ;; 2- in my emacs 23, I had to remove the "b" from "lambda (b)"
(require 'cl)
(when (require 'tabbar nil t)
  (setq tabbar-buffer-list-function
		(lambda ()
		  (remove-if
		   (lambda(buffer)
										;(if (string= (buffer-name buffer) "*scratch*") nil
										;(find (aref (buffer-name buffer) 0) " *"))
			 (if (string-match-p (regexp-quote "*Mini") (buffer-name buffer)) t
			   (if (string-match-p (regexp-quote "*Mess") (buffer-name buffer)) t
			   (if (string-match-p (regexp-quote "*Echo") (buffer-name buffer)) t
			   (if (string-match-p (regexp-quote "*server") (buffer-name buffer)) t
			   (if (string-match-p (regexp-quote "*code") (buffer-name buffer)) t
			   (if (string-match-p (regexp-quote "*Com") (buffer-name buffer)) t
			   (if (string-match-p (regexp-quote "*Back") (buffer-name buffer)) t
			   nil)))))))
			 
			 )
		   (buffer-list))))
  (tabbar-mode))

;; Font increase and decrease
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
	(json-mode lua-mode f evil-magit evil-leader auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Set tab:
(setq tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)
(defvaralias 'python-indent 'tab-width)
(setq-default tab-width 4)
