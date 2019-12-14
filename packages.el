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
  :config
  (global-company-mode)
  (setq company-idle-delay 0.25)
  (setq company-minimum-prefix-length 2)
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "<up>") (lambda () (interactive) (company-complete-common-or-cycle -1)))
  (define-key company-active-map (kbd "<down>") (lambda () (interactive) (company-complete-common-or-cycle 1)))
  (define-key company-active-map [tab] #'company-complete-selection))

(use-package company-quickhelp
  :after (company)
  :config
  (define-key company-active-map (kbd "C-c h") #'company-quickhelp-manual-begin)
  (company-quickhelp-mode))

(use-package yasnippet
  :config (yas-reload-all)
  :hook (prog-mode . yas-minor-mode))
