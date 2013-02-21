(modify-frame-parameters nil '((wait-for-wm . nil))) ;; Patch for slow font loading
(setq delete-old-versions t) ;; Patch to avoid "delete excess backup..."

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(ecb-options-version "2.32")
 '(fill-column 80)
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(org-agenda-custom-commands (quote (("d" todo "DELEGATED" nil) ("c" todo "DONE|DEFERRED|CANCELLED" nil) ("w" todo "WAITING" nil) ("W" agenda "" ((org-agenda-ndays 21))) ("A" agenda "" ((org-agenda-skip-function (lambda nil (org-agenda-skip-entry-if (quote notregexp) "\\=.*\\[#A\\]"))) (org-agenda-ndays 1) (org-agenda-overriding-header "Today's Priority #A tasks: "))) ("u" alltodo "" ((org-agenda-skip-function (lambda nil (org-agenda-skip-entry-if (quote scheduled) (quote deadline) (quote regexp) "<[^>e
]+>"))) (org-agenda-overriding-header "Unscheduled TODO entries: "))))))
 '(org-agenda-files (quote ("~/org/todo.org")))
 '(org-agenda-ndays 7)
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-start-on-weekday nil)
 '(org-deadline-warning-days 14)
 '(org-default-notes-file "~/org/notes.org")
 '(org-fast-tag-selection-single-key (quote expert))
 '(org-hide-leading-stars t)
 '(org-odd-levels-only t)
 '(org-remember-store-without-prompt t)
 '(org-remember-templates (quote (("Todo" 116 "** TODO %?
   %U" "~/org/todo.org" "Inbox") ("Idea" 105 "** IDEA %?
   %U" "~/org/ideas.org" "Inbox") ("Appt" 97 "** APPT %?
   %U" "~/org/todo.org" "Appts") ("Project" 112 "** PROJECT %?
   %U" "~/org/projects.org" "Inbox") ("Journal" 106 "** NOTE %? %U" "~/org/journal.org" "Journal"))))
 '(org-reverse-note-order t)
 '(org-todo-keywords (quote ((sequence "TODO(t)" "STARTED(s@/!)" "IDEA(i!)" "DELEGATED(g@/!)" "WAITING(w@/!)" "PROJECT(p!)" "CANCELLED" "DONE(d@)"))))
 '(remember-annotation-functions (quote (org-remember-annotation)))
 '(remember-handler-functions (quote (org-remember-handler)))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(transient-mark-mode t)
 '(visible-bell t))

(setq standard-indent 2)
(setq scroll-step 1)
(setq scroll-Conservatively 10000)
(setq org-highest-priority 65)
(setq org-lowest-priority 90)

;; ========== Place Backup Files in Specific Directory ==========

;; Enable backup files.
(setq make-backup-files t)

;; Enable versioning with default values (keep five last versions, I think!)
(setq version-control t)

;; Save all backup file in this directory.
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))

;; ========== Enable Line and Column Numbering ==========

;; Show line-number in the mode line
(line-number-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)

;; ========== Set the fill column ==========

;; Enable backup files.
;;(setq-default fill-column 120)

(set-default-font "6x13")

;(add-to-list 'load-path "/usr/share/emacs/23.1/lisp" t)
;;(require 'go-mode-load)

(load-file "~/git/emacs/color_theme.el")

(load-file "~/git/emacs/org_config.el")

(add-to-list 'load-path "~/emacs-el" t)
(require 'ack)

;; lusty doesn't work..
;;(require 'lusty-explorer)

;(require 'dired-x)

;;(setq split-width-threshold most-positive-fixnum)
(setq split-width-threshold 1)

(global-set-key [f10] 'ack)
(global-set-key [f12] 'compile)

;;(global-set-key "\Super_L-f" 'windmove-right)
;;(global-set-key "\s-b" 'windmove-left)
;;(global-set-key "\s-n" 'windmove-down)
;;(global-set-key "\s-p" 'windmove-up)

;; (global-set-key (quote [8388706]) (quote windmove-left))
;; (global-set-key (quote [8388720]) (quote windmove-up))
;; (global-set-key (quote [8388710]) (quote windmove-right))

(global-set-key (quote [s-right]) (quote windmove-bright))
(global-set-key (quote [s-left]) (quote windmove-left))
(global-set-key (quote [s-up]) (quote windmove-up))
(global-set-key (quote [s-down]) (quote windmove-down))

(global-set-key (quote [s-i]) (quote indent-region)) ;; FIXME - key doesn't work
(global-set-key (quote [C-i]) (quote indent-region)) ;; FIXME - key doesn't work

(defun th-display-buffer (buffer force-other-window)
  "If BUFFER is visible, select it.

If it's not visible and there's only one window, split the
current window and select BUFFER in the new window. If the
current window (before the split) is more than 165 columns wide,
split horizontally, else split vertically.

If the current buffer contains more than one window, select
BUFFER in the least recently used window.

This function returns the window which holds BUFFER.

FORCE-OTHER-WINDOW is ignored."
  (or (get-buffer-window buffer)
      (if (one-window-p)
          (let ((new-win (if (> (window-width) 165)
                             (split-window-horizontally)
                           (split-window-vertically))))
            (set-window-buffer new-win buffer)
            new-win)
        (let ((new-win (get-lru-window)))
          (set-window-buffer new-win buffer)
          new-win))))

;(setq display-buffer-function 'th-display-buffer) ;; FIXME - Restore?

(setq-default show-trailing-whitespace t)
;; ;; To long lines
;(require 'lineker)
;(add-hook 'c-mode-hook 'lineker-mode)

;(add-to-list 'load-path "/usr/share/doc/git-core/contrib/emacs")
;(require 'git)
;(require 'git-blame)

;;; Prevent Extraneous Tabs
(setq-default indent-tabs-mode nil)


;; Iswitchdb
(require 'edmacro)

(iswitchb-mode 1)
(setq iswitchb-buffer-ignore '("^\\*"))
(setq iswitchb-buffer-ignore '("\*"))
;;(setq iswitchb-default-method 'samewindow)
(defun iswitchb-local-keys ()
  (mapc (lambda (K)
	  (let* ((key (car K)) (fun (cdr K)))
	    (define-key iswitchb-mode-map (edmacro-parse-keys key) fun)))
	'(("C-f" . iswitchb-next-match)
	  ("C-b"  . iswitchb-prev-match)
	  ("<up>"    . ignore             )
	  ("<down>"  . ignore             ))))
(add-hook 'iswitchb-define-mode-map-hook 'iswitchb-local-keys)

;; Revbufs - reload all buffers from disk. Do not revert buffers with changes
(require 'revbufs)
;(require 'ecb)

(setq font-lock-maximum-decoration
      '((c-mode . 3) (c++-mode . 3)))

;; (font-lock-add-keywords 'c-mode
;;                    '(("\\<\\([a-zA-Z_]*\\) *("  1 font-lock-builtin-face prepend)))
;(font-lock-add-keywords 'c-mode
;                   '(("\\<\\([a-zA-Z_]*\\) *("  1 font-lock-builtin-face prepend)))

;; (font-lock-add-keywords 'c-mode
;;   '(("\\(\\w+\\)\\s-*\("
;;     (1 font-lock-builtin-face prepend)))
;;   t)

; Fat highlighting of function calls
(font-lock-add-keywords 'c-mode
  '(("\\(\\w+\\)\\s-*\("
    (1 font-lock-builtin-face)))
  t)

; Javascript mode TEST
;a(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
;(autoload 'javascript-mode "javascript" nil t)

(put 'upcase-region 'disabled nil)

(put 'downcase-region 'disabled nil)

; Espresso mode for javascript
(autoload #'espresso-mode "espresso" "Start espresso-mode" t)
(add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . espresso-mode))
(add-to-list 'auto-mode-alist '("\\.shtml$" . espresso-mode))
(add-to-list 'auto-mode-alist '("\\.shtml.fpp$" . espresso-mode))

; Tramp for ssh editing
;(require 'tramp)
;(setq tramp-shell-prompt-pattern "eater-.+ ") ;; Shall match your prompt on release machines

; Taskjuggler
(require 'taskjuggler-mode)

;; Flex
;(add-to-list 'auto-mode-alist '("\\.l$" . flex-mode))
;(require 'flex-mode)

; Octave
(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))

; cl-files
(add-to-list 'auto-mode-alist '("\\.cl$" . c-mode))

; GUD keys
(global-set-key [f2] 'gud-up)
(global-set-key [f3] 'gud-down)
(global-set-key [f4] 'gud-print)

(global-set-key [f5] 'gud-until)
(global-set-key [f6] 'gud-next)
(global-set-key [f7] 'gud-step)
(global-set-key [f8] 'gud-finish)

(global-set-key [f9] 'gud-cont)

;(load-file "~/git/emacs/custom_gdb.el") ;; FIXME

(global-set-key (kbd "C-<f6>") 'gud-nexti)
(global-set-key (kbd "C-<f7>") 'gud-stepi)

; commenting
(global-set-key (kbd "C-;") 'comment-region)
(global-set-key (kbd "C-M-;") 'uncomment-region)

; scripting
(global-set-key (kbd "C-x C-l") 'eval-buffer)
