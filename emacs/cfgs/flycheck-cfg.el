(provide 'flycheck-cfg)

(package-install 'flycheck)

(global-flycheck-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)
