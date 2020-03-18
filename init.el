;; Set window title
(setq frame-title-format
      '("[" (:eval (user-login-name))
        "@" (:eval (system-name))
        "] " (:eval (if buffer-file-name
                        (abbreviate-file-name buffer-file-name) "%b"))
        " - Emacs"))

;; Custom file
(setq custom-file (expand-file-name
                   (concat "custom-"
                           (replace-regexp-in-string "\\W" "-" (symbol-name system-type) t)
                           ".el")
                   user-emacs-directory))
(load custom-file t t)

;; General options
(setq inhibit-startup-screen t
      require-final-newline t
      tab-always-indent 'complete)

(setq-default indent-tabs-mode t
              tab-width 4)

(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

(push (expand-file-name "lisp" user-emacs-directory) load-path)

;; Load other parts of the config
(load "functions" nil t)
(load "hooks" nil t)
(load "packages" nil t)
(load "shortcuts" nil t)

;; Backup settings
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      backup-directory-alist `((".*" . ,temporary-file-directory))
      backup-by-copying t   ; Copy all files, don't rename them.
      delete-old-versions t ; Don't ask to delete excess backup versions.
      kept-new-versions 10  ; Number of newest versions to keep.
      kept-old-versions 0   ; Number of oldest versions to keep.
      version-control t)    ; Use version numbers for backups.

;; Ediff settings
(setq ediff-split-window-function 'split-window-horizontally
      ediff-window-setup-function 'ediff-setup-windows-plain)

;; Default frame settings
(setq default-frame-alist '((font . "Hack-13")))

;; Semantic mode options
(setq semantic-default-submodes '(global-semanticdb-minor-mode
                                  global-semantic-idle-scheduler-mode
                                  global-semantic-show-parser-state-mode))

;; File associations
(push '("\\.bash_aliases\\'" . shell-script-mode) auto-mode-alist)
(push '("\\.pam_environment\\'" . conf-unix-mode) auto-mode-alist)

;; Modes
(blink-cursor-mode -1)
(delete-selection-mode)
(electric-pair-mode)
(menu-bar-mode -1)
(show-paren-mode)
(tool-bar-mode -1)

;; https://utf8everywhere.org/
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; Allowed operations
(put 'upcase-region 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'downcase-region 'disabled nil)
