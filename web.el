; Set load path
(require 'cl)
; Add packages to load-path
(add-to-list 'load-path
       (concat (file-name-directory (or load-file-name
                                    (buffer-file-name)))
               "packages/web-mode"))

; Set up multi-web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
