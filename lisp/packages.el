(require 'package)
(add-to-list 'package-archives '("melpa" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(when (eq system-type 'windows-nt)
  (push
   (expand-file-name "/Program Files/CMake/share/cmake-3.17/editors/emacs")
   load-path))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package modus-vivendi-theme
  :config (load-theme 'modus-vivendi t))

(use-package eglot
  :bind (("C-c l"    . eglot)
         :map eglot-mode-map
         ("C-c f"    . eglot-format)
         ("C-c <f4>" . eglot-shutdown)
         ("C-c x"    . eglot-code-actions)
         ("C-c h"    . eglot-help-at-point))
  :config
  (define-advice eglot-shutdown (:after (&rest r) disable-flymake-mode)
    "Disable flymake-mode upon server shutdown."
    (flymake-mode -1))
  (push 'company eglot-stay-out-of)
  (push '(java-mode . ("jdtls")) eglot-server-programs)
  (push '(c++-mode . ("clangd" "--background-index" "--compile-commands-dir=build"
                      "--header-insertion=never" "--pch-storage=memory" "-j=6"))
        eglot-server-programs))

(use-package git-commit)

(use-package gitignore-mode
  :mode ("\\.dockerignore\\'"))

(use-package gitconfig-mode
  :defer t)

(use-package gitattributes-mode
  :defer t)

(use-package magit
  :custom
  (magit-commit-show-diff nil)
  :bind (("C-x g" . magit-status)
         ("C-c g" . magit-file-dispatch)))

(use-package company
  :demand
  :init
  (defun make-local-company-backends (value)
    "Create a buffer-local copy of company-backends."
    (set (make-local-variable 'company-backends) (append value company-backends)))

  (defun set-company-backends-prog-mode ()
    (make-local-company-backends '((company-capf company-yasnippet)
                                   (company-semantic company-yasnippet)
                                   (company-dabbrev-code company-keywords))))

  (defun set-company-backends-cmake-mode ()
    (make-local-company-backends '((company-cmake company-yasnippet))))

  (defun set-company-backends-conf-mode ()
    (make-local-company-backends '(company-dabbrev)))

  :bind (("C-." . company-complete)
         :map company-active-map
         ("RET")
         ("<return>")
         ("M-p")
         ("M-n")
         ([remap previous-line] . company-select-previous-or-abort)
         ([remap next-line] . company-select-next-or-abort)
         ("<tab>" . company-complete-selection))
  :custom
  (company-backends '(company-files))
  (company-dabbrev-downcase nil)
  (company-idle-delay 0.2)
  (company-minimum-prefix-length 2)
  (company-selection-wrap-around t)
  (company-tooltip-align-annotations t)
  :hook ((after-init . global-company-mode)
         (prog-mode  . set-company-backends-prog-mode)
         (cmake-mode . set-company-backends-cmake-mode)
         (conf-mode  . set-company-backends-conf-mode)
         (git-commit-mode . set-company-backends-conf-mode)))

(use-package yasnippet
  :config (yas-global-mode))

(use-package ivy
  :demand
  :custom
  (ivy-count-format "(%d/%d) ")
  (ivy-use-virtual-buffers t)
  (ivy-wrap t)
  :bind (("C-x b" . ivy-switch-buffer)
         ("C-c v" . ivy-push-view)
         ("C-c V" . ivy-pop-view))
  :config
  (ivy-mode 1))

(use-package swiper
  :bind ("C-s" . swiper-isearch))

(use-package counsel
  :bind (("M-x". counsel-M-x)
         ("C-x C-f". counsel-find-file)
         ("<f1> f". counsel-describe-function)
         ("<f1> v". counsel-describe-variable)
         ("<f1> l". counsel-find-library)
         ("<f2> i". counsel-info-lookup-symbol)
         ("<f2> u". counsel-unicode-char)
         ("<f2> j". counsel-set-variable)))

(use-package multiple-cursors
  :bind (("C-c | ^"     . mc/edit-beginnings-of-lines)
         ("C-c | `"     . mc/edit-beginnings-of-lines)
         ("C-c | $"     . mc/edit-ends-of-lines)
         ("C-c | '"     . mc/edit-ends-of-lines)
         ("C-c | R"     . mc/reverse-regions)
         ("C-c | S"     . mc/sort-regions)
         ("C-c | W"     . mc/mark-all-words-like-this)
         ("C-c | Y"     . mc/mark-all-symbols-like-this)
         ("C-c | a"     . mc/mark-all-like-this-dwim)
         ("C-c | c"     . mc/mark-all-dwim)
         ("C-c | l"     . mc/insert-letters)
         ("C-c | n"     . mc/insert-numbers)
         ("C-c | r"     . mc/mark-all-in-region)
         ("C-c | %"     . mc/mark-all-in-region-regexp)
         ("C-c | t"     . mc/mark-sgml-tag-pair)
         ("C-c | w"     . mc/mark-next-like-this-word)
         ("C-c | x"     . mc/mark-more-like-this-extended)
         ("C-c | y"     . mc/mark-next-like-this-symbol)
         ("C-c | C-SPC" . mc/mark-pop)
         ("C-c | ("     . mc/mark-all-symbols-like-this-in-defun)
         ("C-c | C-("   . mc/mark-all-words-like-this-in-defun)
         ("C-c | M-("   . mc/mark-all-like-this-in-defun)
         ("C-c | ["     . mc/vertical-align-with-space)
         ("C-c | {"     . mc/vertical-align)

         ("S-<down-mouse-1>")
         ("S-<mouse-1>" . mc/add-cursor-on-click)))

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)))

(use-package pinentry
  :if (eq system-type 'gnu/linux)
  :config (pinentry-start))

(use-package cmake-mode
  :demand
  :hook (cmake-mode . indent-with-spaces))

(use-package rust-mode
  :hook (rust-mode . indent-with-spaces))

(use-package ninja-mode)

(use-package emmet-mode
  :custom
  (emmet-move-cursor-between-quotes t)
  :bind (:map emmet-mode-keymap
              ("<C-return>")
              ("<C-tab>" . emmet-expand-yas)
              ("C-M-p" . emmet-prev-edit-point)
              ("C-M-n" . emmet-next-edit-point))
  :hook (sgml-mode css-mode js-jsx-mode))

(use-package js2-mode
  :mode (("\\.js\\'" . js2-mode)
         ("\\.jsx\\'" . js2-jsx-mode)))

(use-package typescript-mode
  :defer t)

(use-package powershell
  :defer t)

(use-package yaml-mode
  :mode ("\\.clang-format\\'"))

(use-package move-text
  :bind (("M-p" . move-text-up)
         ("M-n" . move-text-down)))

(use-package diredfl
  :commands diredfl-mode
  :hook (dired-mode . diredfl-mode))

(use-package dired-toggle
  :init
  (defun set-up-dired-toggle-mode ()
    (interactive)
    (visual-line-mode 1)
    (setq-local visual-line-fringe-indicators '(nil right-curly-arrow))
    (setq-local word-wrap nil))
  :custom
  (dired-toggle-window-size 32)
  (dired-toggle-window-side 'left)
  :bind (("<f8>" . #'dired-toggle)
         :map dired-mode-map
         ("q" . #'dired-toggle-quit)
         ([remap dired-find-file] . #'dired-toggle-find-file)
         ([remap dired-up-directory] . #'dired-toggle-up-directory)
         ("C-c C-u" . #'dired-toggle-up-directory))
  :hook (toggle-dired-mode . set-up-dired-toggle-mode))

(use-package google-this
  :defer t
  :config (google-this-mode 1))

(use-package pkgbuild-mode
  :defer t)

(use-package ace-window
  :custom (aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  :bind ("M-o" . ace-window))

(use-package fish-mode
  :defer t)
