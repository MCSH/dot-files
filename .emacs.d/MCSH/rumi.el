(require 'generic-x) ;; Base of the generic mode

(define-generic-mode
    'rumi-mode
  '("//" ("/*" . "*/")) ;; Comments
  '("if" "while" "interface" "struct" "return" "else" "void" "int" "u8" "u16" "u32" "u64" "s8" "s16" "s32" "s64" "void" "string" "import") ;; some keywords
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
