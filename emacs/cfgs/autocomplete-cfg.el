(provide 'autocomplete-cfg)

(use-package auto-complete :ensure t)

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)
