(defun thmd-insert-element (name level)
  (insert (format "%s [%s]" (make-string level ?#) name))
  (newline 4)
  (insert (format "[/%s]" name))
  (forward-line -2))

(defun thmd-insert-onset ()
  (interactive)
  (thmd-insert-element "ONSET" 2))

(defun thmd-insert-keynote ()
  (interactive)
  (thmd-insert-element "KEYNOTE" 4)
  (insert "##### Dialog")
  (newline 4)
  (insert "##### Visual")
  (newline 2)
  (forward-line -4))

(defun thmd-insert-motion ()
  (interactive)
  (thmd-insert-element "MOTION" 4)
  (insert "##### Dialog")
  (newline 4)
  (insert "##### Visual")
  (newline 2)
  (forward-line -4))

(defun thmd-insert-screencast ()
  (interactive)
  (thmd-insert-element "SCREENCAST" 3))

(defun thmd-insert-stage ()
  (interactive)
  (insert "# Stage: ")
  (open-line 2))

(defun thmd-insert-video ()
  (interactive)
  (insert "## Video: ")
  (open-line 2))

(defvar thmd-mode-map (make-sparse-keymap)
  "Keymap for `thmd-mode'.")

(define-key thmd-mode-map (kbd "C-c C-k") #'thmd-insert-keynote)
(define-key thmd-mode-map (kbd "C-c C-m") #'thmd-insert-motion)
(define-key thmd-mode-map (kbd "C-c C-o") #'thmd-insert-onset)
(define-key thmd-mode-map (kbd "C-c C-c") #'thmd-insert-screencast)
(define-key thmd-mode-map (kbd "C-c C-s") #'thmd-insert-stage)
(define-key thmd-mode-map (kbd "C-c C-v") #'thmd-insert-video)

;;;###autoload
(define-minor-mode thmd-mode
  "A minor mode so that my key settings override annoying major modes."
  ;; If init-value is not set to t, this mode does not get enabled in
  ;; `fundamental-mode' buffers even after doing \"(global-thmd-mode 1)\".
  ;; More info: http://emacs.stackexchange.com/q/16693/115
  :init-value nil
  :lighter " thmd-mode"
  :keymap thmd-mode-map)

;;;###autoload
(define-globalized-minor-mode global-thmd-mode thmd-mode thmd-mode)

;; https://github.com/jwiegley/use-package/blob/master/bind-key.el
;; The keymaps in `emulation-mode-map-alists' take precedence over
;; `minor-mode-map-alist'
(add-to-list 'emulation-mode-map-alists `((thmd-mode . ,thmd-mode-map)))

;; Turn off the minor mode in the minibuffer
(defun turn-off-thmd-mode ()
  "Turn off thmd-mode."
  (thmd-mode -1))
(add-hook 'minibuffer-setup-hook #'turn-off-thmd-mode)

(provide 'thmd-mode)
