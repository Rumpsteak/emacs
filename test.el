;;;;;;;;;;;;;;;;;;;;;;; SCRIPTING ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun yay () "Hund" (interactive) (message "Hund!"))
(defun yayarg (arg) "Docstring" (interactive "p") (message "Universal arg=%d" arg)) ; Call with C-u <arg> yayarg
(defun yayregion (start end) (interactive "r") (message "Region = %d->%d" start end))
(defun yayn (arg) (interactive "nGive me an int: ") (message "You gave me %d" arg))
(defun yays (arg) (interactive "sGive me a string: ") (message "You gave me '%s'" arg))

; Doesn't work yet !
(defun yaylocal (arg)
  "Docstring"
  (interactive "n")
  (let loc1 loc2 loc3
       (progn
         (setq loc1 (* arg arg))
         (setq loc2 (/ loc1 2))
         (setq loc3 (+ loc2 7)))
       (message "loc3 = %d" loc3)))

;; TODO: Practice LISP symbols

(defun yaytext ()
  (interactive)
  (progn
    (message "point: %d" (point))
    (message "point-min: %d" (point-min))
    (message "point-max: %d" (point-max))
    (message "Region-beginning: %d" (region-beginning))
    (message "Region-end: %d" (region-end))
    )
  )

(defun yayinsert ()
  (interactive)
  (let (len_str str)
    (setq str "HUND")
    (setq len_str (length str))
    (insert str)
    (backward-char len_str)))

(defun yayinsert-repeat (arg)
  (interactive)
  (let ((i 0))
;    (setq len_str (length str))
    (while (< i arg)
;      (insert str)
      (setq i (+ i 1)))))
;    (backward-char (* len_str arg))))

;(len_str
;        (str "HUND")
(defun insert-unicode ()
  (interactive)
  (let ((x 0))
    (while (< x 255)
      (ucs-insert x)
      (setq x (+ x 1)))))

(defun insert-hund ()
  (interactive)
  (let ((i 0))
    (while (< i 10)
      (insert "HUND")
      (setq i (+ i 1)))))

(defun insert-hund-repeat (arg)
  (interactive "p") ; Accept Universal arg (C-u)
  (let ((i 0))
    (while (< i arg)
      (progn ; Run following commands sequentially
        (insert " HUND")
        (insert "GRIS "))
      (setq i (+ i 1)))))

; Good scripting tutorial: http://ergoemacs.org/emacs/emacs.html
