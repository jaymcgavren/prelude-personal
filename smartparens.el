;; Disable smartparens per https://github.com/bbatsov/prelude/issues/675#issuecomment-54734380
(add-hook 'prelude-prog-mode-hook (lambda () (smartparens-mode -1)) t)
