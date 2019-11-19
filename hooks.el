(add-hook 'before-save-hook
          (lambda()
            (delete-trailing-whitespace)))

(add-hook 'emacs-lisp-mode-hook
          (lambda()
            (setq indent-tabs-mode nil)))
