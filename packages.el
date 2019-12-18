(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package modus-vivendi-theme
  :init
  (setq modus-vivendi-theme-slanted-constructs t)
  (setq modus-vivendi-theme-scale-headings t)
  :config
  (load-theme 'modus-vivendi t))

(use-package eglot
  :bind ("C-c l" . eglot)
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
  :demand
  :bind (:map company-active-map
              ("<tab>" . company-complete-selection))
  :custom
  (company-idle-delay 0.2)
  (company-minimum-prefix-length 2)
  :config
  (global-company-mode))

(use-package yasnippet
  :demand
  :bind (:map yas-minor-mode-map
              ("TAB" . nil)
              ("<tab>" . nil)
              ("C-<tab>" . yas-expand))
  :config
  (yas-global-mode 1))

(use-package ivy
  :demand
  :custom
  (ivy-use-virtual-buffers t)
  (ivy-count-format "(%d/%d) ")
  (ivy-wrap t)
  :bind (("C-x b" . ivy-switch-buffer)
         ("C-c v" . ivy-push-view)
         ("C-c V" . ivy-pop-view))
  :config
  (ivy-mode 1))

(use-package swiper
  :after ivy
  :demand
  :bind ("C-s" . swiper-isearch))

(use-package counsel
  :after swiper
  :demand
  :bind (("M-x". counsel-M-x)
         ("C-x C-f". counsel-find-file)
         ("M-y". counsel-yank-pop)
         ("<f1> f". counsel-describe-function)
         ("<f1> v". counsel-describe-variable)
         ("<f1> l". counsel-find-library)
         ("<f2> i". counsel-info-lookup-symbol)
         ("<f2> u". counsel-unicode-char)
         ("<f2> j". counsel-set-variable)))

(use-package multiple-cursors
  :config
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))
