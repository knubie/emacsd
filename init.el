;;;;;;;;;;;;;;;;
;;; PACKAGES ;;;
;;;;;;;;;;;;;;;;
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(defvar my-packages '(undo-tree
		      evil
		      evil-terminal-cursor-changer
		      nlinum
		      nlinum-hl
		      nlinum-relative))
(package-refresh-contents)
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;;; EVIL
(require 'evil)
(evil-mode 1) ;; enable evil mode


;;;;;;;;;;
;;; UI ;;;
;;;;;;;;;;

; Disable Menu Bar
(menu-bar-mode -1)
(global-hl-line-mode)

(unless (display-graphic-p)
  (require 'evil-terminal-cursor-changer)
  (evil-terminal-cursor-changer-activate)) ; or (etcc-on))
(setq cursor-type 'box
      evil-normal-state-cursor 'box
      evil-insert-state-cursor 'bar
			evil-visual-state-cursor 'box
			evil-motion-state-cursor 'box
			evil-replace-state-cursor 'box
			evil-operator-state-cursor 'box)

;; Line Numbers
(require 'nlinum-relative)
(require 'nlinum-hl)                             ;; highlights the current line
(nlinum-relative-setup-evil)                     ;; setup for evil
(add-hook 'prog-mode-hook 'nlinum-relative-mode) ;; turns on relative in normal mode
(setq nlinum-relative-redisplay-delay 0)         ;; delay
(setq nlinum-relative-current-symbol "")         ;; or "" for display current line number
(setq nlinum-relative-offset 0)                  ;; 1 if you want 0, 2, 3...')')
(setq nlinum-format "%d ")


;;;;;;;;;;;;;;;;;;;;
;;; COLOR SCHEME ;;;
;;;;;;;;;;;;;;;;;;;;

; Iterate over every face and set it to black and white
(dolist (face (face-list))
  (set-face-attribute face nil :foreground "unspecified-fg" :background "unspecified-bg"))

;(set-face-attribute 'region nil :background "#e4e4e4")
;(set-face-attribute 'cursor nil :background "#e4e4e4")
(set-face-attribute 'linum nil :foreground "brightwhite")
(set-face-attribute 'font-lock-comment-face nil :foreground "brightwhite")
(set-face-attribute 'font-lock-comment-delimiter-face nil :foreground "brightwhite")
(set-face-background hl-line-face "magenta")
(set-cursor-color "#ff0000")


;;;;;;;;;;;;;;;;;;;;
;;; KEY BINDINGS ;;;
;;;;;;;;;;;;;;;;;;;;

;; Keys bound in motion state are inherited in the normal, visual, and operator state keymaps if they are not shadowed.
(with-eval-after-load 'evil-maps
  (define-key evil-motion-state-map (kbd ":") 'evil-repeat-find-char)
  (define-key evil-motion-state-map (kbd ";") 'evil-ex)
  (define-key evil-motion-state-map (kbd "H") 'move-beginning-of-line)
  (define-key evil-motion-state-map (kbd "L") 'move-end-of-line)
  (define-key evil-normal-state-map (kbd ", w") 'split-window-right)
  )



;;;;;;;;;;;;;
;;; TODO  ;;;
;;;;;;;;;;;;;

;; [x] evil mode
;; [x] relative line numbers
;; [ ] window management
;;     [ ] navigate between split panes
;;     [ ] auto-resize
;;     [ ] auto-dim non-focused windows
;; [ ] file browser tree
;; [ ] folding
;; [ ] autocomplete
;; [ ] snippets
;; [ ] org mode


;;;;;;;;;;;;;
;;; MISC  ;;;
;;;;;;;;;;;;;

;; (windmove-left)
;; (windmove-right)
;; (windmove-up)
;; (windmove-down)

;; move-beginning-of-line
;; move-end-of-line
