(require 'package)

(add-to-list 'package-archives '("MELPA Stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;;activate ido-mode
(require 'ido)
(ido-mode t)

;;activate show-paren-mode
(show-paren-mode t)

;;windmove config(change windows with shift)
(when (fboundp 'windmove-default-keybindings) (windmove-default-keybindings))

;; show colum number
(setq column-number-mode t)

;; set c-style
;;config C Style and tab
(setq-default c-basic-offset 2
			  tab-width 2
			  indent-tabs-mode nil)
(setq c-default-style "k&r")

(add-to-list 'load-path "~/repos/configs/emacs/basic")
(require 'ido-goto-symbol)
