;; Create a variable for your backup directory
(defvar my/emacs-backup-directory "~/.emacs.d/backups/")

;; Ensure the backup directory exists
(unless (file-exists-p my/emacs-backup-directory)
  (make-directory my/emacs-backup-directory t))

;; Tell Emacs to use that directory for backups
(setq backup-directory-alist `(("." . ,my/emacs-backup-directory)))

;; Additional backup settings
(setq backup-by-copying t)    ; Avoid symlinks
(setq version-control t)      ; Use version numbers for backups
(setq delete-old-versions t)  ; Automatically delete excess backups
(setq kept-new-versions 6)    ; How many of the newest versions to keep
(setq kept-old-versions 2)    ; How many of the old versions to keep

(provide 'backup-config)
