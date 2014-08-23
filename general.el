;; Packages
; Add the package repository
(require 'package)
; Use also the packages folder for automatic loading
(add-to-list 'package-directory-list
       (concat (file-name-directory (or load-file-name
                                    (buffer-file-name)))
               "packages"))
(package-initialize)
; Add MELPA repository
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

; Set load path
(require 'cl)
; Add packages to load-path
(add-to-list 'load-path
       (concat (file-name-directory (or load-file-name
                                    (buffer-file-name)))
               "packages"))
(defvar packages
  '(undo-tree
    color-theme-solarized
    rainbow-delimiters))
(loop for name in packages
  do (add-to-list 'load-path
       (concat (file-name-directory (or load-file-name
                                        (buffer-file-name)))
               "packages/"
               (symbol-name name))))

; Color theme
(add-to-list 'custom-theme-load-path 
   (concat (file-name-directory (or load-file-name
                                        (buffer-file-name)))
               "packages/color-theme-solarized"))
(load-theme 'solarized-light t)

; Color matching brackets
(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

; Parenthesis, lines, returns, undos
(show-paren-mode 1)
(require 'linum)
(global-linum-mode 1)
(cua-mode 1) ;; Windows shortcuts
(tool-bar-mode -1) ;; Hide toolbar
;(define-key global-map (kbd "RET") 'newline-and-indent) ;; Indent on return
(delete-selection-mode 1) ;; Delete regions normally

; Better undo support
(require 'undo-tree)
(global-undo-tree-mode 1)
(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-S-z") 'redo)
