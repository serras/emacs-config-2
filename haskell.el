; Set load path
(require 'cl)
; Add packages to load-path
(add-to-list 'load-path
       (concat (file-name-directory (or load-file-name
                                    (buffer-file-name)))
               "packages/haskell-mode"))
(add-to-list 'load-path
       (concat (file-name-directory (or load-file-name
                                    (buffer-file-name)))
               "packages/ghc-mod/elisp"))

; Set up environment
(setenv "PATH" (concat "/opt/ghc/7.8.3/bin:" (getenv "PATH")))
(add-to-list 'exec-path "/opt/ghc/7.8.3/bin")
(setenv "PATH" (concat "~/.cabal/bin:/opt/cabal/1.20/bin:" (getenv "PATH")))
(add-to-list 'exec-path "~/.cabal/bin")
(add-to-list 'exec-path "/opt/cabal/1.20/bin")

; Choose indentation mode
;; Only haskell-mode
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;; SHM
;(add-hook 'haskell-mode-hook 'structured-haskell-mode)

; Add F8 key combination for going to imports block
(add-hook 'haskell-mode-hook
          (lambda () (define-key haskell-mode-map [f8] 'haskell-navigate-imports)))

; Set up hasktags
(custom-set-variables '(haskell-tags-on-save t))
(add-hook 'haskell-mode-hook
          (lambda () (define-key haskell-mode-map (kbd "M-.") 'haskell-mode-jump-to-def-or-tag)))

; Set up interactive mode
; (add-hook 'haskell-mode-hook 'interactive-haskell-mode)

; Set interpreter to be "cabal repl"
(custom-set-variables '(haskell-process-type 'cabal-repl))

; Add key combinations for haskell-mode
(add-hook 'haskell-mode-hook (lambda () 
  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
  (define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
  (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
  (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
  (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
  (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)
  (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)))
(add-hook 'cabal-mode-hook (lambda () 
  (define-key haskell-cabal-mode-map (kbd "C-`") 'haskell-interactive-bring)
  (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-ode-clear)
  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))

; Set up ghc-mod
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))
