;;; package --- Summary
;;; Commentary:
;;; Code:

(provide 'common-cfg)

;; highlight matching paranthesis
(show-paren-mode t)

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
      ;; confirm-kill-emacs 'yes-or-no-p
      column-number-mode t)

;; activate ido and ido-everywhere
(ido-mode t)

;; undo/redo windows changes with C-c arrow
(winner-mode 1)

;; change windows with shift-arrow
(windmove-default-keybindings)

(require 'ido-goto-symbol)
(global-set-key (kbd "M-i") 'ido-goto-symbol)

;;; common-cfg.el ends here
