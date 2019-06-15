(require 'request)

(require 'tg-secret) ;; Provide tg-token and tg-user inside

(cl-defun tg-call (func args &key (file nil))
  "Call the func with args"
  (request
   (concat "https://api.telegram.org/bot" tg-token "/" (format "%s" func))
   :params args
   :parser 'json-read
   :complete (lambda (&rest _) (message "Finished!"))
   :error
   (cl-function (lambda (&key error-thrown &allow-other-keys&rest _)
                  (message "Got error: %S" error-thrown)))
   ))

(cl-defun tg-send (msg &rest settings
                       &key (user tg-user))
  "Send a message to user"
  (if (>= (length msg) 4000)
      (progn
        (apply #'tg-send (substring msg 0 3999) :user user settings)
        (apply #'tg-send (substring msg 3999) :user user settings)
        nil)
    (tg-call "sendMessage" `((chat_id . ,user) (text . ,msg))))
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
  (tg-send (buffer-name))
  (tg-send (buffer-substring 1 (point-max)))
  nil)

(provide 'tg)
