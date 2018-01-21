(defun reset-scratch ()
  (interactive)
  (switch-to-buffer "*scratch*")
  (erase-buffer)
  (insert initial-scratch-message))

(defun set-scratch (&rest lines)
  (setq initial-scratch-message (apply 'concat lines)))

(defun append-scratch (&rest lines)
  (setq initial-scratch-message (apply 'concat initial-scratch-message lines)))

(set-scratch
  ";; You know what to do." "\n"
  ";; \n"
  ";;;;;;;;;;;;;;;;;;;;;;;;;;" "\n"
  ";;                      ;;" "\n"      
  ";; It's dangerous to go ;;" "\n"
  ";; alone! take this:    ;;" "\n"
  ";;                      ;;" "\n"
  ";;   🔥     👷     🔥  ;;" "\n"
  ";;          🔮          ;;" "\n"
  ";;                      ;;" "\n"
  ";;;;;;;;;;;;  ;;;;;;;;;;;;" "\n"
  "\n"
  "(shell-command \"" invocation-directory invocation-name " --debug-init\")\n")

(provide 'scratchify-MCSH)
