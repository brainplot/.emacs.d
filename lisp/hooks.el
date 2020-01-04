(add-hook 'before-save-hook #'clean-up-buffer)

(setq indent-spaces-list '(emacs-lisp sgml css js js-jsx))

(dolist (mode indent-spaces-list)
  (add-hook (intern (concat (symbol-name mode) "-mode-hook")) #'indent-with-spaces))
