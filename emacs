;;;
;; packages
;;;

(require 'package)

;; (add-to-list 'package-archives
;; 	     '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
;; (add-to-list 'package-archives
;; 	     '("marmalade" . "http://marmalade-repo.org/packages/") t)

(package-initialize)

(unless package-archive-contents
    (package-refresh-contents))

(defvar my-packages
  '(evil
    linum-relative
    solarized-theme
    ;; paredit
    ;; clojure-mode
    ;; cider
    elpy
    go-mode
    auto-complete
    go-eldoc
    flycheck))

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))

;;;
;; docs
;;;

;; go-mode
;; https://github.com/dominikh/go-mode.el
;; http://dominik.honnef.co/posts/2013/03/writing_go_in_emacs/
;; http://dominik.honnef.co/posts/2013/08/writing_go_in_emacs__cont__/


;;;
;; file handling
;;;

(setq auto-save-default nil)  ; disable autosave files e.g. #foobar.txt#
(setq make-backup-files nil)  ; disable backup files e.g. foobar.txt~
;; (defun save-buffer-when-visiting-file (begin-region end-region text-length-before-change)  ; todo: make it play nicely with 'gofmt-before-save
;;     "if current buffer is visiting a file trigger basic-save-buffer"
;;     (when (buffer-file-name) (basic-save-buffer)))
;; (add-hook 'after-change-functions 'save-buffer-when-visiting-file)


;;;
;; editor/ui settings
;;;

;; vim keybindings ftw
(require 'evil)
(evil-mode 1)

(blink-cursor-mode 0)

;; line numbers
(global-linum-mode 1)
(require 'linum-relative)
(linum-relative-on)

(setq column-number-mode t)

(show-paren-mode 1)  ; show matching pairs of enclosing characters

;; disable all kinds of bars
(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)))
(menu-bar-mode -1)

(setq inhibit-startup-message t)  ; disable startup message


;;;
;; theme stuff
;;;

(load-theme 'solarized-dark t)  ; https://github.com/bbatsov/solarized-emacs

(setq x-underline-at-descent-line t)  ; underline postition setting for Xorg


;;;
;; ide settings
;;;

;; clojure
;; (add-hook 'clojure-mode-hook #'enable-paredit-mode)  ; package clojure-mode

;; elisp
;; (add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)

;; set indentation level
;; html
(add-hook 'html-mode-hook
	  (lambda ()
	    (set (make-local-variable 'sgml-mode-hook) 2)))

(add-hook 'sgml-mode-hook
	  (lambda ()
	    (set (make-local-variable 'sgml-basic-offset) 2)
	    (sgml-guess-indent)))

(add-hook 'js-mode
	  (setq js-indent-level 2))  ; javascript
(setq css-indent-offset 2)  ; css

;; go-mode
(add-hook 'before-save-hook 'gofmt-before-save)

;; gocode https://github.com/nsf/gocode
(add-to-list 'load-path "~/prj/gop/src/github.com/nsf/gocode/emacs/")
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

;; go-eldoc https://github.com/syohex/emacs-go-eldoc
(add-hook 'go-mode-hook 'go-eldoc-setup)

;; flycheck
(global-flycheck-mode)
