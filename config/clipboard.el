(when (and (not window-system) (getenv "DISPLAY"))
  (defun copy-to-xclipboard ()
    (interactive)
    (if (region-active-p)
        (progn
          (shell-command-on-region (region-beginning) (region-end) "xclip -selection clipboard")
          (message "Yanked region to clipboard!")
          (deactivate-mark))
      (message "No region active; can't yank to clipboard!")))

  (defun paste-from-xclipboard ()
    (interactive)
    (insert (shell-command-to-string "xclip -selection clipboard -o")))

  (global-set-key (kbd "C-c C-y") 'copy-to-xclipboard)
  (global-set-key (kbd "C-c C-p") 'paste-from-xclipboard))

(provide 'clipboard)
