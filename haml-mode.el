;; haml-mode can't delete the region by default.
;; Override haml-mode's backspace function if text is selected.
(defun haml-backspace-or-delete-region (arg)
  (interactive "*p")
  (if (use-region-p)
      (delete-region (region-beginning) (region-end))
    (haml-electric-backspace arg)))

(with-eval-after-load 'haml-mode
  (define-key haml-mode-map [backspace] 'haml-backspace-or-delete-region)
  (define-key haml-mode-map (kbd "DEL") 'haml-backspace-or-delete-region))
