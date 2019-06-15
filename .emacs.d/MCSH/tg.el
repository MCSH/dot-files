(require 'request)

(require 'tg-secret) ;; Provide tg-token and tg-user inside

(defun tg-parsedict (args)
  "Return a list of args"
  (if (null args)
      nil
    (cons
     (format "%s=%s" (caar args) (cdar args))
     (tg-parsedict (cdr args)))))

(defun tg-parseargs (args)
  "Return a string of args"
  (string-join (tg-parsedict args) "&" ))

(cl-defun tg-call (func args &key (file nil))
  "Call the func with args"
  (let ((f (format "%s" func)) (a (tg-parseargs args)))
    (request
     (concat "https://api.telegram.org/bot" tg-token "/" f)
     :params args
     :parser 'json-read
     :complete (lambda (&rest _) (message "Finished!"))
     :error
     (cl-function (lambda (&key error-thrown &allow-other-keys&rest _)
                    (message "Got error: %S" error-thrown)))
     )))

(cl-defun tg-send (msg &rest settings
                    &key (user tg-user))
  "Send a message to user"
  (tg-call "sendMessage" `((chat_id . ,user) (text . ,msg)))
  nil)

(defun tg-copy ()
  "Send whats under cursor to telegram"
  (interactive)
  (tg-send 
   (buffer-substring (region-beginning) (region-end)))
  (evil-normal-state)
  nil)

(defun tg-upload ()
  "Send the whole file to telegram"
  (interactive)
  (tg-send (current-buffer))
  (tg-send (buffer-substring 1 (point-max)))
  nil)

(provide 'tg)
