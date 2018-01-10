(provide 'org-mode-cfg)

(package-install 'org-bullets)

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
