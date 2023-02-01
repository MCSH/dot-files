
(defun MCSH-windmove-left-advice (orig-f &rest args)
  (cond
   ((derived-mode-p 'org-agenda-mode)
    (apply #'org-agenda-do-date-earlier args))
   ((derived-mode-p 'org-mode)
    (apply #'org-shiftleft args))
   (t
    (apply orig-f args))))

(defun MCSH-windmove-right-advice (orig-f &rest args)
  (cond
   ((derived-mode-p 'org-agenda-mode)
    (apply #'org-agenda-do-date-later args))
   ((derived-mode-p 'org-mode)
    (apply #'org-shiftright args))
   (t
    (apply orig-f args))))

(defun MCSH-windmove-up-advice (orig-f &rest args)
  (cond
   ((derived-mode-p 'org-agenda-mode)
    (org-agenda-priority-up))
   ((derived-mode-p 'org-mode)
    (apply #'org-shiftup args))
   (t
    (apply orig-f args))))

(defun MCSH-windmove-down-advice (orig-f &rest args)
  (cond
   ((derived-mode-p 'org-agenda-mode)
    (org-agenda-priority-down))
   ((derived-mode-p 'org-mode)
    (apply #'org-shiftdown args))
   (t
    (apply orig-f args))))

(advice-add 'windmove-left :around #'MCSH-windmove-left-advice)
(advice-add 'windmove-right :around #'MCSH-windmove-right-advice)
(advice-add 'windmove-up :around #'MCSH-windmove-up-advice)
(advice-add 'windmove-down :around #'MCSH-windmove-down-advice)

(provide 'org-windmove)
