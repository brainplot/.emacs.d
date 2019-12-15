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

(use-package ivy
  :custom
  (ivy-use-virtual-buffers t)
  (ivy-count-format "(%d/%d) ")
  (ivy-wrap t)
  :config
  (global-key-binding (kbd "C-x b") 'ivy-switch-buffer)
  (global-key-binding (kbd "C-c v") 'ivy-push-view)
  (global-key-binding (kbd "C-c V") 'ivy-pop-view)
  (ivy-mode 1))

(use-package swiper
  :after ivy
  :config
  (global-key-binding (kbd "C-s") 'swiper-isearch))

(use-package counsel
  :after swiper
  :config
  (global-key-binding (kbd "M-x") 'counsel-M-x)
  (global-key-binding (kbd "C-x C-f") 'counsel-find-file)
  (global-key-binding (kbd "M-y") 'counsel-yank-pop)
  (global-key-binding (kbd "<f1> f") 'counsel-describe-function)
  (global-key-binding (kbd "<f1> v") 'counsel-describe-variable)
  (global-key-binding (kbd "<f1> l") 'counsel-find-library)
  (global-key-binding (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-key-binding (kbd "<f2> u") 'counsel-unicode-char)
  (global-key-binding (kbd "<f2> j") 'counsel-set-variable))
