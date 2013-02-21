;;(require 'org-install)
(org-remember-insinuate)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(eval-after-load "org"
  '(progn
     (define-prefix-command 'org-todo-state-map)

     (define-key org-mode-map "\C-cx" 'org-todo-state-map)

     (define-key org-todo-state-map "x"
       #'(lambda nil (interactive) (org-todo "CANCELLED")))
     (define-key org-todo-state-map "d"
       #'(lambda nil (interactive) (org-todo "DONE")))
     (define-key org-todo-state-map "f"
       #'(lambda nil (interactive) (org-todo "DEFERRED")))
     (define-key org-todo-state-map "l"
       #'(lambda nil (interactive) (org-todo "DELEGATED")))
     (define-key org-todo-state-map "s"
       #'(lambda nil (interactive) (org-todo "STARTED")))
     (define-key org-todo-state-map "w"
       #'(lambda nil (interactive) (org-todo "WAITING")))
))

(eval-after-load "org-agenda"
  '(progn
  (define-key org-agenda-mode-map "\C-n" 'next-line)
     (define-key org-agenda-keymap "\C-n" 'next-line)
     (define-key org-agenda-mode-map "\C-p" 'previous-line)
     (define-key org-agenda-keymap "\C-p" 'previous-line)
     ))

(define-key mode-specific-map [?a] 'org-agenda)

;;(require 'remember)

(add-hook 'remember-mode-hook 'org-remember-apply-template)

(define-key global-map [(control meta ?r)] 'remember)

(global-set-key "\C-cr" 'remember)

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(hl-line ((t (:background "#00ff00"))))
 '(org-agenda-column-dateline ((t (:foreground "#ff00ff"))))
 '(org-agenda-date ((t (:foreground "#999900"))) t)
 '(org-agenda-date-weekend ((t (:foreground "#cc3333"))) t)
 '(org-agenda-dimmed-todo-face ((t (:foreground "#999999"))))
 '(org-agenda-restriction-lock ((t (:foreground "#00ff00"))))
 '(org-agenda-structure ((t (:foreground "#00ff00"))))
 '(org-archived ((((class color grayscale) (min-colors 88) (background dark)) (:foreground "#00ff00"))))
 '(org-clock-overlay ((t (:foreground "#00ff00"))))
 '(org-code ((t (:foreground "#00ff00"))))
 '(org-column ((t (:foreground "#00ff00"))))
 '(org-column-title ((t (:foreground "#ff0000"))))
 '(org-date ((((class color) (background dark)) (:foreground "#474747" :underline t))))
 '(org-done ((t (:foreground "#00ff00" :weight bold))))
 '(org-drawer ((t (:foreground "#ff0000"))))
 '(org-ellipsis ((t (:foreground "#ff0000"))))
 '(org-footnote ((t (:foreground "#ff0000"))))
 '(org-formula ((t (:foreground "#ff0000"))))
 '(org-headline-done ((((class color) (min-colors 16) (background dark)) (:foreground "grey22"))))
 '(org-hide ((t (:foreground "#222222"))))
 '(org-latex-and-export-specials ((t (:foreground "#ff0000"))))
 '(org-level-1 ((((class color) (min-colors 88) (background dark)) (:foreground "#cccccc" :weight bold))))
 '(org-level-2 ((((class color) (min-colors 16) (background dark)) (:foreground "#cccccc"))))
 '(org-level-3 ((((class color) (min-colors 88) (background dark)) (:foreground "#9966ff"))))
 '(org-level-4 ((((class color) (min-colors 88) (background dark)) (:foreground "#cccccc"))))
 '(org-level-5 ((t (:foreground "#0000ff"))))
 '(org-level-6 ((t (:foreground "#0000ff"))))
 '(org-level-7 ((t (:foreground "#0000ff"))))
 '(org-level-8 ((t (:foreground "#0000ff"))))
 '(org-link ((((class color) (background dark)) (:foreground "#33cccc" :underline t))))
 '(org-property-value ((t (:foreground "#0000ff"))) t)
 '(org-scheduled ((t (:foreground "#cccccc"))))
 '(org-scheduled-previously ((t (:foreground "#ffffff"))))
 '(org-scheduled-today ((t (:foreground "#ffffff"))))
 '(org-sexp-date ((t (:foreground "#0000ff"))))
 '(org-special-keyword ((((class color) (min-colors 16) (background dark)) (:foreground "0000ff"))))
 '(org-table ((((class color) (min-colors 88) (background dark)) (:foreground "#00aaaa"))))
 '(org-tag ((t (:foreground "#cc0033" :weight bold))))
 '(org-target ((t (:foreground "#ffff00"))))
 '(org-time-grid ((t (:foreground "#ff00ff"))))
 '(org-todo ((t (:foreground "#ff0000" :weight bold))))
 '(org-upcoming-deadline ((t (:foreground "#ff0000"))))
 '(org-verbatim ((t (:foreground "#ff00ff"))))
 '(org-waiting ((t (:foreground "#ff00ff" :weight bold))))
 '(org-warning ((t (:foreground "#cc0033")))))


;; (setq org-todo-keyword-faces
;;       '(
;;         ("TODO" . (:background "#990000" :foreground "#999999"));; :bold t :box (:line-width 1 :style released-button))) ;;(:foreground "#ff3300")
;;         ("STARTED" . (:background "#999900" :foreground "#000000"))
;;         ("WAITING" . (:background "#99ff00" :foreground "#000000"))
;;         ("DELEGATED" . (:foreground "#ffff00"))
;;         ("APPT" . (:foreground "#ff00ff" :weight bold))
;;         ("DONE" . (:background "#009900" :foreground "#000000")) ;;(:foreground "#006600")
;;         ("DEFERRED" . (:foreground "#666600"))
;;         ("CANCELLED" . (:foreground "#006600"))
;;         ("IDEA" . (:foreground "#33CC33"))
;;         ("INVESTIGATE" . (:foreground "#FF6600"))
;;         ("NOTE" . (:foreground "#00CC00"))
;;         ))


(setq org-todo-keyword-faces
      '(
        ("TODO" . (:foreground "#ff3300"));; :bold t :box (:line-width 1 :style released-button))) ;;(:foreground "#ff3300")
        ("STARTED" . (:foreground "#ffff00"))
        ("WAITING" . (:foreground "#99ff00"))
        ("DELEGATED" . (:foreground "#ffff00"))
        ("APPT" . (:foreground "#ff00ff" :weight bold))
        ("DONE" . (:foreground "#00cc00")) ;;(:foreground "#006600")
        ("DEFERRED" . (:foreground "#666600"))
        ("CANCELLED" . (:foreground "#006600"))
        ("IDEA" . (:foreground "#33CC33"))
        ("PROJECT" . (:foreground "#6666ff"))
        ("NOTE" . (:foreground "#00CC00"))
	))

(setq org-treat-S-cursor-todo-selection-as-state-change nil)
