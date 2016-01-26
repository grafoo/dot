;;;
;; packages
;;;

(require 'package)

(add-to-list 'package-archives
	     '("melpa-stable" . "http://stable.melpa.org/packages/") t)
;(add-to-list 'package-archives
;	     '("melpa" . "http://melpa.org/packages/") t)
;(add-to-list 'package-archives
;	     '("marmalade" . "http://marmalade-repo.org/packages/") t)

(package-initialize)

(unless package-archive-contents
    (package-refresh-contents))

(defvar my-packages
  '(relative-line-numbers
    clojure-mode
    cider
    solarized-theme
    paredit))

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))


;;;
;; file handling
;;;

(setq auto-save-default nil) ;disable autosave files e.g. #foobar.txt#
(setq make-backup-files nil) ;disable backup files e.g. foobar.txt~

;; hooks
(add-hook 'clojure-mode-hook #'enable-paredit-mode) ;package clojure-mode
(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)


;;;
;; editor/ui settings
;;;

(global-relative-line-numbers-mode) ;package relative-line-numbers
(setq column-number-mode t)

(show-paren-mode 1) ;show matching pairs of enclosing characters

;; disable all kinds of bars
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)


;;;
;; theme stuff
;;;

(load-theme 'solarized-dark t) ;https://github.com/bbatsov/solarized-emacs

(setq x-underline-at-descent-line t) ;underline postition setting for Xorg
