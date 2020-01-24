;; Keybindings for built-in functions
(global-set-key (kbd "<f8>") #'speedbar)
(global-set-key (kbd "<f9>") #'sort-lines)
(global-set-key (kbd "C-c /") #'comment-or-uncomment-region)
(global-set-key (kbd "C-c C-k") #'kill-some-buffers)
(global-set-key (kbd "C-c C-r") #'replace-string)
(global-set-key (kbd "C-c C-w") #'whitespace-mode)
(global-set-key (kbd "C-c a") #'copy-from-above-command)
(global-set-key (kbd "C-c p") #'project-find-file)
(global-set-key (kbd "C-c r") #'revert-buffer)
(global-set-key (kbd "C-c t") #'toggle-truncate-lines)
(global-set-key (kbd "C-c w") #'browse-url)
(global-set-key (kbd "C-x C-b") #'ibuffer)
(global-set-key (kbd "M-S-z") #'zap-up-to-char)

;; Keybindings for custom functions
(global-set-key (kbd "<C-return>") #'open-next-line)
(global-set-key (kbd "<C-S-return>") #'open-previous-line)
