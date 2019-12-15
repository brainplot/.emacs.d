(defun open-previous-line (arg)
  "Open a new line before the current one"
  (interactive "p")
  (beginning-of-line)
  (open-line arg)
  (indent-according-to-mode))

(defun open-next-line (arg)
  "Move to the next line and then opens a line"
  (interactive "p")
  (end-of-line)
  (open-line arg)
  (next-line 1)
  (indent-according-to-mode))

(defun company-yasnippet-or-completion ()
  "Better integration between yasnippet and company"
  (interactive)
  (let ((yas-fallback-behavior nil))
    (unless (yas-expand)
      (call-interactively #'company-complete-common))))
