;;; 00-package-setup.el --- Package management setup -*- lexical-binding: t; -*-

;;; Commentary:
;; Sets up package.el and use-package for managing Emacs packages

;;; Code:

;; Set up package archives
(require 'package)
(add-to-list 'package-archives '("elpa" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

;; Set up use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; Add MCSH custom directory to load path
(add-to-list 'load-path "~/.emacs.d/MCSH")

(provide '00-package-setup)
;;; 00-package-setup.el ends here
