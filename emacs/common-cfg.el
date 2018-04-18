;;; package --- Summary
;;; Commentary:
;;; Code:

(provide 'common-cfg)

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

;;; common-cfg.el ends here
