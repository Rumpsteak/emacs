;; So, all we need to do now is to split the buffers properly.
;; What is the difference between buffers and windows?

(defun my-gdb-setup-windows ()
  "Adapted from `gdb-setup-windows'."
  (gdb-display-locals-buffer)
  (gdb-display-stack-buffer)
;  (gdb-display-threads-buffer)
  (delete-other-windows)
  (gdb-display-breakpoints-buffer)
  (delete-other-windows)
  ; Don't dedicate.
  (pop-to-buffer gud-comint-buffer)
  (split-window nil ( / ( * (window-height) 3) 4))
  (split-window nil ( / (window-height) 4))
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

  (other-window 1)
  (gdb-set-window-buffer (gdb-stack-buffer-name))

  ;;; Frame 2 ;;;
  (let (frame2 frame2-params win)
    (setq frame2-params '((name . "Hund")
                          (left . 1200)
                          (top . 0)
                          (width . 200)
                          (height . 300)
                          (font . "6x13")
                          ))
    (setq frame2 (make-frame frame2-params))
    (select-frame frame2)
    (gdb-set-window-buffer
     (gdb-get-buffer-create 'gdb-inferior-io))
    (split-window nil ( / (window-height) 3))

    (other-window 1)
    (split-window nil ( / (window-height) 2))
    (gdb-set-window-buffer
     (gdb-get-buffer-create 'gdb-assembler-buffer))
    (split-window-horizontally)
    (other-window 1)
    (gdb-set-window-buffer
     (gdb-get-buffer-create 'gdb-registers-buffer))

    (other-window 1)
    (gdb-set-window-buffer
     (gdb-get-buffer-create 'gdb-threads-buffer))
    (split-window-horizontally)
    (other-window 1)
    (gdb-set-window-buffer
     (gdb-get-buffer-create 'gdb-breakpoints-buffer))
    )
  (message "GETBUFFER: %s" (gdb-get-buffer 'gdba))
;  (switch-to-buffer (gdb-get-buffer 'gdba))
)

; IDEA: Create Frame 1 in a new Frame too. Then I can always continue writing my code in my original setup, without having to use revbufs!
;       This may be difficult if gdb always wants to open in the original frame though...
;
; IDEA: Create my own (my-gdb-restore-windows), that I can use when I have destroyed the window setup

(defun my-gdb-customization ()
  (progn
    (setq gdb-use-separate-io-buffer t)
    (my-gdb-setup-windows)
    ))

(add-hook 'gdb-mode-hook 'my-gdb-customization)

;; FIXME: Add a command to kill the debugger
;; FIXME: Will gdb-restore-windows work for my custom setup?
;;        -No, it doesn't. But maybe there's another hook that runs when I do restore-windows?
;;         Hmm... doesn't look like there's anything like that.
;;         Although I could of course create my own function that starts from a single buffer and then splits it as it wants to.

(defun gdbwin ()
  (interactive)
  (my-gdb-setup-windows)
  )
