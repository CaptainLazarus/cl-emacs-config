(require 'gnus)
(setq gnus-select-method '(nnimap "gmail"
                                  (nnimap-address "imap.gmail.com")
                                  (nnimap-server-port 993)
                                  (nnimap-stream ssl)))
(setq smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-stream-type 'starttls)
(setq user-full-name "Aditya Sujith Gudimetla")
(setq user-mail-address "adityagudimetla@gmail.com")

(provide 'email-config)
