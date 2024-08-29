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

(defun atom? (x)
  (not (listp x)))

(defun move-line-up ()
  "Move the current line up."
  (interactive)
  (let ((col (current-column)))
    (transpose-lines 1)
    (forward-line -2)
    (move-to-column col)))

(defun move-line-down ()
  "Move the current line down."
  (interactive)
  (let ((col (current-column)))
    (forward-line 1)
    (transpose-lines 1)
    (forward-line -1)
    (move-to-column col)))

(global-set-key (kbd "C-c i r") 'insert-racket-sicp-block)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-.") 'mc/mark-all-like-this)
(global-set-key (kbd "M-<up>") 'move-line-up)
(global-set-key (kbd "M-<down>") 'move-line-down)
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c C-t") 'treemacs)

(provide 'init-bindings)
