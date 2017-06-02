
;;==============C Style=============
(setq-default c-basic-offset 4
			  tab-width 4
			  indent-tabs-mode nil)
(setq c-default-style "k&r")
;;=============END=================

;;=============Custom theme=====================================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(font-use-system-font t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 98 :width normal)))))
;;============END==============================================

;;=========Import MELPA=======================
(require 'package)

(add-to-list 'package-archives '("MELPA Stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
;;==========END==============================


(add-hook 'after-init-hook #'global-flycheck-mode)

;;=============AUTO-COMPLETE===============
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
;;(global-auto-complete-mode t)
;;============END==========================

;;========Yasnippet========================
(require 'yasnippet)
(yas-global-mode 1)
;;==========END==============================

;;==============AC C headers=================
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers))
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

