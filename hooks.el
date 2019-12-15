(add-hook 'before-save-hook
          (lambda()
            (delete-trailing-whitespace)))

(add-hook 'emacs-lisp-mode-hook
          (lambda()
            (setq indent-tabs-mode nil)))

(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))

(add-hook 'company-mode-hook (lambda ()
                               (substitute-key-definition 'company-complete-common
                                                          'company-yasnippet-or-completion
                                                          company-active-map)))
