(require 'generic-x) ;; Base of the generic mode

;; (require 'smie)


;; (defvar rumi-smie-grammar
;;     (smie-prec2->grammar
;;      (smie-bnf->prec2
;;       '((id)
;;         (statements (statement)
;;                     (statement ";" statements))
;;         (statement ("if" "(" expr ")"statement)
;;                    ("if" "(" expr ")""esle" statement)
;;                    ("{" statements "}")
;;                    ("while" "("expr")"statement)
;;                    (id ":=" "(" args ")" "->" id "{" statements "}")
;;                    (id ":" struct "{" statements "}")
;;                    (id ":" id "=" expr)
;;                    (id "=" expr)
;;                    (id ":=" expr)
;;                    )
;;         (expr
;;          (id)
;;          (id "==" expr)
;;          (id "+" expr)
;;          (id "-" expr)
;;          (id "/" expr)
;;          (id "*" expr)
;;          ;("("expr")" "." id)
;;          )
;;         )
;;       )))

;; (defcustom rumi-indent-basic 2 "rumi indent")

;; (defun rumi-smie-rules (kind token)
;;   (pcase (cons kind token)
;;     ;(`(:elem . basic) rumi-indent-basic)
;;     (`(,_ . ",") (smie-rule-separator kind))
;;     (`(:after . "->") 0)
;;     ;(`(:after . ":=") rumi-indent-basic)
;;     (`(:before . "{") rumi-indent-basic)
;;     (`(:before . "}") (smie-rule-parent -2))
;;     (`(:before . ,(or `"(" `"{"))
;;      (if (smie-rule-hanging-p) (smie-rule-parent)))
;;     (`(:before . "if") (and (not (smie-rule-bolp)) (smie-rule-prev-p "else") (smie-rule-parent)))
;;     ))
    


(define-generic-mode
    'rumi-mode
  '("//" ("/*" . "*/")) ;; Comments
  '("if" "while" "new" "interface" "struct" "enum" "return" "else" "unit" "void" "int" "u8" "u16" "u32" "u64" "s8" "s16" "s32" "s64" "void" "string" "bool" "import" "self" "instanceof" "sizeof") ;; some keywords
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
   (lambda ()
     ;;(smie-setup rumi-smie-grammar 'rumi-smie-rules)
     (setq company-dabbrev-downcase nil)
     )
   )
  "A mode for rumi files"
  )

(provide 'rumi)
