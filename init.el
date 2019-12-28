(setq custom-file "~/.emacs.d/custom.el"
      gc-cons-threshold 1048576
      gc-cons-percentage 0.25
      inhibit-startup-screen t
      require-final-newline t
      tab-always-indent 'complete
      use-package-always-ensure t)

;; (unless (or (eq system-type 'ms-dos) (eq system-type 'windows-nt))
;;   (setq scroll-conservatively most-positive-fixnum))

(add-to-list 'load-path "~/.emacs.d/lisp")

(load custom-file)
(load "melpa" nil t)
(load "hooks" nil t)
(load "functions" nil t)
(load "packages" nil t)
(load "shortcuts" nil t)

;; Backups
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      backup-directory-alist `((".*" . ,temporary-file-directory))
      backup-by-copying t   ; Copy all files, don't rename them.
      delete-old-versions t ; Don't ask to delete excess backup versions.
      kept-new-versions 10  ; Number of newest versions to keep.
      kept-old-versions 0   ; Number of oldest versions to keep.
      version-control t)    ; Use version numbers for backups.

;; Modes
(blink-cursor-mode -1)
(column-number-mode t)
(delete-selection-mode t)
(electric-pair-mode)
(line-number-mode t)
(menu-bar-mode -1)
(show-paren-mode)
(tool-bar-mode -1)

;; General options
(push '(font . "Hack-13") default-frame-alist)

(setq-default display-line-numbers 'relative
              indent-tabs-mode t
              tab-width 4)

(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; Modes for custom file extensions
(push '("\\.bash_aliases\\'" . shell-script-mode) auto-mode-alist)
