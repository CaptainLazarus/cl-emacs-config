(add-to-list 'load-path "~/.emacs.d/config/")  ; Assuming all config files are in ~/.emacs.d/config/
(require 'init-core)
(require 'init-packages)
(require 'init-bindings)
(require 'init-fonts)
(require 'backup-config)
(require 'erc-config)
(require 'clipboard)
(with-eval-after-load 'org
  (require 'org-babel-config))