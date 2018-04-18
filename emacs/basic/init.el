(require 'package)

;; add MELPA
(add-to-list 'package-archives '("MELPA Stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; activate ido-mode
(require 'ido)
(ido-mode t)

;; highlight matching paranthesis
(show-paren-mode t)

;; change windows with shift
(when (fboundp 'windmove-default-keybindings) (windmove-default-keybindings))

;; set indent type and size
(setq-default c-basic-offset 4
			  tab-width 4
			  indent-tabs-mode nil)

;; set C default style
(setq c-default-style "k&r")

;; add ido-goto-symbol function and bound it to M-i
(add-to-list 'load-path "~/projects/dotfiles/emacs/basic")
(require 'ido-goto-symbol)
(global-set-key (kbd "M-i") 'ido-goto-symbol)

;; use 'y-or-n' prompt
(fset 'yes-or-no-p 'y-or-n-p)

;; don't make backup files
;; don't show splash screen
;; confirm emacs exit
;; show column number
(setq make-backup-files nil
      inhibit-splash-screen t
      confirm-kill-emacs 'yes-or-no-p
      column-number-mode t)
