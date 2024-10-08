(use-package slime-theme :ensure t)

(use-package exec-path-from-shell
  :ensure t
  :config
  (when (or (memq window-system '(mac ns x))
            (daemonp))
    (exec-path-from-shell-initialize)))

(use-package recentf
  :ensure nil
  :config
  (recentf-mode 1)
  (setq recentf-max-saved-items 100)
  (add-hook 'after-init-hook 'recentf-cleanup)
  (run-at-time nil (* 5 60) 'recentf-save-list))

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t))

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package counsel
  :ensure t
  :config
  (global-set-key (kbd "C-x C-r") 'counsel-recentf))

(use-package
  racket-mode
  :ensure t)

(use-package 
  spacemacs-theme
  :ensure t)

(use-package
  lavender-theme
  :ensure t)

(use-package
  sicp
  :ensure t)

(use-package
  smart-comment
  :ensure t
  :bind ("M-;" . smart-comment))

(use-package
  smartscan
  :ensure t
  :config
  (global-smartscan-mode t))

(use-package
  org-journal
  :ensure t)

(use-package
  company
  :ensure t)

(use-package
  merlin-company
  :ensure t)

(use-package
  flycheck
  :ensure t)

(use-package
  multiple-cursors
  :ensure t)

(use-package
  magit
  :ensure t)

(use-package
  rebecca-theme
  :ensure t)

(use-package
  melancholy-theme
  :ensure t)

(use-package
  direnv
  :ensure t
  :config
  (direnv-mode)
  )

(use-package
  envrc
  :ensure t)

(use-package
  slime
  :ensure t)

(use-package
  highlight-indent-guides
  :ensure t)

(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

(use-package
  tuareg
  :ensure t
  :config
  (add-hook 'tuareg-mode-hook
          (lambda ()
            (setq-local comment-start "(*")
            (setq-local comment-end "*)"))))

(use-package ob-racket
  :ensure (ob-racket :host github :repo "hasu/emacs-ob-racket"))

(use-package nix-mode
  :ensure t
  :mode "\\.nix\\'")

(use-package js2-mode
  :ensure t
  :config
  (add-hook 'js2-mode-hook (lambda ()
                             (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))

(use-package dap-mode
  :ensure t
  :config
  (dap-mode t)
  (dap-ui-mode t))

(setq mc/list-file "~/.emacs.d/config/.mc-lists.el")

(use-package lsp-mode
  :ensure t
  :hook (python-mode . lsp-deferred)
  :hook (tuareg-mode . lsp-deferred)
  :config
  (require 'dap-python)
  (global-set-key (kbd "C-c r") 'lsp-find-references))

(use-package sudo-edit
  :ensure t
  :config
  (global-set-key (kbd "C-c C-r") 'sudo-edit))

;;(ac-config-default)
(setq merlin-ac-setup 'easy)
(require 'email-config)

(provide 'init-packages)
