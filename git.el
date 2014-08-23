; Set load path
(require 'cl)
; Add packages to load-path
(add-to-list 'load-path
       (concat (file-name-directory (or load-file-name
                                    (buffer-file-name)))
               "packages/magit"))
(add-to-list 'load-path
       (concat (file-name-directory (or load-file-name
                                    (buffer-file-name)))
               "packages/magit-modes"))

(require 'magit)
