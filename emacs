;;;
;; packages
;;;

(require 'package)

;; (add-to-list 'package-archives
;; 	     '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
;(add-to-list 'package-archives
;	     '("marmalade" . "http://marmalade-repo.org/packages/") t)

(package-initialize)

(unless package-archive-contents
    (package-refresh-contents))

(defvar my-packages
  '(evil
    linum-relative
    solarized-theme
    paredit
    clojure-mode
    cider
    elpy))

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))


;;;
;; file handling
;;;

(setq auto-save-default nil)  ; disable autosave files e.g. #foobar.txt#
(setq make-backup-files nil)  ; disable backup files e.g. foobar.txt~

;; hooks
(add-hook 'clojure-mode-hook #'enable-paredit-mode)  ; package clojure-mode
(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)


;;;
;; editor/ui settings
;;;

(require 'evil)
(evil-mode 1)

(blink-cursor-mode 0)

(global-linum-mode 1)
(require 'linum-relative)
(linum-relative-on)

(setq column-number-mode t)

(show-paren-mode 1) ;show matching pairs of enclosing characters

;; disable all kinds of bars
(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)))
(menu-bar-mode -1)

(setq inhibit-startup-message t)


;;;
;; theme stuff
;;;

(load-theme 'solarized-dark t)  ; https://github.com/bbatsov/solarized-emacs

(setq x-underline-at-descent-line t)  ; underline postition setting for Xorg


;;;
;; ide settings
;;;

;; web stuff
;; set indentation level

;; html
(add-hook 'html-mode-hook
	  (lambda ()
	    (set (make-local-variable 'sgml-mode-hook) 2)))

(add-hook 'sgml-mode-hook
	  (lambda ()
	    (set (make-local-variable 'sgml-basic-offset) 2)
	    (sgml-guess-indent)))

(add-hook 'js-mode (setq js-indent-level 2))	; javascript
(setq css-indent-offset 2)  ; css
