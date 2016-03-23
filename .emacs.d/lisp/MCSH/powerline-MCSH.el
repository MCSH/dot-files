;; My theme and setting for powerline

;; include original powerline
(require 'powerline)
;; theme
;; (powerline-default-theme) ;; old theme
;; (powerline-center-evil-theme)


;; handle different color based on mode
(defun MCSH-get-color ()
  "Get the collor for current mode"
  (interactive)
  (setq MCSH-evil-mode (symbol-name evil-state))
  (cond
   ((eq MCSH-evil-mode "normal") "goldenrod")
   ((eq MCSH-evil-mode "insert") "blue")
   (t "grey11") ;; Default
   ))


(defface MCSH-evil-active-face-default '((t (:background "grey11" :inherit mode-line)))
  "Powerline face1 MCSH."
  :group 'powerline)

(defface MCSH-evil-inactive-face-default
  '((t (:background "grey11" :inherit mode-line-inactive)))
  "Powerline face inactive MCSH 1."
  :group 'powerline)

(defun MCSH-evil-face (active)
  (interactive)
  "Get face for current mode"
  (let* ((face (intern (concat "MCSH-evil-" (if active "active" "inactive") "-" (symbol-name evil-state) ))))
    (if (facep face) face (intern (concat "MCSH-evil-" (if active "active" "inactive")  "-default")))
  ))


;; my custom theme
(defun powerline-evil-MCSH-theme ()
  "Setup a mode-line with major, evil, and minor modes centered."
  (interactive)
  (setq-default mode-line-format
		'("%e"
		  (:eval
		   (let* ((active (powerline-selected-window-active))
			  (mode-line (if active 'mode-line 'mode-line-inactive))
			  (face1 (if active 'powerline-active1 'powerline-inactive1))
			  (face2 (if active 'powerline-active2 'powerline-inactive2))
			  (facemode (MCSH-evil-face active))
			  (facemode face1)
			  (separator-left (intern (format "powerline-%s-%s"
							  (powerline-current-separator)
							  (car powerline-default-separator-dir))))
			  (separator-right (intern (format "powerline-%s-%s"
							   (powerline-current-separator)
							   (cdr powerline-default-separator-dir))))
			  (lhs (list (powerline-raw "%*" nil 'l)
				     (powerline-buffer-size nil 'l)
				     (powerline-buffer-id nil 'l)
				     (powerline-raw " ")
				     (funcall separator-left mode-line face1)
				     (powerline-narrow face1 'l)
				     (powerline-vc face1)))
			  (rhs (list (powerline-raw global-mode-string face1 'r)
				     (powerline-raw "%4l" face1 'r)
				     (powerline-raw ":" face1)
				     (powerline-raw "%3c" face1 'r)
				     (funcall separator-right face1 mode-line)
				     (powerline-raw " ")
				     (powerline-raw "%6p" nil 'r)
				     (powerline-hud face2 face1)
				     ))
			  (center (append (list (powerline-raw " " face1)
						(funcall separator-left face1 face2)
						(when (and (boundp 'erc-track-minor-mode) erc-track-minor-mode)
						  (powerline-raw erc-modified-channels-object face2 'l))
						(powerline-major-mode face2 'l)
						(powerline-process face2)
						(powerline-raw " " face2))
					  (if (split-string (format-mode-line minor-mode-alist))
					      (append (if evil-mode
							  (list (funcall separator-right face2 facemode)
								(powerline-raw evil-mode-line-tag facemode 'l)
								(powerline-raw " " facemode)
								(funcall separator-left facemode face2)))
						      (list (powerline-minor-modes face2 'l)
							    (powerline-raw " " face2)
							    (funcall separator-right face2 face1)))
					    (list (powerline-raw evil-mode-line-tag face2)
						  (funcall separator-right face2 face1))))))
		     (concat (powerline-render lhs)
			     (powerline-fill-center face1 (/ (powerline-width center) 2.0))
			     (powerline-render center)
			     (powerline-fill face1 (powerline-width rhs))
			     (powerline-render rhs)))))))

(powerline-evil-MCSH-theme)

(provide 'powerline-MCSH)
