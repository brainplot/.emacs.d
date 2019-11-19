;; Backups
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      backup-directory-alist `((".*" . ,temporary-file-directory))
      backup-by-copying t   ; Copy all files, don't rename them.
      delete-old-versions t ; Don't ask to delete excess backup versions.
      kept-new-versions 10  ; Number of newest versions to keep.
      kept-old-versions 0   ; Number of oldest versions to keep.
      version-control t)    ; Use version numbers for backups.

;; Modes
(column-number-mode t)
(delete-selection-mode t)
(global-display-line-numbers-mode t)
(ido-mode 1)
(line-number-mode t)
(menu-bar-mode -1)
(show-paren-mode)
(tool-bar-mode -1)
(windmove-default-keybindings) ; Switch between windows with S-<arrow-key>

;; General options
(push '(font . "Hack-13") default-frame-alist)

(setq custom-file "~/.emacs.d/custom.el"
      gc-cons-threshold 20000000
      ido-enable-flex-matching t
      inhibit-startup-screen t
      require-final-newline t
      scroll-conservatively most-positive-fixnum
      tab-always-indent 'complete
      use-package-always-ensure t)

(setq-default cursor-in-non-selected-windows nil
              cursor-type 'bar
              indent-tabs-mode t
              tab-width 4)

(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(load custom-file)
(load "~/.emacs.d/melpa" nil t)
(load "~/.emacs.d/hooks" nil t)
(load "~/.emacs.d/packages" nil t)
(load "~/.emacs.d/shortcuts" nil t)
