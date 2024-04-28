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

;; Keep magit from asking which remote branch to push to.
(setq magit-push-always-verify nil)
