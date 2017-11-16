(require 'package)

(add-to-list 'package-archives '("MELPA Stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

# add custom configs
(add-to-list 'load-path "/c/Users/User/repos/configs/emacs/")
(require 'my_config )
