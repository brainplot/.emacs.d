(add-hook 'before-save-hook
          (lambda()
            (delete-trailing-whitespace)))

(add-hook 'emacs-lisp-mode-hook
          (lambda()
            (setq indent-tabs-mode nil)))

(add-hook 'rust-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)))

(add-hook 'sgml-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)))

(add-hook 'css-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)))

(add-hook 'js-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)))

(add-hook 'js-jsx-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)))
