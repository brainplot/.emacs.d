(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package atom-one-dark-theme
  :config
  (load-theme 'atom-one-dark t))

(use-package eglot
  :config
  (add-to-list 'eglot-server-programs
               '(c++-mode . ("clangd"
                             "--background-index"
                             "--header-insertion=iwyu"
                             "--pch-storage=memory"
                             "-j=6"))))

(use-package magit
  :init
  (require 'git-commit)
  :bind
  (("C-x g" . magit-status)))

(use-package company
  :config
  (define-key company-active-map [tab] 'company-complete-selection))
