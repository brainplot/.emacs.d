;; Keybindings for built-in functions
(global-set-key (kbd "<f8>") 'speedbar)
(global-set-key (kbd "<f9>") 'sort-lines)
(global-set-key (kbd "C-c /") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c p") 'project-find-file)
(global-set-key (kbd "C-c q") 'kill-this-buffer)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "C-c s") 'save-some-buffers)
(global-set-key (kbd "C-c w") 'whitespace-mode)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "M-N") 'next-buffer)
(global-set-key (kbd "M-P") 'previous-buffer)
(global-set-key (kbd "M-Z") 'zap-up-to-char)

;; Keybindings for custom functions
(global-set-key (kbd "<C-return>") 'open-next-line)
(global-set-key (kbd "<C-S-return>") 'open-previous-line)
