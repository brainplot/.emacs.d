(defconst emacs-start-time (current-time))

(defconst remacs-p (string-match-p "\\bremacs\\b" invocation-name))

;; Set window title
(setq frame-title-format
      '("[" (:eval (user-login-name))
        "@" (:eval (system-name))
        "] " (:eval (if buffer-file-name
                        (abbreviate-file-name buffer-file-name) "%b"))
        (if remacs-p
            " - Remacs"
          " - Emacs")))

;; General options
(setq custom-file (expand-file-name "~/.emacs.d/custom.el")
      gc-cons-threshold 1048576
      gc-cons-percentage 0.25
      inhibit-startup-screen t
      require-final-newline t
      tab-always-indent 'complete)

(setq-default indent-tabs-mode t
              tab-width 4)

(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

(push "~/.emacs.d/lisp" load-path)

;; Load emacs packages included with the distribution, which otherwise
;; wouldn't be in the load-path when running remacs
(when remacs-p
  (push "/usr/share/emacs/site-lisp" load-path))

;; Load other parts of the config
(load custom-file t t)
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

;; File associations
(push '("\\.bash_aliases\\'" . shell-script-mode) auto-mode-alist)
(push '("\\.pam_environment\\'" . conf-unix-mode) auto-mode-alist)

;; Modes
(blink-cursor-mode -1)
(delete-selection-mode)
(electric-pair-mode)
(menu-bar-mode -1)
(semantic-mode)
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
