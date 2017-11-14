;;=========Import MELPA=======================
(require 'package)

(add-to-list 'package-archives '("MELPA Stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(add-to-list 'load-path "~/repos/configs/emacs/")
(require 'my_config )
