(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package modus-vivendi-theme
  :config
  (load-theme 'modus-vivendi t))

(use-package eglot
  :config
  (add-to-list 'eglot-server-programs
               '(c++-mode . ("clangd"
                             "--background-index"
                             "--compile-commands-dir=build"
                             "--header-insertion=never"
                             "--pch-storage=memory"
                             "-j=6"))))

(use-package magit
  :init
  (require 'git-commit)
  :bind
  (("C-x g" . magit-status)))

(use-package company
  :custom
  (company-idle-delay 0.2)
  (company-minimum-prefix-length 2)
  :config
  (global-set-key (kbd "C-<tab>") 'company-complete)
  (define-key company-active-map (kbd "M-p") (lambda () (interactive) (company-complete-common-or-cycle -1)))
  (define-key company-active-map (kbd "M-n") (lambda () (interactive) (company-complete-common-or-cycle 1)))
  (define-key company-active-map (kbd "<tab>") 'company-complete-selection)
  (global-company-mode))

(use-package yasnippet
  :config (yas-reload-all)
  :hook (prog-mode . yas-minor-mode))
