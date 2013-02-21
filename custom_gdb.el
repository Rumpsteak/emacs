;; So, all we need to do now is to split the buffers properly.
;; What is the difference between buffers and windows?

(defun my-gdb-setup-windows ()
  "Adapted from `gdb-setup-windows'."
  (gdb-display-locals-buffer)
  (gdb-display-stack-buffer)
  (delete-other-windows)
  (gdb-display-breakpoints-buffer)
  (delete-other-windows)
  ; Don't dedicate.
  (pop-to-buffer gud-comint-buffer)
  (split-window nil ( / ( * (window-height) 3) 4))
  (split-window nil ( / (window-height) 3))
  (split-window-horizontally)
  (other-window 1)
  (gdb-set-window-buffer (gdb-locals-buffer-name))
  (other-window 1)
  (switch-to-buffer
       (if gud-last-last-frame
           (gud-find-file (car gud-last-last-frame))
         (if gdb-main-file
             (gud-find-file gdb-main-file)
           ;; Put buffer list in window if we
           ;; can't find a source file.
           (list-buffers-noselect))))
  (setq gdb-source-window (selected-window))
  ;; (when gdb-use-separate-io-buffer
  ;;   (split-window-horizontally)
  ;;   (other-window 1)
  ;;   (gdb-set-window-buffer
  ;;    (gdb-get-buffer-create 'gdb-inferior-io)))

  ; We always want a separate I/O buffer
  (split-window-horizontally)
  (other-window 1)
  (gdb-set-window-buffer
   (gdb-get-buffer-create 'gdb-inferior-io))

  (other-window 1)
  (gdb-set-window-buffer (gdb-stack-buffer-name))
  (split-window-horizontally)
  (other-window 1)
  (gdb-set-window-buffer (gdb-breakpoints-buffer-name))
  (other-window 1)
)


; FIXME:
;
; Frame 1
; === GDB == Locals =====
; ==== Source ===========
; ==== Stack ===========
;
; Frame 2
; === Threads === Breaks ===
; === Assembler ===
; === Registers ===
; === I/O ===



(defun my-gdb-customization ()
  (progn
    ;; (gdb-display-locals-buffer)
    ;; (gdb-display-stack-buffer)
    ;; (gdb-display-threads-buffer)
    ;; (gdb-display-assembler-buffer)
    ;; (gdb-display-registers-buffer)
    ;; (gdb-display-separate-io-buffer)
    (setq gdb-use-separate-io-buffer t)
    (my-gdb-setup-windows)
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
