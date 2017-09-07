;;; package --- Summmary
;;; Commentary:

;;; Code:
;;config C Style and tab
(setq-default c-basic-offset 4
			  tab-width 4
			  indent-tabs-mode nil)
(setq c-default-style "k&r")

;;Custom theme
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (tango-dark)))
 '(font-use-system-font t)
 '(ido-enable-flex-matching t)
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(show-paren-mode t)
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 98 :width normal)))))

;;=========Import MELPA=======================
(require 'package)

(add-to-list 'package-archives '("MELPA Stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;;config auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)


;;config Yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; config AC C headers
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers))
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

;; switch between header and source
(add-hook 'c-mode-common-hook
  (lambda() 
    (local-set-key  (kbd "C-c o") 'ff-find-other-file)))

;; config flycheck
(global-flycheck-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)
;(add-hook 'c++-mode-hook 'flycheck-mode)
;(add-hook 'c-mode-hook 'flycheck-mode)

;; config powerline
(require 'powerline)
(powerline-center-theme)

;; windmove
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; config ido
(require 'ido)
(ido-mode t)

;; Configs for cmake-ide

;; rtags config
;(require 'rtags)
;(require 'company-rtags)

;(setq rtags-completions-enabled t)
;(eval-after-load 'company
;  '(add-to-list
;    'company-backends 'company-rtags))
;(setq rtags-autostart-diagnostics t)
;(rtags-enable-standard-keybindings)



