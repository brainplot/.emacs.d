(require 'ansi-color)

(defun open-previous-line (arg)
  "Open a new line before the current one."
  (interactive "p")
  (beginning-of-line)
  (open-line arg)
  (indent-according-to-mode))

(defun open-next-line (arg)
  "Move to the next line and then opens a line."
  (interactive "p")
  (end-of-line)
  (open-line arg)
  (forward-line)
  (indent-according-to-mode))

(defun clean-up-buffer ()
  "Perform some clean up operations in the current buffer."
  (if (and (fboundp #'eglot-managed-p) (eglot-managed-p))
      (eglot-format-buffer)
    (whitespace-cleanup)))

(defun indent-with-spaces ()
  "Set indentation for the current buffer to spaces."
  (setq indent-tabs-mode nil))

(defun colorize-compilation-buffer ()
  (ansi-color-apply-on-region compilation-filter-start (point-max)))

(defun log-emacs-init-time ()
  (message "Loading init script completed in %s." (emacs-init-time)))

(defun toggle-indentation-style ()
  "Switch between indentation with tabs and indentation with spaces."
  (interactive)
  (if indent-tabs-mode
      (progn
        (message "Current buffer will now use spaces for indentation.")
        (setq indent-tabs-mode nil))
    (message "Current buffer will now use tabs for indentation.")
    (setq indent-tabs-mode t)))
