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
          (tags-todo "-personal-hobby-household"))
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

(setq org-global-properties
      '(("Effort_ALL" . "0:10 0:20 0:30 1:00 2:00 3:00 4:00 5:00 6:00 7:00 8:00")))

;; from these sources:
;; https://emacs.stackexchange.com/questions/53272/show-effort-and-clock-time-in-agenda-view
;; https://emacs.stackexchange.com/questions/59211/how-to-show-remaining-task-effort-in-org-modes-column-view

(setq org-agenda-prefix-format
      '((agenda . " %i %-12:c%?-12t%-6e%?-6(or (org-entry-get (point) \"CLOCKSUM\") \"\")% s")
        (todo . " %i %-12:c %-6e")
        (tags . " %i %-12:c")
        (search . " %i %-12:c")))

;; (setq org-agenda-prefix-format
;;       '((agenda . " %i %-12:c%?-12t%-6e% s")
;;         (todo . " %i %-12:c %-6e")
;;         (tags . " %i %-12:c")
;;         (search . " %i %-12:c")))

(setq org-columns-default-format "%60ITEM(Task) %TODO %6Effort(Estim){:} %6CLOCKSUM(Clock) %TAGS")

;; TODO Complete this

;;; agenda auto-update
;; (defvar refresh-agenda-time-seconds 300)

;; (defvar refresh-agenda-timer nil
;;   "Timer for `refresh-agenda-timer-function' to reschedule itself, or nil.")

;; (defun refresh-agenda-timer-function ()
;;   ;; If the user types a command while refresh-agenda-timer
;;   ;; is active, the next time this function is called from
;;   ;; its main idle timer, deactivate refresh-agenda-timer.
;;   (when refresh-agenda-timer
;;     (cancel-timer refresh-agenda-timer))

;;   (org-agenda nil "b")

;;   (setq refresh-agenda-timer
;;     (run-with-idle-timer
;;       ;; Compute an idle time break-length
;;       ;; more than the current value.
;;       (time-add (current-idle-time) refresh-agenda-time-seconds)
;;       nil
;;       'refresh-agenda-timer-function)))

;; (run-with-idle-timer refresh-agenda-time-seconds t 'refresh-agenda-timer-function)
;;;

;; add effort to each day in agenda
(require 'cl-lib)

(defun my/org-agenda-calculate-efforts (limit)
  "Sum the efforts of scheduled entries up to LIMIT in the
agenda buffer."
  (let (total)
    (save-excursion
     (while (< (point) limit)
       (when (member (org-get-at-bol 'type) '("scheduled" "past-scheduled" "timestamp"))
         (push (org-entry-get (org-get-at-bol 'org-hd-marker) "Effort") total))
       (forward-line)))
     (cl-reduce #'+
                (mapcar #'org-duration-to-minutes
                        (cl-remove-if-not 'identity total)))))

(defun my/org-agenda-insert-efforts ()
  "Insert the efforts for each day inside the agenda buffer."
  (save-excursion
   (let (pos)
     (while (setq pos (text-property-any
                       (point) (point-max) 'org-agenda-date-header t))
       (goto-char pos)
       (end-of-line)
       (let ((effort 
                                     (my/org-agenda-calculate-efforts
                                      (next-single-property-change (point) 'day))))
       (insert-and-inherit (concat " (" (org-duration-from-minutes effort) ") ("
                                   (org-duration-from-minutes
                                    (-
                                     effort
                                     (my/org-clock-sum (org-get-at-bol 'day)
                                                       (time-add (org-get-at-bol 'day) 1))
                                     ))
                                   ")"))
       (forward-line))))))


(defun my/org-clock-sum (&optional tstart tend)
  "Sum the times for all active agenda files."
  (let ((files (org-agenda-files))
        (total 0))
    (org-agenda-prepare-buffers files)
    (dolist (file files)
      (with-current-buffer (find-buffer-visiting file)
        (setq total (+ total
                       (cadr (org-clock-get-table-data file (list :maxlevel 0 :tstart tstart :tend tend)))))))
    total))

(defun my/org-agenda-insert-clocktable ()
  "Insert the clocktable for each day inside the agenda buffer."
  (save-excursion
    (let (pos)
      (while (setq pos (text-property-any
                        (point) (point-max) 'org-agenda-date-header t))
        (goto-char pos)
        (end-of-line)
        (let ((tstart (org-get-at-bol 'day)))
          (unless (eq
                   0
                   (my/org-clock-sum tstart (time-add tstart 1)))
            (newline)
            (insert (org-clock-get-clocktable
                   :link t
                   :maxlevel 4
                   :tend (time-add tstart 1)
                   :tstart tstart
                   :hidefiles t
                   ))))))))

;; the order matters...
(add-hook 'org-agenda-finalize-hook 'my/org-agenda-insert-clocktable)
(add-hook 'org-agenda-finalize-hook 'my/org-agenda-insert-efforts)

(provide 'org-team)

