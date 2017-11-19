(provide 'windmove-cfg)

(package-install 'windmove)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
