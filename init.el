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
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
