(setq org-todo-keywords
      '((sequence "TODO(t)" "IN PROGRESS(i)" "|" "DONE(d)" "CANCELLED(c)")
        (sequence "TASK(f)" "WAITING FOR REVIEW(r)" "|" "DONE(d)")
        (sequence "MAYBE(m)" "|" "CANCELLED(c)")))

 (setq org-todo-keyword-faces
      '(("TODO" . (:foreground "DarkSlateGray1" :weight bold))
        ("MAYBE" . (:foreground "sea green"))
        ("DONE" . (:foreground "light sea green"))
        ("CANCELLED" . (:foreground "forest green"))
        ("TASK" . (:foreground "DeepSkyBlue"))))


;; TODO Complete this

(provide 'org-team)
