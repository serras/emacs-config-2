; Loop through all the files
(defvar files
  '(general
    ecb
    haskell
    idris
    latex
    git))
(loop for name in files
  do (load
       (concat (file-name-directory (or load-file-name
                                        (buffer-file-name)))
               "packages/"
               (symbol-name name)) t t))
