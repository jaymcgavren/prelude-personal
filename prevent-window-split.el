;; Per https://github.com/daviwil/emacs-from-scratch/blob/master/show-notes/Emacs-Tips-DisplayBuffer-1.org#overriding-the-default-placement-actions
;; Prefer to reuse existing windows, especially those showing a buffer
;; of the same mode
(setq display-buffer-base-action
      '((
         ;; display-buffer-reuse-window
         ;; display-buffer-reuse-mode-window
         display-buffer-same-window
         ;; display-buffer-in-previous-window
         )))
;; (setq display-buffer-alist '(("\\*ansi-term" (display-buffer-reuse-window display-buffer-same-window))))
