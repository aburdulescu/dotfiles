(provide 'config)

(defun config-open()
  (interactive)
  (find-file "~/.emacs.d/config.el"))
(global-set-key (kbd "C-c o") 'config-open)

(defun config-load()
  (interactive)
  (expand-file-name "~/.emacs.d/config.el"))
(global-set-key (kbd "C-c l") 'config-load)

(show-paren-mode t)

(setq-default c-basic-offset 2
               tab-width 2
               indent-tabs-mode nil)

(setq c-default-style "k&r")

(fset 'yes-or-no-p 'y-or-n-p)

(setq make-backup-files nil
      inhibit-splash-screen t)

(setq ido-show-dot-for-dired t)
(setq ido-everywhere t)
(ido-mode t)
(winner-mode 1)
(windmove-default-keybindings)
(add-to-list 'load-path "~/.emacs.d/")
(require 'ido-goto-symbol)
(global-set-key (kbd "C-c i") 'ido-goto-symbol)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq initial-scratch-message nil)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(define-key global-map (kbd "C-c C-r") 'revert-buffer)
(define-key global-map (kbd "C-c g") 'rgrep)
(setq visible-bell 1)
(when window-system
  (global-hl-line-mode))
(setq require-final-newline t)
(electric-pair-mode 1)
