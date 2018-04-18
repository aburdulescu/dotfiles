;;; package --- Summary
;;; Commentary:
;;; Code:

(provide 'offline-cfg)

(add-to-list 'load-path "~/projects/dotfiles/emacs")
(require 'common-cfg)

;; activate ido-mode
(require 'ido)
(ido-mode t)

;; add ido-goto-symbol function and bound it to M-i
(require 'ido-goto-symbol)
(global-set-key (kbd "M-i") 'ido-goto-symbol)

;;; offline-cfg.el ends here
