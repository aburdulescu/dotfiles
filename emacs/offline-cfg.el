;;; package --- Summary
;;; Commentary:
;;; Code:

(provide 'offline-cfg)

(require 'common-cfg)

;; add ido-goto-symbol function and bound it to M-i
(require 'ido-goto-symbol)
(global-set-key (kbd "M-i") 'ido-goto-symbol)

;;; offline-cfg.el ends here
