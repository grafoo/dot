;;;
;; packages
;;;

(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)

(package-initialize)

(unless package-archive-contents
    (package-refresh-contents))

(defvar my-packages
  '(evil
     relative-line-numbers
     clojure-mode
     cider
     d-mode
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
;; editor settings
;;

(global-relative-line-numbers-mode) ;package relative-line-numbers
(setq column-number-mode t)

;; vim for the win
(require 'evil) ;package evil
(evil-mode 1) ;package evil

(show-paren-mode 1) ;show matching pairs of enclosing characters


;;;
;; autocompletion
;;;

(global-set-key "\M- " 'hippie-expand)
