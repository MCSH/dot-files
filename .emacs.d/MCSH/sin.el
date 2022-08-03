(require 'generic-x)



(define-generic-mode
    'sin-mode
  '("//")  ;; comments
  '("check" "compiler" "module" "struct" "type" "enum") ;; keywords
  '(
    (":=" . 'font-lock-keyword-face)
    (":" . 'font-lock-builtin-face)
    (";" . 'font-lock-builtin-face)
    ("=" . 'font-lock-builtin-face)
    ("->" . 'font-lock-keyword-face)
    ("@" . 'font-lock-warning-face)
    )
  '("\\.sin$")
  nil ;; other functions
  "A mode for sin mode files"
  )

(provide 'sin)
