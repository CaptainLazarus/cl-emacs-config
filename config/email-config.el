(use-package gnus
  :ensure nil
  :config
  ;; Your Gnus configuration here
  (setq user-mail-address "adityagudimetla@gmail.com")
  (setq user-full-name "Aditya Sujith Gudimetla")
  (setq gnus-select-method '(nnimap "gmail"
                                    (nnimap-address "imap.gmail.com")
                                    (nnimap-server-port 993)
                                    (nnimap-stream ssl)
                                    (nnimap-authinfo-file "~/.authinfo")))
  (setq smtpmail-smtp-server "smtp.gmail.com")
  (setq smtpmail-smtp-service 587)
  (setq smtpmail-stream-type 'starttls)
  (setq smtpmail-smtp-user "adityagudimetla@gmail.com")
  (setq message-send-mail-function 'smtpmail-send-it)
  (setq gnus-message-archive-group "[Gmail]/Sent Mail"))

(provide 'email-config)
