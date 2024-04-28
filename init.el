(global-display-line-numbers-mode 1)

(add-hook 'prelude-prog-mode-hook (lambda () (smartparens-mode -1)) t) ;; Disable smartparens

(setq prelude-clean-whitespace-on-save nil)

(defun replace-smart-quotes (beg end)
  "Replace 'smart quotes' in buffer or region with ascii quotes."
  (interactive "r")
  (format-replace-strings '(("\x201C" . "\"")
                            ("\x201D" . "\"")
                            ("\x2018" . "'")
                            ("\x2019" . "'"))
                          nil beg end))

(setq ruby-deep-indent-paren nil)

; Test toggle setup.
(global-set-key (kbd "C-c t") 'tgt-toggle)
(setq tgt-open-in-new-window 'nil)

;; midnight-mode kills unused buffers.
(require 'midnight)
;; Kill special buffers untouched for X SECONDS.
(setq clean-buffer-list-delay-special 300)
;; Kill file buffers untouched for X DAYS.
(setq clean-buffer-list-delay-general 4)
;; Run clean-buffer-list every hour.
(setq clean-buffer-list-timer (run-at-time t 3600 'clean-buffer-list))

;; Keep magit from asking which remote branch to push to.
(setq magit-push-always-verify nil)
