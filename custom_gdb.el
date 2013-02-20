;; So, all we need to do now is to split the buffers properly.
;; What is the difference between buffers and windows?

(defun my-gdb-customization ()
  (progn
    (gdb-display-locals-buffer)
    (gdb-display-stack-buffer)
    (gdb-display-threads-buffer)
    (gdb-display-assembler-buffer)
    (gdb-display-registers-buffer)
    (gdb-display-separate-io-buffer)
    (message "Customizing GDB!1111!!!!!!!!!!!")
    ))

(add-hook 'gdb-mode-hook 'my-gdb-customization)

;; FIXME: Add a command to kill the debugger
;; FIXME: Will gdb-restore-windows work for my custom setup?
;;        -No, it doesn't. But maybe there's another hook that runs when I do restore-windows?
;;         Hmm... doesn't look like there's anything like that.
;;         Although I could of course create my own function that starts from a single buffer and then splits it as it wants to.

;; FIXME: Learn more about buffer / window handling.


;; From gdb-ui.el:
(defun DONTREDEFINE-gdb-display-buffer (buf dedicated &optional frame)
  (let ((answer (get-buffer-window buf (or frame 0))))
    (if answer
	(display-buffer buf nil (or frame 0)) ;Deiconify the frame if necessary.
      (let ((window (get-lru-window)))
	(if (memq (buffer-local-value 'gud-minor-mode (window-buffer window))
		  '(gdba gdbmi))
	    (let* ((largest (get-largest-window))
		   (cur-size (window-height largest)))
	      (setq answer (split-window largest))
	      (set-window-buffer answer buf)
	      (set-window-dedicated-p answer dedicated)
	      answer)
	  (set-window-buffer window buf)
	  window)))))
