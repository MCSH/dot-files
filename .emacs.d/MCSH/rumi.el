(require 'generic-x) ;; Base of the generic mode

(define-generic-mode
    'rumi-mode
  '("//" ("/*" . "*/")) ;; Comments
  '("if" "while" "struct" "return") ;; some keywords
  '(
    ("=" . 'font-lock-operator-face) ;; '=' is an operator
    (";" . 'font-lock-builtin-face) ;; ';' is builtin
    (":=" . 'font-lock-builtin-face)
    ("->" . 'font-lock-builtin-face)
    ("\\.\\.\\." . 'font-lock-builtin-face)
    ("[a-zA-Z_][a-zA-Z_0-9]+" . 'font-lock-variable-name-face)
    )
  '("\\.rum$") ;; files have .rum extension
  (list  ;; other function
   ;;(lambda () (setq comment-start "/*") (setq comment-end "*/"))
   )
  "A mode for rumi files"
  )

(provide 'rumi)
