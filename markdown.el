(defun my-markdown-mode-hook ()
  (setq tab-width 4))
(add-hook 'markdown-mode-hook 'my-markdown-mode-hook)

(setq whitespace-global-modes '(not markdown-mode))

(custom-set-faces
 '(markdown-header-face ((t (:inherit font-lock-function-name-face :weight bold))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :background "brightwhite" :foreground "blue"))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :background "brightwhite" :foreground "blue"))))
)
