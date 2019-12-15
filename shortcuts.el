;; Keybindings for built-in functions
(global-set-key (kbd "<f4>") 'kill-this-buffer)
(global-set-key (kbd "<f8>") 'speedbar)
(global-set-key (kbd "<f9>") 'sort-lines)
(global-set-key (kbd "C-c p") 'project-find-file)
(global-set-key (kbd "C-c w") 'whitespace-mode)
(global-set-key (kbd "C-x C-S-s") 'save-some-buffers)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "M-<next>") 'next-buffer)
(global-set-key (kbd "M-<prior>") 'previous-buffer)
(global-set-key (kbd "C-c /") 'comment-or-uncomment-region)
;; Custom keybindings
(global-set-key (kbd "<C-return>") 'open-next-line)
(global-set-key (kbd "<C-S-return>") 'open-previous-line)
