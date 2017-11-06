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
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(font-use-system-font t)
 '(ido-enable-flex-matching t)
 '(inhibit-startup-screen t)
 '(menu-bar-mode t)
 '(show-paren-mode t)
 '(tool-bar-mode t)
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "adobe" :slant normal :weight semi-bold :height 113 :width normal)))))

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

;; config smart-mode line
(setq sml/theme 'dark)
(sml/setup)

;; windmove
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; config ido
(require 'ido)
(ido-mode t)

;; bind magit-status to C-x g
(global-set-key (kbd "C-x g") 'magit-status)

                                        ;(require 'setup-ggtags)
(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))

(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)

(require 'helm-config)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "C-x C-b") #'helm-buffers-list)
                                        ;(global-set-key (kbd "C-x b") #'helm-buffers-list)
                                        ;(global-set-key (kbd "C-x k") #'helm-buffers-list)
(helm-mode 1)

;; org-mode
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; get PATH for godoc
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

;; set GOPATH for emacs
(setenv "GOPATH" "/home/aab/projects/gocode")

(add-to-list 'exec-path "/home/aab/projects/gocode/bin")

;; go-mode settings
(defun my-go-mode-hook ()
                                        ; Use goimports instead of go-fmt
  (setq gofmt-command "goimports")
                                        ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
                                        ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))
                                        ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark)
  )
(add-hook 'go-mode-hook 'my-go-mode-hook)

;; go-autocomplete
(defun auto-complete-for-go ()
  (auto-complete-mode 1))
(add-hook 'go-mode-hook 'auto-complete-for-go)

(with-eval-after-load 'go-mode
  (require 'go-autocomplete))

(require 'evil)
(evil-mode 1)

(require 'which-key)
(which-key-mode)

(require 'better-defaults)

