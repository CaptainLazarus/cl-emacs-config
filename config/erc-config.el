(require 'erc)

(setq erc-server "irc.libera.chat"
      erc-port 6667
      erc-nick "cl2700"
      erc-user-full-name "Aditya Sujith Gudimetla"
      erc-email-userid "adityagudimetla@gmail.com"
      erc-default-server "irc.libera.chat"
      erc-default-port 6667
      erc-kill-buffer-on-part t)

(setq erc-join-buffer 'switch)

(provide 'erc-config)
