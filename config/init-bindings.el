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

(defun wrap-word-or-region-with-brackets (open close)
  "Wrap the word at point or selected region with OPEN and CLOSE."
  (interactive "sEnter opening bracket: \nsEnter closing bracket: ")
  (if (use-region-p)
      ;; If a region is selected, wrap it
      (let ((beg (region-beginning))
            (end (region-end)))
        (goto-char end)
        (insert close)
        (goto-char beg)
        (insert open)
        (deactivate-mark))
    ;; If no region is selected, wrap the word at point
    (let ((bounds (bounds-of-thing-at-point 'word)))
      (if bounds
          (let ((beg (car bounds))
                (end (cdr bounds)))
            (goto-char end)
            (insert close)
            (goto-char beg)
            (insert open))
        ;; If there's no word, just insert a pair of brackets
        (insert open close)
        (backward-char)))))

(defun wrap-lines-in-brackets (start end)
  "Wrap each line in the region (or the whole buffer if no region is selected) in brackets."
  (interactive "r")
  (save-excursion
    (goto-char start)
    (while (and (<= (point) end) (not (eobp)))
      (beginning-of-line)
      (insert "(")
      (end-of-line)
      (insert ")")
      (forward-line 1))))

(defun wrap-lines-with-brackets-or-strings (start end)
  "Wrap each line in the region (or the whole buffer if no region is selected) with specific brackets or custom strings."
  (interactive "r")
  (let* ((choice (read-char-choice "Choose: ( for (), [ for [], { for {}, or c for custom: " '(?\( ?\[ ?\{ ?c)))
         (open-string (cond
                       ((char-equal choice ?\() "(")
                       ((char-equal choice ?\[) "[")
                       ((char-equal choice ?\{) "{")
                       ((char-equal choice ?c) (read-string "Enter opening string: "))))
         (close-string (cond
                        ((char-equal choice ?\() ")")
                        ((char-equal choice ?\[) "]")
                        ((char-equal choice ?\{) "}")
                        ((char-equal choice ?c) (read-string "Enter closing string: ")))))

    (save-excursion
      (goto-char start)
      (while (and (<= (point) end) (not (eobp)))
        (let ((line-start (point)))
          (end-of-line)
          (if (> (point) line-start) ;; Skip empty lines
              (progn
                (goto-char line-start)
                (insert open-string)
                (end-of-line)
                (insert close-string)))
          (forward-line 1))))))

(defun wrap-in-parentheses ()
  "Wrap the word or region with parentheses."
  (interactive)
  (wrap-word-or-region-with-brackets "(" ")"))

(defun wrap-in-brackets ()
  "Wrap the word or region with square brackets."
  (interactive)
  (wrap-word-or-region-with-brackets "[" "]"))

(defun wrap-in-braces ()
  "Wrap the word or region with curly braces."
  (interactive)
  (wrap-word-or-region-with-brackets "{" "}"))
(defun jump-to-file-if-valid ()
  "Jump to the file at point if it exists."
  (interactive)
  (let ((filename (thing-at-point 'filename t)))
    (if (and filename (file-exists-p filename))
        (find-file filename)
      (message "No valid file at point or file does not exist."))))

(defun my/mc-newline-and-indent ()
  "Insert newline and indent for all cursors in multiple-cursors mode."
  (interactive)
  (if (bound-and-true-p mc/edit-lines)
      (mc/for-each-cursor
       (lambda ()
         (newline)
         (indent-for-tab-command)))
    (newline)
    (indent-for-tab-command)))

;; Bind the function to C-j
(global-set-key (kbd "C-j") 'my/mc-newline-and-indent)
(global-set-key (kbd "C-c j") 'jump-to-file-if-valid)
(global-set-key (kbd "C-c i r") 'insert-racket-sicp-block)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-.") 'mc/mark-all-like-this)
(global-set-key (kbd "M-<up>") 'move-line-up)
(global-set-key (kbd "M-<down>") 'move-line-down)
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c C-t") 'treemacs)
(global-set-key (kbd "C-c w") 'wrap-lines-with-brackets-or-strings)
(global-set-key (kbd "(") 'wrap-in-parentheses)
(global-set-key (kbd "[") 'wrap-in-brackets)
(global-set-key (kbd "{") 'wrap-in-braces)

(provide 'init-bindings)
