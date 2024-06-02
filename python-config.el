(defun term-send-escape ()
  "Send `ESC` to the terminal."
  (interactive)
  (term-send-raw-string "\e"))

(defun run-pytest-in-term (command)
  "Run a given COMMAND in an ansi-term buffer, using Zsh."
  (let ((term-buffer-name "*ansi-term-pytest*"))
    (if (get-buffer term-buffer-name)
        (switch-to-buffer-other-window term-buffer-name)
      ;; Update the shell path to Zsh. Adjust the path as necessary for your NixOS setup.
      (ansi-term "/run/current-system/sw/bin/zsh" "ansi-term-pytest")
      (sleep-for 0.5) ; Wait a bit for the term to initialize
      (term-send-escape)
      (term-send-raw-string (concat "clear\n"))))
  (term-send-raw-string command)
  (term-send-raw-string "\n"))

(defun run-pytest-current-file-in-term ()
  "Run pytest on the current file in an ansi-term."
  (interactive)
  (run-pytest-in-term (format "pytest %s" (shell-quote-argument (buffer-file-name)))))

(defun run-pytest-current-test-in-term ()
  "Run pytest on the current test under the cursor in an ansi-term."
  (interactive)
  (let* ((test-name (which-function))
         (command-string (if test-name
                             (format "pytest -s -vv %s::%s"
                                     (shell-quote-argument (buffer-file-name))
                                     (shell-quote-argument test-name))
                           (format "pytest -s -vv %s" (shell-quote-argument (buffer-file-name))))))
    (run-pytest-in-term command-string)))

(global-set-key (kbd "C-c t f") 'run-pytest-current-file-in-term)
(global-set-key (kbd "C-c t t") 'run-pytest-current-test-in-term)
