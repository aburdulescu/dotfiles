;;; package --- Summary
;;; Commentary:
;;; Code:

(provide 'standard-cfg)

(require 'package)

;; add MELPA
(add-to-list 'package-archives '("MELPA Stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

(require 'common-cfg)

;; install use-package if not installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; ensure = make sure is installed
(setq-default use-package-always-ensure t)

(ido-mode t)

(use-package auto-complete
  :init
  (ac-config-default)
  (global-auto-complete-mode t))

(use-package magit
  :bind
  ("C-x g" . magit-status))

(use-package flycheck
  :init
  (global-flycheck-mode))

(use-package org-bullets
  :init
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package yasnippet
  :init
  (yas-global-mode 1))

(use-package helm
  :bind
  ("M-x" . helm-M-x)
  ("C-x C-f" . helm-find-files)
  ("C-x b" . helm-buffers-list)
  ("C-x C-b" . helm-buffers-list)
  ("C-x k" . helm-buffers-list)
  ("M-i" . helm-imenu)
  :init
  (helm-mode 1))

;;; standard-cfg.el ends here
