;; midnight-mode kills unused buffers.
(require 'midnight)
;; Kill special buffers untouched for X SECONDS.
(setq clean-buffer-list-delay-special 300)
;; Kill file buffers untouched for X DAYS.
(setq clean-buffer-list-delay-general 4)
;; Run clean-buffer-list every hour.
(setq clean-buffer-list-timer (run-at-time t 3600 'clean-buffer-list))
