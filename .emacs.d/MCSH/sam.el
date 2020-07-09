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
  (inseert "\n")
  )

(defun make-sam-variables  ()
  ;; TODO was lazy
  )

(defun doctor-read-print ()
  "Top level loop."
  (interactive)
  (setq sam-sent (sam-readin))
  (insert "\n")
  (setq sam--lincount (+1 sam-lincount))
  (sam-doc)
  (insert "\n")
  ;; TODO was lazy
  )
