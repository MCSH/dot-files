(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(agda2-backend "GHC")
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(auto-save-default nil)
 '(compilation-message-face 'default)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   '("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "28ec8ccf6190f6a73812df9bc91df54ce1d6132f18b4c8fcc85d45298569eb53" default))
 '(golden-ratio-mode t)
 '(highlight-changes-colors '("#d33682" "#6c71c4"))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    '("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2")))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   '(("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100)))
 '(hl-bg-colors
   '("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00"))
 '(hl-fg-colors
   '("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36"))
 '(lsp-haskell-process-path-hie "hie-8.6.5")
 '(magit-diff-use-overlays nil)
 '(midnight-mode t)
 '(nrepl-message-colors
   '("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4"))
 '(org-agenda-files '("~/src/TODO.org" "~/src/personal/schedule.org"))
 '(org-default-notes-file "~/src/TODO.org")
 '(org-priority-default 67)
 '(package-selected-packages
   '(org-sticky-header helm-projectile zetteldesk zettledesk editorconfig straight company-tabnine origami vdiff anki-editor mermaid-mode slime-mrepl gnuplot-mode org-plot carbon-now-sh auctex-latexmk auctex pyvenv pyenv exec-path-from-shell org-evil graphviz-dot-mode csv-mode powerline-evil org-roam-bibtex org-roam-bibtext org-ref ess helm-flx simple-httpd websocket deft slime idris-mode :idris-mode :idris2 smartparens alchemist elixir-mode ada-mode lsp-python-ms org org-roam lsp-dart protobuf-mode csharp-mode epresent org-alert org-edna web-mode tide tss typescript-mode evil-org glsl-mode vimrc-mode org-gcal org-pomodoro org-journal lua-mode flycheck-rust golden-ratio lsp-haskell cmake-mode bison-mode flycheck lsp-treemacs lsp-ui helm-lsp company-lsp lsp-mode go-autocomplete go-mode dart-mode flutter request 2048-game company-tern company projectile yasnippet-snippets yasnippet latex-preview-pane rust-mode markdown-mode haskell-mode vue-html-mode edit-indirect vue-mode neotree evil-magit helm-escreen escreen ElScreen rjsx-mode magit helm smex flx-ido yaml-mode dashboard use-package smooth-scrolling hl-todo evil))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(safe-local-variable-values
   '((eval setq-local compile-command
           (concat
            (projectile-project-root)
            "/bin/rum "
            (buffer-file-name)))
     (eval setq-local compile-command
           (concat "cmake --build "
                   (projectile-project-root)
                   "/build -j8"))
     (eval setq-local compile-command
           (concat "cmake -H"
                   (projectile-project-root)
                   " -B"
                   (projectile-project-root)
                   "/build"))
     (eval setq compile-command
           (concat "cmake --build "
                   (projectile-project-root)
                   "/build -j8"))
     (eval setq compile-command
           (concat "cmake -H"
                   (projectile-project-root)
                   " -B"
                   (projectile-project-root)
                   "/build"))
     (eval setq compile-command
           (concat "cmake -H"
                   (projectile-project-root)
                   " -B"
                   (projectile-project-root)
                   "/build -j8"))))
 '(send-mail-function 'smtpmail-send-it)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background-mode nil)
 '(weechat-color-list
   '(unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83"))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(MCSH-evil-active-default ((t (:inherit mode-line)))))
