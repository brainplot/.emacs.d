;; Set window title
(setq frame-title-format
      '("[" (:eval (user-login-name)) "@" (:eval (system-name)) "] " (:eval (if buffer-file-name
                                                                                (abbreviate-file-name buffer-file-name) "%b"))))
;; General options
(setq custom-file "~/.emacs.d/custom.el"
      gc-cons-threshold 1048576
      gc-cons-percentage 0.25
      inhibit-startup-screen t
      require-final-newline t
      tab-always-indent 'complete)

(setq-default display-line-numbers 'relative
              indent-tabs-mode t
              tab-width 4)

(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

(defconst platform-linux-p (eq system-type 'gnu/linux))
(defconst platform-windows-p (eq system-type 'windows-nt))

(add-to-list 'load-path "~/.emacs.d/lisp")

;; Load other parts of the config
(load custom-file)
(load "hooks" nil t)
(load "functions" nil t)
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

(add-to-list 'default-frame-alist '(font . "Hack-13"))

(add-to-list 'auto-mode-alist '("\\.bash_aliases\\'" . shell-script-mode))

;; Modes
(blink-cursor-mode -1)
(column-number-mode)
(delete-selection-mode)
(electric-pair-mode)
(line-number-mode)
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
