;; (setq gofmt-command "goimports")

(defun my-go-mode-hook ()
  (add-hook 'before-save-hook 'gofmt-before-save)
  (setq tab-width 4 indent-tabs-mode 1))
(add-hook 'go-mode-hook 'my-go-mode-hook)

;; Tabs are not a whitespace error in .go files; don't treat them as such.
(setq whitespace-global-modes '(not go-mode))
