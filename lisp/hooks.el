(add-hook 'before-save-hook #'clean-up-buffer)

(let ((indent-spaces-list '(emacs-lisp sgml css js js-jsx nxml)))
  (dolist (mode indent-spaces-list)
    (add-hook (intern (concat (symbol-name mode) "-mode-hook")) #'indent-with-spaces)))

(add-hook 'after-init-hook #'log-emacs-init-time t)

(add-hook 'compilation-filter-hook #'colorize-compilation-buffer)
