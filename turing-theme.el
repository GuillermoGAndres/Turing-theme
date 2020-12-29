;; Author: Guillermo Andres Urbano <memocampeon35@gmail.com>
;; URL: https://github.com/GuillermoGAndres/
;; Version: 1.0.0

;;; Credits:
;; The structure of this theme was based on badger-theme.el by Cody Canning

(unless (>= emacs-major-version 24)
  (error "requires Emacs 24 or later."))

;;; Code:
(deftheme turing "The Turing color theme")

;; Turing Color Pallette
(defvar turing-colors-alist
  '(("turing-fg"            . "#F6F3E8")
    ("turing-fg+1"          . "#FBF9F3")
    ("turing-bg"            . "#171717")
    ("turing-bg+1"          . "#2F2F2F")

;; Primary Hues
    ("turing-blue"          . "#8AC6F2")
    ("turing-charcoal"      . "#656868")
    ("turing-salmon"        . "#F28B86")
    ("turing-violet"        . "#BF93C3")
    ("turing-orange"        . "#EA9847")
    ("turing-green"         . "#86B187")
    ("turing-yellow"        . "#E0D063")
    ("turing-sand"          . "#C7B299")

;; Secondary Hues
    ("turing-lime"          . "#84C452")
    ("turing-teal"          . "#65A399")
    ("turing-pink"          . "#E18CBB")
    ("turing-brown"         . "#AC8952")
    ("turing-red"           . "#E2434C")
    ("turing-dull-red"      . "#A55662")
    ("turing-dark-violet"   . "#635770")
    ("turing-darker-violet" . "#433F4F")
    ("turing-olive"         . "#9AA68E")

;; Misc.
    ("turing-link"          . "#8ACDAA")
    ("turing-warn"          . "magenta")
    ("turing-succ"          . "cyan")
    ("turing-hl"            . "#1D1D1D")))

