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
  (next-line 1)
  (indent-according-to-mode))

(defun clean-up-buffer ()
  "Perform some clean up operations in the current buffer."
  (if (and (fboundp #'eglot-current-server) (eglot-current-server))
      (eglot-format-buffer)
    (whitespace-cleanup)))

(defun indent-with-spaces ()
  "Set indentation for the current buffer to spaces."
  (setq indent-tabs-mode nil))

(defun exclude-package-on-this-platform (package)
  "Remove a package from the package-selected-packages list.

If PACKAGE is not present in the package-selected-packages list, do nothing."
  (setq package-selected-packages (remove package package-selected-packages)))

(defun colorize-compilation-buffer ()
  (ansi-color-apply-on-region compilation-filter-start (point-max)))
