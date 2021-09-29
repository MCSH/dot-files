(setq org-todo-keywords
      '((sequence "TODO(t)" "IN PROGRESS(i)" "WAIT(r)" "|" "DONE(d)" "CANCELLED(c)")
        ;;(sequence "TASK(f)" "WAIT(r)" "|" "DONE(d)")
        (sequence "MAYBE(m)" "|" "CANCELLED(c)")))

 (setq org-todo-keyword-faces
      '(("TODO" . (:foreground "DarkSlateGray1" :weight bold))
        ("MAYBE" . (:foreground "sea green"))
        ("DONE" . (:foreground "light sea green"))
        ("CANCELLED" . (:foreground "forest green"))
        ("TASK" . (:foreground "DeepSkyBlue"))))

(setq org-tag-faces
      '(
        ("writing" . (:foreground "dark orange"))
        ("school" . (:foreground "gray"))
        ("personal" . (:foreground "sienna"))
        ("reading" . (:foreground "deep sky blue"))
        ("research" . (:foreground "goldenrod1"))
        ("hobby" . (:foreground "forest green"))
        ("idea" . (:foreground "magenta"))
        ("proxify" . (:foreground "magenta"))
        ("acne" . (:foreground "magenta"))
        ))

(defun my-org-agenda-skip-blocked ()
  "Skip blocked entries."
  (let ((heading-end (save-excursion (outline-next-heading))))
    (if (org-entry-blocked-p)
        heading-end
        (org-agenda-skip-entry-if 'timestamp)
        )))

(setq org-agenda-custom-commands
      '(
        ("c" "Classes"
         ((agenda "" ((org-agenda-span 7)))
          (tags-todo "+classes"))
         ((org-agenda-tag-filter-preset '("+classes"))))
        ("r" "School"
         ((agenda "" ((org-agenda-span 7)))
          (tags-todo "+school"))
         ((org-agenda-tag-filter-preset '("+school"))))
        ("h" "Hobby" tags-todo "hobby")
        ("p" "Personal"
         ((agenda "" ((org-agenda-span 7)))
          (tags-todo "personal"))
         ((org-agenda-tag-filter-preset '("+personal"))))
        ("j" "journal papers" tags-todo "papers")
        ("l" "acne studios" tags-todo "acne")
        ("n" "All"
         ((agenda "" ((org-agenda-span 7)))
          (tags-todo "-personal-hobby"))
         ((org-agenda-tag-filter-preset '("-personal"))))
        ("m" "All w\\ Personal"
         ((agenda "" ((org-agenda-span 7)))
          (todo)))
        ("b" "All w\\ Personal w\\ unscheduled"
         ((agenda "" ((org-agenda-span 7)))
          (todo ""
                ((org-agenda-overriding-header "\nUnscheduled TODO")
                 (org-agenda-skip-function (function my-org-agenda-skip-blocked))
                 ))))
        ("u" "Unscheduled"
         ((todo ""
                ((org-agenda-overriding-header "\nUnscheduled TODO")
                 (org-agenda-skip-function (function my-org-agenda-skip-blocked))
                 )))
         nil
         nil
         )
        ))

(setq org-default-notes-file "~/src/TODO.org")

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/src/TODO.org" "Tasks")
         "* TODO %?  %^G\n  %i\n  %a")
        ("c" "clipboard" entry (file+headline "~/src/TODO.org" "Tasks")
         "* TODO %?  %^G\n %x\n")
      ))

(setq org-default-priority 67)

(defun org-habit-toggle-everyday ()
  "Toggle displaying habits for today only vs. everyday"
  (interactive)
  (setq org-habit-show-habits-only-for-today (if org-habit-show-habits-only-for-today nil t))
  )


(setq org-agenda-sorting-strategy
      '((agenda time-up habit-down priority-down category-keep)
        (todo priority-down category-keep)
        (tags priority-down category-keep)
        (search category-keep)))

(setq org-habit-graph-column 60)

;; TODO Complete this

(provide 'org-team)
