(add-hook 'before-save-hook #'clean-up-buffer)

(let ((indent-spaces-list '(emacs-lisp sgml css js js-jsx)))
  (dolist (mode indent-spaces-list)
    (add-hook (intern (concat (symbol-name mode) "-mode-hook")) #'indent-with-spaces)))

(add-hook 'after-init-hook
          `(lambda ()
             (let ((elapsed
                    (float-time
                     (time-subtract (current-time) emacs-start-time))))
               (message "Loading init script...done (%.3fs) [after-init]" elapsed))) t)

(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)
