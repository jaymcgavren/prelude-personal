(add-hook 'prelude-prog-mode-hook (lambda () (smartparens-mode -1)) t) ;; Disable smartparens

(setq prelude-clean-whitespace-on-save nil)

(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

(defun replace-smart-quotes (beg end)
  "Replace 'smart quotes' in buffer or region with ascii quotes."
  (interactive "r")
  (format-replace-strings '(("\x201C" . "\"")
                            ("\x201D" . "\"")
                            ("\x2018" . "'")
                            ("\x2019" . "'"))
                          nil beg end))

; Keep projectile-ag, etc. from splitting window.
(setq pop-up-windows nil)

; Highlight current line.
(global-hl-line-mode 1)
(set-face-background 'hl-line "#333300")
(set-face-foreground 'highlight nil) ; Keep syntax highlighting.

(setq ruby-deep-indent-paren nil)

; ido normally lists options horizontally, which is highly unreadable.
(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

; Test toggle setup.
(global-set-key (kbd "C-c t") 'tgt-toggle)
(setq tgt-open-in-new-window 'nil)

;; midnight-mode kills unused buffers.
(require 'midnight)
;; Kill special buffers untouched for X SECONDS.
(setq clean-buffer-list-delay-special 300)
;; Kill file buffers untouched for X DAYS.
(setq clean-buffer-list-delay-general 3)
;; Run clean-buffer-list every hour.
(setq clean-buffer-list-timer (run-at-time t 3600 'clean-buffer-list))

;; Keep magit from asking which remote branch to push to.
(setq magit-push-always-verify nil)
