;; Show full file path in mode line.
(setq-default mode-line-buffer-identification
              '(:eval (or (abbreviate-file-name buffer-file-name) (buffer-name))))
