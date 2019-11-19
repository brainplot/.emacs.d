(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package atom-one-dark-theme
  :config
  (load-theme 'atom-one-dark t))

(use-package eglot
  :config
  (add-to-list 'eglot-server-programs
             `(c++-mode . ("clangd"
                           "--background-index"
                           "--header-insertion=iwyu"
                           "--pch-storage=memory"
                           "-j=6"))))

(use-package magit
  :bind
  (("C-x g" . magit-status)))
