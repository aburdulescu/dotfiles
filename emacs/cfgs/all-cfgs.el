(provide 'all-cfgs)

(require 'cstyle-cfg)
(require 'autocomplete-cfg)
(require 'yasnippet-cfg)
(require 'find-other-file-cfg)
(require 'flycheck-cfg)
(require 'windmove-cfg)
(require 'magit-cfg)
(require 'helm-cfg)
(require 'org-mode-cfg)

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

(require 'which-key)
(which-key-mode)

(require 'better-defaults)

