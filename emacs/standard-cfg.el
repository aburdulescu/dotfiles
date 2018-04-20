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

(use-package ido-vertical-mode
  :init
  (ido-vertical-mode 1)
  (setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right))

(use-package ido-completing-read+
  :init
  (ido-ubiquitous-mode 1))

(use-package dockerfile-mode)
(use-package cmake-mode)

;; bind M-i to imenu
(global-set-key (kbd "M-i") 'imenu)

(use-package elpy
  :init
  (elpy-enable))

;;; standard-cfg.el ends here
