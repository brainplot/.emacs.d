(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package kaolin-themes
  :config
  (load-theme 'kaolin-galaxy t))

(use-package eglot
  :config
  (add-to-list 'eglot-server-programs
             `(c++-mode . ("clangd"
                           "--background-index"
                           "--header-insertion=iwyu"
                           "--pch-storage=memory"
                           "-j=6"))))

(use-package company
  :config
  (define-key company-active-map [tab] 'company-complete))

(use-package magit
  :bind
  (("C-x g" . magit-status)))
