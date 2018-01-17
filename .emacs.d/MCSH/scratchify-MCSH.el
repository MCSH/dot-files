(defun set-scratch (&rest lines)
  (setq initial-scratch-message (apply 'concat lines)))

(defun append-scratch (&rest lines)
  (setq initial-scratch-message (apply 'concat initial-scratch-message lines)))

(set-scratch
  ";; -|-+-|- Invocation Failure.  Sorry. -|-+-|-" "\n"
  ";; You know what to do." "\n"
  ";; \n"
  ";; Emacs: " (number-to-string emacs-major-version) "." 
      (number-to-string emacs-minor-version) 
      " [" (when emacs-repository-version (number-to-string emacs-repository-version)) "]" 
      "\n"
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
