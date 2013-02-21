; Playing around with window management

; 27. Buffer - A buffer containing data. My be displayed in a window
; 28. Window - May display a buffer. A buffer may be "visiting" a file
; 29. Frame - Groups windows, a frame thus contains one or more windows.
(defun wmtest ()
  (interactive)
  (let (cur-frame
        next-win
        (cur-win (selected-window)))
    (message "------------------")
    (message "cur-win: %s" cur-win)
    (message "window-frame: %s" (window-frame cur-win))
    (message "window-list: %s" (window-list cur-frame))
    (message "root-window: %s" (frame-root-window cur-frame))
    (message "window-tree: %s" (window-tree))
    (delete-other-windows cur-win)
    (setq next-win (split-window cur-win 100 'right))
    (split-window next-win 20 nil) ; Why doesn't 'above and 'below work?
    (setq final-win (split-window next-win 10 nil)) ; Why doesn't 'above and 'below work?
    (select-window final-win)
    ;(split-window next-win 20 'above)
    ))

; Goal: Destroy all windows except one. Keep splitting and resizing that window to the layout I'm interested in.

;; — Command: raise-frame &optional frame
;; This function raises frame frame (default, the selected frame). If frame is invisible or iconified, this makes it visible.

;; — Command: lower-frame &optional frame
;; This function lowers frame frame (default, the selected frame).

;; — User Option: minibuffer-auto-raise
;; If this is non-nil, activation of the minibuffer raises the frame that the minibuffer window is in.



;;   Root window: W1 (Internal)
;;
;;   |--- W1 ---|
;;  W2         W3
;;         W4--|--W5
;;
;;    ______________________________________
;;   | ______  ____________________________ |
;;   ||      || __________________________ ||
;;   ||      |||                          |||
;;   ||      |||                          |||
;;   ||      |||                          |||
;;   ||      |||____________W4____________|||
;;   ||      || __________________________ ||
;;   ||      |||                          |||
;;   ||      |||                          |||
;;   ||      |||____________W5____________|||
;;   ||__W2__||_____________W3_____________ |
;;   |__________________W1__________________|
