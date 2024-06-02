;; File: init.el
(add-to-list 'load-path "~/.emacs.d/config/")  ; Assuming all config files are in ~/.emacs.d/config/
(require 'init-core)
(require 'init-packages)
(require 'init-bindings)
(require 'backup-config)
;; (require 'email-config)
(with-eval-after-load 'org
  (require 'org-babel-config))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("ce3b031eca9f799eed06dfec91d5818de18b4b4b8f7866b04810984a5ec945da" "9724b3abaf500b227faa036dcf817abed9764802835ba6e8d1e475c877205157" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

