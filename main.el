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

;; ========= Set colours ==========

;; Set cursor and mouse-pointer colours
(set-cursor-color "red")
(set-mouse-color "goldenrod")

;; Set region background colour
;; (set-face-background 'region "blue")

;; Set emacs background colour
;;(set-background-color "black")

(require 'color-theme)

(defun color-theme-micke ()
  "Color theme by awiersma, created 2001-08-27."
  (interactive)
  (color-theme-install
   '(color-theme-micke
     ((background-color . "#000000")
      (background-mode . dark)
      (border-color . "black")
      (cursor-color . "yellow")
      (foreground-color . "#dddddd")
      (mouse-color . "sienna1"))
     ((buffers-tab-face . buffers-tab)
      (cperl-here-face . font-lock-string-face)
      (cperl-invalid-face quote underline)
      (cperl-pod-face . font-lock-comment-face)
      (cperl-pod-head-face . font-lock-variable-name-face)
      (vc-mode-face . highlight))
     (default ((t (:background "black" :foreground "white"))))
     (blue ((t (:foreground "blue"))))
     (bold ((t (:bold t))))
     (bold-italic ((t (:bold t))))
     (border-glyph ((t (nil))))
     (buffers-tab ((t (:background "black" :foreground "white"))))
     (calendar-today-face ((t (:underline t))))
     (cperl-array-face ((t (:foreground "darkseagreen"))))
     (cperl-hash-face ((t (:foreground "darkseagreen"))))
     (cperl-nonoverridable-face ((t (:foreground "SkyBlue"))))
     (custom-button-face ((t (nil))))
     (custom-changed-face ((t (:background "blue" :foreground "white"))))
     (custom-documentation-face ((t (nil))))
     (custom-face-tag-face ((t (:underline t))))
     (custom-group-tag-face ((t (:underline t :foreground "light blue"))))
     (custom-group-tag-face-1 ((t (:underline t :foreground "pink"))))
     (custom-invalid-face ((t (:background "red" :foreground "yellow"))))
     (custom-modified-face ((t (:background "blue" :foreground "white"))))
     (custom-rogue-face ((t (:background "black" :foreground "pink"))))
     (custom-saved-face ((t (:underline t))))
     (custom-set-face ((t (:background "white" :foreground "blue"))))
     (custom-state-face ((t (:foreground "#00ffff"))))
     (custom-variable-button-face ((t (:underline t :bold t))))
     (custom-variable-tag-face ((t (:underline t :foreground "light blue"))))
     (diary-face ((t (:foreground "IndianRed"))))
     (erc-action-face ((t (:bold t))))
     (erc-bold-face ((t (:bold t))))
     (erc-default-face ((t (nil))))
     (erc-direct-msg-face ((t (:foreground "sandybrown"))))
     (erc-error-face ((t (:bold t :foreground "IndianRed"))))
     (erc-input-face ((t (:foreground "Beige"))))
     (erc-inverse-face ((t (:background "wheat" :foreground "darkslategrey"))))
     (erc-notice-face ((t (:foreground "MediumAquamarine"))))
     (erc-pal-face ((t (:foreground "pale green"))))
     (erc-prompt-face ((t (:foreground "MediumAquamarine"))))
     (erc-underline-face ((t (:underline t))))
     (eshell-ls-archive-face ((t (:bold t :foreground "IndianRed"))))
     (eshell-ls-backup-face ((t (:foreground "Grey"))))
     (eshell-ls-clutter-face ((t (:foreground "DimGray"))))
     (eshell-ls-directory-face ((t (:bold t :foreground "MediumSlateBlue"))))
     (eshell-ls-executable-face ((t (:foreground "Coral"))))
     (eshell-ls-missing-face ((t (:foreground "black"))))
     (eshell-ls-picture-face ((t (:foreground "Violet"))))
     (eshell-ls-product-face ((t (:foreground "sandybrown"))))
     (eshell-ls-readonly-face ((t (:foreground "Aquamarine"))))
     (eshell-ls-special-face ((t (:foreground "Gold"))))
     (eshell-ls-symlink-face ((t (:foreground "White"))))
     (eshell-ls-unreadable-face ((t (:foreground "DimGray"))))
     (eshell-prompt-face ((t (:foreground "MediumAquamarine"))))
     (fl-comment-face ((t (:foreground "pink"))))
     (fl-doc-string-face ((t (:foreground "purple"))))
     (fl-function-name-face ((t (:foreground "red"))))
     (fl-keyword-face ((t (:foreground "cadetblube"))))
     (fl-string-face ((t (:foreground "green"))))
     (fl-type-face ((t (:foreground "yellow"))))
     ;; (font-lock-builtin-face ((t (:foreground "#9999ff"))))
     ;; (font-lock-comment-face ((t (:foreground "IndianRed"))))
     ;; (font-lock-constant-face ((t (:foreground "#6666dd"))))
     ;; (font-lock-doc-string-face ((t (:foreground "DarkOrange"))))
     ;; (font-lock-function-name-face ((t (:foreground "#ffff00"))))
     ;; (font-lock-keyword-face ((t (:foreground "#dd55ff"))))
     ;; (font-lock-preprocessor-face ((t (:foreground "Aquamarine"))))
     ;; (font-lock-reference-face ((t (:foreground "SlateBlue"))))
     ;; (font-lock-string-face ((t (:foreground "Orange"))))
     ;; (font-lock-type-face ((t (:foreground "#9999ff"))))
     ;; (font-lock-micke-face ((t (:foreground "#9999ff"))))
     ;; (font-lock-variable-name-face ((t (:foreground "Green"))))
     ;; (font-lock-warning-face ((t (:bold t :foreground "Pink"))))

     ;; (font-lock-builtin-face ((t (:bold t :foreground "#ffffff"))))
     ;; (font-lock-comment-face ((t (:foreground "IndianRed"))))
     ;; (font-lock-constant-face ((t (:foreground "#6666dd"))))
     ;; (font-lock-doc-string-face ((t (:foreground "DarkOrange"))))
     ;; (font-lock-function-name-face ((t (:foreground "#ffff00"))))
     ;; (font-lock-keyword-face ((t (:foreground "#dd55ff"))))
     ;; (font-lock-preprocessor-face ((t (:foreground "Aquamarine"))))
     ;; (font-lock-reference-face ((t (:foreground "SlateBlue"))))
     ;; (font-lock-string-face ((t (:foreground "Orange"))))
     ;; (font-lock-type-face ((t (:foreground "#9999ff"))))
     ;; (font-lock-micke-face ((t (:foreground "#9999ff"))))
     ;; (font-lock-variable-name-face ((t (:foreground "Green"))))
     ;; (font-lock-warning-face ((t (:bold t :foreground "Pink"))))

     (font-lock-builtin-face ((t (:bold t :foreground "#ffffff"))))
     (font-lock-comment-face ((t (:foreground "IndianRed"))))
     (font-lock-constant-face ((t (:foreground "#6666dd"))))
     (font-lock-doc-string-face ((t (:foreground "DarkOrange"))))
     (font-lock-function-name-face ((t (:foreground "#ffff00"))))
     (font-lock-keyword-face ((t (:foreground "#dd55ff"))))
     (font-lock-preprocessor-face ((t (:foreground "Aquamarine"))))
     (font-lock-reference-face ((t (:foreground "SlateBlue"))))
     (font-lock-string-face ((t (:foreground "Orange"))))
     (font-lock-type-face ((t (:foreground "#9999ff"))))
     (font-lock-micke-face ((t (:foreground "#9999ff"))))
     (font-lock-variable-name-face ((t (:foreground "Green"))))
     (font-lock-warning-face ((t (:bold t :foreground "Pink"))))

     (qt-classes-face ((t (:foreground "Red"))))
     (gnus-cite-attribution-face ((t (nil))))
     (gnus-cite-face-1 ((t (:bold nil :foreground "deep sky blue"))))
     (gnus-cite-face-10 ((t (:foreground "medium purple"))))
     (gnus-cite-face-11 ((t (:foreground "turquoise"))))
     (gnus-cite-face-2 ((t (:bold nil :foreground "cadetblue"))))
     (gnus-cite-face-3 ((t (:bold nil :foreground "gold"))))
     (gnus-cite-face-4 ((t (:foreground "light pink"))))
     (gnus-cite-face-5 ((t (:foreground "pale green"))))
     (gnus-cite-face-6 ((t (:bold nil :foreground "chocolate"))))
     (gnus-cite-face-7 ((t (:foreground "orange"))))
     (gnus-cite-face-8 ((t (:foreground "magenta"))))
     (gnus-cite-face-9 ((t (:foreground "violet"))))
     (gnus-emphasis-bold ((t (:bold nil))))
     (gnus-emphasis-bold-italic ((t (:bold nil))))
     (gnus-emphasis-highlight-words ((t (:background "black" :foreground "yellow"))))
     (gnus-emphasis-italic ((t (nil))))
     (gnus-emphasis-underline ((t (:underline t))))
     (gnus-emphasis-underline-bold ((t (:underline t :bold nil))))
     (gnus-emphasis-underline-bold-italic ((t (:underline t :bold nil))))
     (gnus-emphasis-underline-italic ((t (:underline t))))
     (gnus-group-mail-1-empty-face ((t (:foreground "aquamarine1"))))
     (gnus-group-mail-1-face ((t (:bold nil :foreground "aquamarine1"))))
     (gnus-group-mail-2-empty-face ((t (:foreground "aquamarine2"))))
     (gnus-group-mail-2-face ((t (:bold nil :foreground "aquamarine2"))))
     (gnus-group-mail-3-empty-face ((t (:foreground "aquamarine3"))))
     (gnus-group-mail-3-face ((t (:bold nil :foreground "aquamarine3"))))
     (gnus-group-mail-low-empty-face ((t (:foreground "aquamarine4"))))
     (gnus-group-mail-low-face ((t (:bold nil :foreground "aquamarine4"))))
     (gnus-group-news-1-empty-face ((t (:foreground "PaleTurquoise"))))
     (gnus-group-news-1-face ((t (:bold nil :foreground "PaleTurquoise"))))
     (gnus-group-news-2-empty-face ((t (:foreground "turquoise"))))
     (gnus-group-news-2-face ((t (:bold nil :foreground "turquoise"))))
     (gnus-group-news-3-empty-face ((t (nil))))
     (gnus-group-news-3-face ((t (:bold nil))))
     (gnus-group-news-4-empty-face ((t (nil))))
     (gnus-group-news-4-face ((t (:bold nil))))
     (gnus-group-news-5-empty-face ((t (nil))))
     (gnus-group-news-5-face ((t (:bold nil))))
     (gnus-group-news-6-empty-face ((t (nil))))
     (gnus-group-news-6-face ((t (:bold nil))))
     (gnus-group-news-low-empty-face ((t (:foreground "DarkTurquoise"))))
     (gnus-group-news-low-face ((t (:bold nil :foreground "DarkTurquoise"))))
     (gnus-header-content-face ((t (:foreground "forest green"))))
     (gnus-header-from-face ((t (:bold nil :foreground "spring green"))))
     (gnus-header-name-face ((t (:foreground "deep sky blue"))))
     (gnus-header-newsgroups-face ((t (:bold nil :foreground "purple"))))
     (gnus-header-subject-face ((t (:bold nil :foreground "orange"))))
     (gnus-signature-face ((t (:bold nil :foreground "khaki"))))
     (gnus-splash-face ((t (:foreground "Brown"))))
     (gnus-summary-cancelled-face ((t (:background "black" :foreground "yellow"))))
     (gnus-summary-high-ancient-face ((t (:bold nil :foreground "SkyBlue"))))
     (gnus-summary-high-read-face ((t (:bold nil :foreground "PaleGreen"))))
     (gnus-summary-high-ticked-face ((t (:bold nil :foreground "pink"))))
     (gnus-summary-high-unread-face ((t (:bold nil))))
     (gnus-summary-low-ancient-face ((t (:foreground "SkyBlue"))))
     (gnus-summary-low-read-face ((t (:foreground "PaleGreen"))))
     (gnus-summary-low-ticked-face ((t (:foreground "pink"))))
     (gnus-summary-low-unread-face ((t (nil))))
     (gnus-summary-normal-ancient-face ((t (:foreground "SkyBlue"))))
     (gnus-summary-normal-read-face ((t (:foreground "PaleGreen"))))
     (gnus-summary-normal-ticked-face ((t (:foreground "pink"))))
     (gnus-summary-normal-unread-face ((t (nil))))
     (gnus-summary-selected-face ((t (:underline t))))
     (green ((t (:foreground "green"))))
     (gui-button-face ((t (:background "grey75" :foreground "black"))))
     (gui-element ((t (:background "#D4D0C8" :foreground "black"))))
     (highlight ((t (:background "darkolivegreen"))))
     (highline-face ((t (:background "#00ff00"))))
     (holiday-face ((t (:background "DimGray"))))
     (info-menu-5 ((t (:underline t))))
     (info-node ((t (:underline t :bold t :foreground "DodgerBlue1"))))
     (info-xref ((t (:underline t :foreground "DodgerBlue1"))))
     (isearch ((t (:background "blue"))))
     (isearch-secondary ((t (:foreground "red3"))))
     (italic ((t (nil))))
     (left-margin ((t (nil))))
     (list-mode-item-selected ((t (:background "gray68" :foreground "white"))))
     (message-cited-text-face ((t (:bold t :foreground "green"))))
     (message-header-cc-face ((t (:bold t :foreground "green4"))))
     (message-header-name-face ((t (:bold t :foreground "orange"))))
     (message-header-newsgroups-face ((t (:bold t :foreground "violet"))))
     (message-header-other-face ((t (:bold t :foreground "chocolate"))))
     (message-header-subject-face ((t (:bold t :foreground "yellow"))))
     (message-header-to-face ((t (:bold t :foreground "cadetblue"))))
     (message-header-xheader-face ((t (:bold t :foreground "light blue"))))
     (message-mml-face ((t (:bold t :foreground "Green3"))))
     (message-separator-face ((t (:foreground "blue3"))))
     (modeline ((t (:background "DarkRed" :foreground "white" :box (:line-width 1 :style released-button)))))
     (modeline-buffer-id ((t (:background "DarkRed" :foreground "white"))))
     (modeline-mousable ((t (:background "DarkRed" :foreground "white"))))
     (modeline-mousable-minor-mode ((t (:background "DarkRed" :foreground "white"))))
     (p4-depot-added-face ((t (:foreground "blue"))))
     (p4-depot-deleted-face ((t (:foreground "red"))))
     (p4-depot-unmapped-face ((t (:foreground "grey30"))))
     (p4-diff-change-face ((t (:foreground "dark green"))))
     (p4-diff-del-face ((t (:foreground "red"))))
     (p4-diff-file-face ((t (:background "gray90"))))
     (p4-diff-head-face ((t (:background "gray95"))))
     (p4-diff-ins-face ((t (:foreground "blue"))))
     (pointer ((t (nil))))
;     (primary-selection ((t (:background "#555500"))))
     (primary-selection ((t (:background "#ffff00"))))
     (red ((t (:foreground "red"))))
;     (region ((t (:background "blue"))))
     (region ((t (:background "#0066cc"))))
     (right-margin ((t (nil))))
;     (secondary-selection ((t (:background "darkslateblue"))))

     (trailing-whitespace ((t (:background "#444444"))))

     (secondary-selection ((t (:background "red"))))
     (show-paren-match-face ((t (:background "Aquamarine" :foreground "SlateBlue"))))
     (show-paren-mismatch-face ((t (:background "Red" :foreground "White"))))
     (text-cursor ((t (:background "yellow" :foreground "black"))))
     (toolbar ((t (nil))))
     (underline ((nil (:underline nil))))
     (vertical-divider ((t (nil))))
     (widget ((t (nil))))
     (widget-button-face ((t (:bold t))))
     (widget-button-pressed-face ((t (:foreground "red"))))
     (widget-documentation-face ((t (:foreground "lime green"))))
     (widget-field-face ((t (:background "dim gray"))))
     (widget-inactive-face ((t (:foreground "light gray"))))
     (widget-single-line-field-face ((t (:background "dim gray"))))
     (woman-bold-face ((t (:bold t))))
     (woman-italic-face ((t (:foreground "beige"))))
     (woman-unknown-face ((t (:foreground "LightSalmon"))))
     (yellow ((t (:foreground "yellow"))))
     (zmacs-region ((t (:background "snow" :foreground "blue")))))))

(color-theme-micke)

(set-default-font "6x13")

;(add-to-list 'load-path "/usr/share/emacs/23.1/lisp" t)
;;(require 'go-mode-load)

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

;; ; GUD keys
;; (add-hook 'c-mode-hook
;;  (lambda ()
;;  (local-set-key [f2] 'gud-up)
;;  (local-set-key [f3] 'gud-down)
;;  (local-set-key [f4] 'gud-print)

;;  (local-set-key [f5] 'gud-until)
;;  (local-set-key [f6] 'gud-next)
;;  (local-set-key [f7] 'gud-step)
;;  (local-set-key [f8] 'gud-finish)

;;  (local-set-key [f9] 'gud-cont)
;;  )
;; )

; Taskjuggler
(require 'taskjuggler-mode)
(require 'flex-mode)

; Flex
(add-to-list 'auto-mode-alist '("\\.l$" . flex-mode))

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

(load-file "~/git/emacs/custom_gdb.el")