(defmacro turing/with-color-variables (&rest body)
  "`let' bind all colors defined in `turing-colors-alist' around BODY.
Also bind `class' to ((class color) (min-colors 89))."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons)) (cdr cons)))
                   turing-colors-alist))
     ,@body))

(turing/with-color-variables 
  (custom-theme-set-faces
   'turing

   ;; >>>>> Built-in
   '(button ((t (:underline t))))
   `(link ((t (:bold t :foreground ,turing-blue :underline t :weight bold))))
   ;; `(link-visited ((t (:foreground ,turing-salmon-2 :underline t :weight normal))))

   ;; ordinary text. Its background color is used as the frame's background color. 
   `(default ((t (:foreground ,turing-fg :background ,turing-bg))))

   ;;The :background attribute of this face specifies the color of the text cursor
   `(cursor ((t (:background ,turing-salmon)))) 

   ;; The face for displaying control characters and escape sequences
   `(escape-glyph ((t (:foreground ,turing-salmon :bold t))))

   ;; The face for the narrow fringes to the left and right of windows on graphic displays.
   ;`(fringe ((t (:foreground ,turing-fg :background ,"black"))))
   `(fringe ((t (:foreground ,turing-fg :background ,turing-bg))))

   ;; fixed line displayed at the top of the emacs window, not in XEmacs
   ;; `(header-line ((t (:foreground ,turing-salmon 
   ;;                                :background ,"black"
   ;;                                :box (:line-width -1 :style released-button)))))

   ;;text highlighting in various contexts, when the mouse cursor is moved over a hyperlink. 
   `(highlight ((t (:background ,turing-hl))))

   ;; “lazy matches” for Isearch and Query Replace (matches other than the current one). 
   `(lazy-highlight ((t (:background ,turing-yellow :foreground ,"black" :weight extra-bold))))

   ;; This face is used to highlight the current Isearch match 
   `(isearch ((t (:background ,turing-succ :foreground ,"black" :weight extra-bold))))

   
   `(success ((t (:foreground ,turing-link :weight bold))))
   `(warning ((t (:foreground ,turing-pink :weight bold)))) 

   ;; This face is used for displaying an active region 
   `(region ((t (:background ,"gray37"))))

   `(show-paren-match-face ((t (:background ,turing-lime :foreground ,"black" ))))

   ;; >>>>> mode-line
   `(mode-line    ((,class (:foreground ,turing-charcoal
                                        :background ,"black"
                                       ;; :box (:line-width -1 :style released-button)
                                        ))
                   (t :inverse-video nil)))

   `(mode-line-inactive ((t (:background ,turing-bg+1 :foreground ,"black" :box nil))))
   `(mode-line-buffer-id ((t (:foreground ,turing-salmon))))
   `(minibuffer-prompt ((t (:foreground ,turing-violet))))

   ;;   `(mode-line-highlight ((t (:foreground ,turing-lime))))

   ;; linum
   ;;`(linum ((t (:foreground ,turing-charcoal :background ,"black"))))
   '(linum ((t (:inherit (shadow default) :background "#171717" :foreground "#F0DFAF")))) 

   ;; >>>>> font-lock   
   ;`(font-lock-function-name-face ((t (:foreground ,turing-orange ))))
   ;`(font-lock-variable-name-face ((t (:foreground ,turing-salmon))))         
   ;`(font-lock-type-face ((t (:foreground ,turing-sand))))     
   ;`(font-lock-string-face ((t (:foreground ,turing-green))))

   ;; ---------------- Code Highlighting ---------------
   ;; Builtin
   `(font-lock-builtin-face ((t (:foreground ,turing-violet))))
   ;;'(font-lock-builtin-face ((t (:foreground "#CAB4CC"))))   
   ;; Constant
   '(font-lock-constant-face ((t (:foreground "#F0DFAF")))) ;Contastantes amarillas
   ;; Comments
   ;;'(font-lock-comment-face ((t (:foreground "#86B187")))) ; Comentarios de en linea 
   `(font-lock-comment-face ((t (:foreground ,turing-charcoal))))
   ;; Docstring
   '(font-lock-doc-face ((t (:foreground "#86B187")))) ;Dostring verde
   ;; Function names
   '(font-lock-function-name-face ((t (:foreground "#F28B86")))) ;metodos color salmon   
   ;; Keywords
   `(font-lock-keyword-face ((t (:foreground ,turing-blue))))
   ;; Strings
   '(font-lock-string-face ((t (:foreground "#D1907F")))) ;Cadenas naranjas
   ;; Variables   
   '(font-lock-variable-name-face ((t (:foreground "#9FB3C2")))) ;Parametros color griss a la letra.
   ;;'(font-lock-variable-name-face ((t (:foreground "#F6F3E8")))) ;Parametros color normales a la letra.   
   ;;'(font-lock-variable-name-face ((t (:foreground "#8AB8A2")))) ;Parametros color verde para la la letra.
   ;;'(font-lock-variable-name-face ((t (:foreground "#BCEDDE")))) ;Parametros color verde claro a la letra.
   '(font-lock-type-face ((t (:foreground "#F0DFAF")))) ; Clases y types amarillas
   `(font-lock-warning-face ((t (:foreground ,turing-yellow :weight bold))))
   `(font-lock-preprocessor-face ((t (:foreground ,turing-sand))))   
   ;;`(font-lock-preprocessor-face ((t (:foreground "#CAB4CC"))))

   
   ;;`(font-lock-comment-delimiter-face ((t (:foreground ,turing-charcoal :weight light :slant italic))))
   ;;  `(font-lock-doc-face ((t (:foreground ,turing-green))))
   

   ;; >>>>> eshell 
   `(eshell-prompt ((t (:foreground ,turing-lime))))
   `(eshell-ls-archive ((t (:foreground ,turing-orange :weight bold))))
   `(eshell-ls-backup ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-clutter ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-directory ((t (:foreground ,turing-violet :weight normal))))
   `(eshell-ls-executable ((t (:foreground ,turing-yellow :weight normal))))
   `(eshell-ls-unreadable ((t (:foreground ,turing-fg))))
   `(eshell-ls-missing ((t (:inherit font-lock-warning-face))))
   `(eshell-ls-product ((t (:inherit font-lock-doc-face))))
   `(eshell-ls-special ((t (:foreground ,turing-blue :weight bold))))
   `(eshell-ls-symlink ((t (:foreground ,turing-link :weight bold))))

   ;; >>>>> Org mode
   `(org-document-info-keyword ((t (:foreground ,turing-olive))))
   `(org-document-title ((t (:foreground ,turing-salmon :height 1.50))))
   `(org-archived ((t (:foreground ,turing-fg :weight bold))))
   `(org-checkbox ((t (:foreground ,turing-fg+1 :foreground ,turing-olive 
                                   :box (:line-width 1 :style released-button)))))
   `(org-done ((t (:foreground ,turing-lime :strike-through t))))
   `(org-todo ((t (:foreground ,turing-red))))
   `(org-formula ((t (:foreground ,turing-violet))))
   `(org-headline-done ((t (:strike-through t :foreground ,turing-charcoal))))
   `(org-hide ((t (:foreground ,turing-bg)))) 
   `(org-level-1 ((t (:foreground ,turing-blue))))
   `(org-level-2 ((t (:foreground ,turing-violet))))
   `(org-level-3 ((t (:foreground ,turing-orange))))
   `(org-level-4 ((t (:foreground ,turing-yellow))))
   `(org-level-5 ((t (:foreground ,turing-salmon))))
   `(org-level-6 ((t (:foreground ,turing-green))))
   `(org-level-7 ((t (:foreground ,turing-brown))))
   `(org-level-8 ((t (:foreground ,turing-teal))))
   `(org-link ((t (:foreground ,turing-link :underline t))))
   
   `(org-agenda-date ((t (:foreground ,turing-blue))))
   `(org-deadline-announce ((t (:foreground ,turing-dull-red))))
   `(org-date ((t (:foreground ,turing-link :underline t))))
   `(org-agenda-date-today  ((t (:foreground ,turing-salmon :weight light :slant italic))))
   `(org-agenda-structure  ((t (:inherit font-lock-comment-face))))
   ;; `(org-scheduled ((t (:foreground ,zenburn-green+4))))x
   ;; `(org-scheduled-previously ((t (:foreground ,zenburn-red-4))))
   ;; `(org-scheduled-today ((t (:foreground ,zenburn-blue+1))))
   ;; `(org-sexp-date ((t (:foreground ,zenburn-blue+1 :underline t))))
   ;; `(org-time-grid ((t (:foreground ,zenburn-orange))))
   ;; `(org-upcoming-deadline ((t (:inherit font-lock-keyword-face))))

   `(org-special-keyword ((t (:foreground ,turing-olive :weight normal))))
   `(org-table ((t (:foreground ,turing-olive))))
   `(org-tag ((t (:bold t :foreground ,turing-orange :strike-through nil))))
   `(org-warning ((t (:bold t :foreground ,turing-pink :weight bold))))
   `(org-column ((t (:background ,"black"))))
   `(org-column-title ((t (:background ,"black" :foreground ,turing-lime :underline t))))
   `(org-mode-line-clock ((t (:foreground ,turing-yellow))))
   `(org-footnote ((t (:foreground ,turing-link :underline t))))
   `(org-code ((t (:foreground ,turing-olive))))
   `(org-verbatim ((t (:inherit org-code))))
   
   ;; >>>>> elpy and ipython
   `(highlight-indentation-face ((t (:background ,turing-bg))))
   `(comint-highlight-prompt ((t (:inherit eshell-prompt))))
   
   ;; >>>>> auto-complete and popup
   `(ac-candidate-face ((t (:background ,turing-sand :foreground ,"black"))))
   `(ac-selection-face ((t (:background ,turing-violet :foreground ,"black"))))
   `(popup-tip-face ((t (:background ,turing-sand :foreground ,"black"))))
   `(popup-scroll-bar-foreground-face ((t (:background ,turing-dark-violet))))
   `(popup-scroll-bar-background-face ((t (:background ,turing-olive))))
   `(popup-isearch-match ((t (:background ,turing-yellow :foreground ,"black"))))

   ;; >>>>> smart-mode-line
   ;;`(sml/global ((t (:background ,"black" :inverse-video nil))))
   `(sml/folder ((t (:foreground ,turing-charcoal))))
   `(sml/filename ((t (:foreground ,turing-salmon :weight normal))))
   `(sml/prefix   ((t (:foreground ,turing-salmon :weight normal))))
   `(sml/line-number ((t (:foreground ,turing-blue :weight normal))))  
   `(sml/col-number ((t (:foreground ,turing-green :weight normal))))
   `(sml/read-only ((t (:foreground ,turing-charcoal))))
   `(sml/outside-modified ((t (:foreground ,turing-red))))
   `(sml/modified ((t (:foreground ,turing-red))))
   `(sml/remote ((t (:foreground ,turing-charcoal))))
   `(sml/numbers-separator ((t (:foreground ,turing-charcoal))))
   ;;`(sml/client ((t (:foreground ,turing-succ))))
   ;;`(sml/not-modified ((t (:foreground ,turing-yellow))))
   `(sml/git  ((t (:foreground ,turing-blue))))
   `(sml/vc-edited  ((t (:foreground ,turing-blue))))
   `(sml/modes ((t (:foreground ,turing-pink))))
   `(sml/position-percentage ((t (:foreground ,turing-charcoal))))

   `(flyspell-incorrect ((t (:underline (:color ,turing-red :style wave)))))
   `(flyspell-duplicate ((t (:underline (:color ,turing-yellow :style wave)))))

   ;;--------------------Company--------------------
   '(company-preview ((t (:background "#373B41" :foreground "wheat"))))
   '(company-preview-common ((t (:inherit company-preview :foreground "wheat"))))
   '(company-tooltip-common ((t (:foreground "#F0DFAF")))) ;Color de las letras amarillo  en coincidencia en pop
   ;;'(company-tooltip-common ((t (:foreground "#F28B86")))) ;Color de las letras Salmon  en coincidencia en pop
   ;;'(company-tooltip-common ((t (:foreground "#5D6EA3")))) ;Color de las letras azulMarino en coincidencia en pop   
   '(company-tooltip-selection ((t (:background "#7B7B7B")))) ;Color de seleccion resaltado.
   '(company-tooltip ((t (:background "#1D1F21" :foreground "#C5C8C6")))) ;Color fondo y letra
   '(company-scrollbar-bg ((t (:background "#282A2E")))) ;Color de scrollbar
   '(company-scrollbar-fg ((t (:background "#373B41"))))
   '(company-tooltip-annotation ((t (:foreground "#C5C8C6"))))

   ;;--------------------Helm--------------------
   '(helm-source-header ((t (:extend t :foreground "#F28B86" :weight bold))))
   '(helm-match ((t (:extend t :foreground "#F28B86"))))
   '(helm-selection ((t (:extend t :background "gray37" :distant-foreground "black"))))

   '(helm-ff-directory ((t (:extend t :foreground "#F0DFAF"))))
   '(helm-ff-dotted-directory ((t (:extend t :foreground "#d6d6d6"))))
                                           ;Tabs
   '(tab-bar ((t (:inherit variable-pitch :background "#171717" :foreground "#FFDAB5"))))
   '(tab-bar-tab-inactive ((t (:inherit tab-bar-tab :background "#171717" :foreground "#d6d6d6"))))
   
   ;; -------------------------Highlight region color-----------------------------------      
   '(treemacs-fringe-indicator-face ((t (:foreground "#86B187"))))

   
   )

)


(turing/with-color-variables
  (custom-theme-set-variables
   'turing
   `(ansi-color-names-vector [,"black" ,"#E2434C" ,"#86B187" ,"#E0D063" ,"#84C452" ,"#E18CBB" ,"#8AC6F2" ,"white"])))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'turing)


;;; turing-theme.el ends here
    
