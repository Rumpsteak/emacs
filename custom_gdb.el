(defvar gdb-frame1 nil)
(defvar gdb-frame2 nil)

(defvar gdba-window nil)

(defun my-gdb-setup-windows ()
  "Adapted from `gdb-setup-windows'."
  (setq gdb-frame1 (selected-frame))
  (gdb-display-locals-buffer)
  (gdb-display-stack-buffer)
;  (gdb-display-threads-buffer)
  (delete-other-windows)
  (gdb-display-breakpoints-buffer)
  (delete-other-windows)
  ; Don't dedicate.
  (pop-to-buffer gud-comint-buffer)
  (setq gdba-window (selected-window))

  (set-window-dedicated-p (selected-window) t)
  (split-window nil ( / ( * (window-height) 3) 4))
  (split-window nil ( / (window-height) 4))
  (split-window-horizontally)

  (other-window 1)
  (gdb-set-window-buffer (gdb-locals-buffer-name))
  (set-window-dedicated-p (selected-window) t)

  (other-window 1)
  ;(set-window-dedicated-p (selected-window) t)

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
  ;(set-window-dedicated-p (selected-window) t)

  ;;; Frame 2 ;;;
  (if (not (eq gdb-frame2 nil))
      ; Always destroy the old frame, if it exists
      ; (Pretty unnecessary - is there a better way to find whether its intact?
      (progn
        (message "Deleting frame 2")
        (delete-frame gdb-frame2)
        (setq gdb-frame2 nil))
    nil)

  ; Create frame 2
  (let (frame2-params)
    (setq gdb-frame2-params '((name . "gdb-frame2")
;                              (left . 1200)
                              (left . 1920) ; right-align
                              (top . 0)
                              (width . 200)
                              (height . 500) ; full-height. Better way?
                              (font . "6x13")))
        (setq gdb-frame2 (make-frame gdb-frame2-params)))

  (select-frame gdb-frame2)
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

  (select-frame gdb-frame1)
  (gdb-goto-gdb-buffer) ; Doesn't work, probably because frame2 is selected
  )

; IDEA: Create Frame 1 in a new Frame too. Then I can always continue writing my code in my original setup, without having to use revbufs!
;       This may be difficult if gdb always wants to open in the original frame though...
(defun my-gdb-customization ()
  (progn
    (setq gdb-use-separate-io-buffer t)
    (my-gdb-setup-windows)
    ))

(add-hook 'gdb-mode-hook 'my-gdb-customization)

(defun gdb-rebuild-windows ()
  (interactive)
  (my-gdb-setup-windows)
  )

(defvar gdb-start-command "start\n")
(defun gdb-set-start-command (arg)
  (interactive "sStart command: ")
  (setq gdb-start-command arg)
  )

; FIXME: Ask for start command the first time of the session?
(defun gdb-start ()
  (interactive)
  (gud-call gdb-start-command))

(defun gdb-kill ()
  (interactive)
  (gud-call "quit"))

(defun gdb-goto-gdb-buffer ()
  (interactive)
  (select-window gdba-window))

(defun gdb-goto-source-buffer ()
  (interactive)
  (select-window gdb-source-window))

(global-set-key (kbd "C-<f1>") 'gdb-goto-gdb-buffer)
(global-set-key (kbd "C-<f2>") 'gdb-goto-source-buffer)
(global-set-key (kbd "C-<f4>") 'gdb-start)
(global-set-key (kbd "C-<f9>") 'gdb-rebuild-windows)
(global-set-key (kbd "C-<f11>") 'gdb) ; Start entire gdb session
(global-set-key (kbd "C-<f12>") 'gdb-kill)

; TODO List
;
; FIXME: I/O sometimes not printed on the separate I/O buffer
; FIXME: Get register info garbage in gdb-buffer (Also garbage in assembler buffer)
; FIXME: 'compile no longer splits windows correctly
; FIXME: Maybe I could gain something from (set-window-dedicated-p) ?
; FIXME: Integrate into main.el
