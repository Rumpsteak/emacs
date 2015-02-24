(deftheme mickenew
  "Created 2015-02-23.")

(defvar font-lock-micke-face 'font-lock-micke-face)
(defface font-lock-micke-face
  '((((type tty) (class color)) nil)
    (((class color) (background light))
     (:foreground "#ff0000"))
    (t nil))
  "Micke font."
  :group 'font-lock-faces)

(defvar font-lock-micke2-face 'font-lock-micke2-face)
(defface font-lock-micke2-face
  '((((type tty) (class color)) nil)
    (((class color) (background light))
     (:foreground "#0000ff"))
    (t nil))
  "Micke2 font."
  :group 'font-lock-faces)

(defvar font-lock-micke3-face 'font-lock-micke3-face)
(defface font-lock-micke3-face
  '((((type tty) (class color)) nil)
    (((class color) (background light))
     (:foreground "#00ffff"))
    (t nil))
  "Micke3 font."
  :group 'font-lock-faces)

(defvar font-lock-micke4-face 'font-lock-micke4-face)
(defface font-lock-micke4-face
  '((((type tty) (class color)) nil)
    (((class color) (background light))
     (:foreground "#ff00ff"))
    (t nil))
  "Micke4 font."
  :group 'font-lock-faces)

(defvar font-lock-method-face 'font-lock-method-face)
(defface font-lock-method-face
  '((((type tty) (class color)) nil)
    (((class color) (background light))
     (:foreground "#ff00ff"))
    (t nil))
  "Method font."
  :group 'font-lock-faces)

(defvar font-lock-function-call-face 'font-lock-function-call-face)
(defface font-lock-function-call-face
  '((((type tty) (class color)) nil)
    (((class color) (background light))
     (:foreground "#ff0000"))
    (t nil))
  "Function call font."
  :group 'font-lock-faces)

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
  '(("\\(\\w+\\)\\s-*("
    (1 font-lock-function-call-face)))
  t)

; Syntax info: http://emacswiki.org/emacs/RegularExpression
; Note: Backslashes need to be escaped since we are building a string

; Unescaped, as presented to regexp engine: \( \( \w\|\s_ \)+ \) \s-* (
; <BEGINGROUP> <BEGINGROUP> WORDCONSTITUENT|SYMBOL <ENDGROUP>+ <ENDGROUP> <WHITESPACE>* LPAR
(font-lock-add-keywords 'python-mode
  '(("\\(\\(\\w\\|\\s_\\)+\\)\\s-*("
    (1 font-lock-function-call-face)))
  t)

(custom-theme-set-faces
 'mickenew
 '(default ((t (:family "fixed" :foundry "misc" :width semi-condensed :height 98 :weight normal :slant normal :underline nil :overline nil :strike-through nil :box nil :inverse-video nil :foreground "#dddddd" :background "black" :stipple nil :inherit nil))))
 '(cursor ((t (:background "yellow"))))
 '(fixed-pitch ((t (:family "Monospace"))))
 '(variable-pitch ((t (:family "Sans Serif"))))
 '(escape-glyph ((((background dark)) (:foreground "cyan")) (((type pc)) (:foreground "magenta")) (t (:foreground "brown"))))
 '(minibuffer-prompt ((((background dark)) (:foreground "cyan")) (((type pc)) (:foreground "magenta")) (t (:foreground "medium blue"))))
 '(highlight ((t (:background "darkolivegreen"))))
 '(region ((t (:background "#0066cc"))))
 '(shadow ((((class color grayscale) (min-colors 88) (background light)) (:foreground "grey50")) (((class color grayscale) (min-colors 88) (background dark)) (:foreground "grey70")) (((class color) (min-colors 8) (background light)) (:foreground "green")) (((class color) (min-colors 8) (background dark)) (:foreground "yellow"))))
 '(secondary-selection ((t (:background "red"))))
 '(trailing-whitespace ((t (:background "#444444"))))

 ;; '(font-lock-builtin-face ((t (:weight bold :foreground "#ffffff" :underline nil))))
 ;; '(font-lock-comment-delimiter-face ((default (:inherit (font-lock-comment-face)))))
 ;; '(font-lock-comment-face ((t (:foreground "IndianRed"))))
 ;; '(font-lock-constant-face ((t (:foreground "#6666dd"))))
 ;; '(font-lock-doc-face ((t (:inherit (font-lock-string-face)))))
 ;; '(font-lock-function-name-face ((t (:foreground "#ffff00"))))
 ;; '(font-lock-keyword-face ((t (:foreground "#dd55ff"))))
 ;; '(font-lock-negation-char-face ((t nil)))
 ;; '(font-lock-preprocessor-face ((t (:foreground "Aquamarine"))))
 ;; '(font-lock-regexp-grouping-backslash ((t (:inherit (bold)))))
 ;; '(font-lock-regexp-grouping-construct ((t (:inherit (bold)))))
 ;; '(font-lock-string-face ((t (:foreground "Orange"))))
 ;; '(font-lock-type-face ((t (:foreground "#9999ff"))))
 ;; '(font-lock-variable-name-face ((t (:foreground "Green"))))
 ;; '(font-lock-warning-face ((t (:weight bold :foreground "Pink"))))

 ;; '(font-lock-builtin-face ((t (:foreground "#dd55ff"))))
 '(font-lock-builtin-face ((t (:bold t :foreground "#ffffff"))))
 '(font-lock-comment-delimiter-face ((default (:inherit (font-lock-comment-face)))))
 '(font-lock-comment-face ((t (:foreground "IndianRed"))))
 '(font-lock-constant-face ((t (:foreground "#6666dd"))))
 '(font-lock-doc-string-face ((t (:foreground "DarkOrange"))))
 '(font-lock-function-name-face ((t (:foreground "#ffff00"))))
 '(font-lock-function-call-face ((t (:bold t :foreground "#ffffff"))))
 '(font-lock-method-face ((t (:foreground "#ff0000"))))
 '(font-lock-keyword-face ((t (:foreground "#dd55ff"))))
 '(font-lock-negation-char-face ((t (:foreground "#dd55ff"))))
 '(font-lock-preprocessor-face ((t (:foreground "Aquamarine"))))
 '(font-lock-regexp-grouping-backslash ((t (:inherit (bold)))))
 '(font-lock-regexp-grouping-construct ((t (:inherit (bold)))))
 '(font-lock-string-face ((t (:foreground "Orange"))))
 '(font-lock-type-face ((t (:foreground "#9999ff"))))
 '(font-lock-variable-name-face ((t (:foreground "#00ff00"))))
 '(font-lock-warning-face ((t (:bold t :foreground "Pink"))))
 '(font-lock-micke-face ((t (:bold t :foreground "#ff0000"))))
 '(font-lock-micke2-face ((t (:bold t :foreground "#0000ff"))))
 '(font-lock-micke3-face ((t (:bold t :foreground "#00ffff"))))
 '(font-lock-micke4-face ((t (:bold t :foreground "#ff00ff"))))

 '(button ((t (:inherit (link)))))
 '(link ((((class color) (min-colors 88) (background light)) (:underline (:color foreground-color :style line) :foreground "RoyalBlue3")) (((class color) (background light)) (:underline (:color foreground-color :style line) :foreground "blue")) (((class color) (min-colors 88) (background dark)) (:underline (:color foreground-color :style line) :foreground "cyan1")) (((class color) (background dark)) (:underline (:color foreground-color :style line) :foreground "cyan")) (t (:inherit (underline)))))
 '(link-visited ((default (:inherit (link))) (((class color) (background light)) (:foreground "magenta4")) (((class color) (background dark)) (:foreground "violet"))))
 '(fringe ((((class color) (background light)) (:background "grey95")) (((class color) (background dark)) (:background "grey10")) (t (:background "gray"))))
 '(header-line ((default (:inherit (mode-line))) (((type tty)) (:underline (:color foreground-color :style line) :inverse-video nil)) (((class color grayscale) (background light)) (:box nil :foreground "grey20" :background "grey90")) (((class color grayscale) (background dark)) (:box nil :foreground "grey90" :background "grey20")) (((class mono) (background light)) (:underline (:color foreground-color :style line) :box nil :inverse-video nil :foreground "black" :background "white")) (((class mono) (background dark)) (:underline (:color foreground-color :style line) :box nil :inverse-video nil :foreground "white" :background "black"))))
 '(tooltip ((((class color)) (:inherit (variable-pitch) :foreground "black" :background "lightyellow")) (t (:inherit (variable-pitch)))))
 '(mode-line ((((class color) (min-colors 88)) (:foreground "black" :background "grey75" :box (:line-width -1 :color nil :style released-button))) (t (:inverse-video t))))
 '(mode-line-buffer-id ((t (:weight bold :foreground "white" :background "DarkRed"))))
 '(mode-line-emphasis ((t (:weight bold))))
 '(mode-line-highlight ((((class color) (min-colors 88)) (:box (:line-width 2 :color "grey40" :style released-button))) (t (:inherit (highlight)))))
 '(mode-line-inactive ((default (:inherit (mode-line))) (((class color) (min-colors 88) (background light)) (:background "grey90" :foreground "grey20" :box (:line-width -1 :color "grey75" :style nil) :weight light)) (((class color) (min-colors 88) (background dark)) (:background "grey30" :foreground "grey80" :box (:line-width -1 :color "grey40" :style nil) :weight light))))
 '(isearch ((t (:background "blue"))))
 '(isearch-fail ((((class color) (min-colors 88) (background light)) (:background "RosyBrown1")) (((class color) (min-colors 88) (background dark)) (:background "red4")) (((class color) (min-colors 16)) (:background "red")) (((class color) (min-colors 8)) (:background "red")) (((class color grayscale)) (:foreground "grey")) (t (:inverse-video t))))
 '(lazy-highlight ((((class color) (min-colors 88) (background light)) (:background "paleturquoise")) (((class color) (min-colors 88) (background dark)) (:background "paleturquoise4")) (((class color) (min-colors 16)) (:background "turquoise3")) (((class color) (min-colors 8)) (:background "turquoise3")) (t (:underline (:color foreground-color :style line)))))
 '(match ((((class color) (min-colors 88) (background light)) (:background "yellow1")) (((class color) (min-colors 88) (background dark)) (:background "RoyalBlue3")) (((class color) (min-colors 8) (background light)) (:foreground "black" :background "yellow")) (((class color) (min-colors 8) (background dark)) (:foreground "white" :background "blue")) (((type tty) (class mono)) (:inverse-video t)) (t (:background "gray"))))
 '(next-error ((t (:inherit (region)))))
 '(query-replace ((t (:inherit (isearch)))))
 '(custom-themed ((((min-colors 88) (class color)) (:background "blue1" :foreground "white")) (((class color)) (:background "blue" :foreground "white")) (t (:slant italic)))))

(provide-theme 'mickenew)

