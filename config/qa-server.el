(defun qa-server ()
  "Start the question-answering server."
  (interactive)
  (let ((process (start-process "qa-server" "*QA Server*" "python" "~/projects/slm/main.py")))
    (set-process-filter process 'qa-server-output)))

(defun run-qa-server ()
  "Run the question-answering server script."
  (interactive)
  (let ((default-directory "/path/to/your/script"))
    (compile "nix-shell --run 'python qa_server.py'")))

(defun qa-server-output (process output)
  "Process the output from the question-answering server."
  (message output))

(defun ask-question ()
  "Ask a question to the question-answering server."
  (interactive)
  (let ((question (read-string "Question: ")))
    (call-process "echo" nil "*QA Server*" nil question)))

(global-set-key (kbd "C-c q") 'ask-question)
