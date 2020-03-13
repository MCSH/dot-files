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
  "\n"
  ";; Don't you?\n\n"
  )

(provide 'scratchify-MCSH)
