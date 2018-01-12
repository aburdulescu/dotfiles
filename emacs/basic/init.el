;;activate ido-mode
(require 'ido)
(ido-mode t)

;;activate show-paren-mode
(show-paren-mode t)

;; bind imenu to M-i
(global-set-key (kbd "M-i") 'imenu)

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
