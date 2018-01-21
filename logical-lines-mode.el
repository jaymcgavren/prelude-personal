(defvar logical-lines-mode-map (make-sparse-keymap)
  "Keymap for `logical-lines-mode'.")

(define-key logical-lines-mode-map (kbd "C-n") #'next-logical-line)
(define-key logical-lines-mode-map (kbd "C-p") #'previous-logical-line)

;;;###autoload
(define-minor-mode logical-lines-mode
  "A minor mode that skips to logical lines instead of wrapped lines."
  ;; If init-value is not set to t, this mode does not get enabled in
  ;; `fundamental-mode' buffers even after doing \"(global-logical-lines-mode 1)\".
  ;; More info: http://emacs.stackexchange.com/q/16693/115
  :init-value nil
  :lighter " logical-lines-mode"
  :keymap logical-lines-mode-map)

;;;###autoload
(define-globalized-minor-mode global-logical-lines-mode logical-lines-mode logical-lines-mode)

;; https://github.com/jwiegley/use-package/blob/master/bind-key.el
;; The keymaps in `emulation-mode-map-alists' take precedence over
;; `minor-mode-map-alist'
(add-to-list 'emulation-mode-map-alists `((logical-lines-mode . ,logical-lines-mode-map)))

;; Turn off the minor mode in the minibuffer
(defun turn-off-logical-lines-mode ()
  "Turn off logical-lines-mode."
  (logical-lines-mode -1))
(add-hook 'minibuffer-setup-hook #'turn-off-logical-lines-mode)

(provide 'logical-lines-mode)
