;;; Custom keybindings
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c d") (lambda ()
                                (interactive)
                                (delete-region (line-beginning-position) (line-beginning-position 2))))

(defun insert-racket-sicp-block ()
  "Insert a Racket code block with the SICP package."
  (interactive)
  (insert "#+BEGIN_SRC racket :lang sicp :results output :exports both :eval no-export\n\n#+END_SRC")
  (forward-line -1)
  (end-of-line))

(global-set-key (kbd "C-c i r") 'insert-racket-sicp-block)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-.") 'mc/mark-all-like-this)

(provide 'init-bindings)
