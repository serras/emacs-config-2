; Set load path
(require 'cl)
; Add packages to load-path
(add-to-list 'load-path
       (concat (file-name-directory (or load-file-name
                                    (buffer-file-name)))
               "packages/markdown-mode"))

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
