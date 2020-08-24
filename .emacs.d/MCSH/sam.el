;;; sam.el --- your personal assistant

;; Copyright (C) 2020 Sajjad Heydari

;; Maintainer: mcshemail@gmail.com
;; keywords: games, org-mode

;;; Code:

(defvar sam-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map "\n" 'sam-read-print)
    (define-key map "\r" 'sam-ret-or-read)
    map))

(define-derived-mode sam-mode text-mode "Sam"
  "Major mode for running the Sam assistant."
  (make-sam-variables)
  (turn-on-auto-fill)
  ;; (sam-type whatever) TODO was lazy
  (insert "Welcome to sam:\n")
  )

(defun sam ()
  (interactive)
  (switch-to-buffer "*SAM*")
  (sam-mode)
  )

(defun make-sam-variables  ()
  ;; TODO was lazy
  )

(defun sam-ret-or-read ()
  (interactive)
  (setq SAM/last_line 
        (buffer-substring (line-beginning-position) (line-end-position)))
  (insert "\n")
  (sam-talk)
  )

(defun sam-think (inp)
    (insert "\n")
    (insert "SAM: ")
    (insert SAM/last_line)
    (insert "\n")
    (insert "\n")
  )

(defun sam-talk ()
  (interactive)
  (cond
   ((string-equal SAM/last_line "") 0)
   (t
    (sam-think SAM/last_line)
   )))

(provide 'sam)
