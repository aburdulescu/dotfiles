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
