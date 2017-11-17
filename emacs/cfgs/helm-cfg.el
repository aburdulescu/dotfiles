(provide 'helm-cfg)

(require 'helm-config)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "C-x C-b") #'helm-buffers-list)
(global-set-key (kbd "C-x b") #'helm-buffers-list)
(global-set-key (kbd "C-x k") #'helm-buffers-list)
(helm-mode 1)
