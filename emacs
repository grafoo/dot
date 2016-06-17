;;; packages

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

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
    jedi
    go-mode
    auto-complete
    go-eldoc
    flycheck))

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))


;;; file handling

(setq auto-save-default nil) ;disable autosave files e.g. #foobar.txt#
(setq make-backup-files nil) ;disable backup files e.g. foobar.txt~
;; (defun save-buffer-when-visiting-file (begin-region end-region text-length-before-change)  ; todo: make it play nicely with 'gofmt-before-save
;;     "if current buffer is visiting a file trigger basic-save-buffer"
;;     (when (buffer-file-name) (basic-save-buffer)))
;; (add-hook 'after-change-functions 'save-buffer-when-visiting-file)


;;; editor/ui settings

;; vim keybindings ftw
(require 'evil)
(evil-mode 1)

(blink-cursor-mode 0)

;; line numbers
(global-linum-mode 1)
(require 'linum-relative)
(linum-relative-on)

(setq column-number-mode t)
(setq-default tab-width 2) ;display tabs as 2 spaces wide but do not change the actual indentation level
(electric-pair-mode t)     ;auto close characters like e.g. brackets
(show-paren-mode 1)        ;show matching pairs of enclosing characters

;; disable all kinds of bars
(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)))
(menu-bar-mode -1)

(setq inhibit-startup-message t)        ;disable startup message


;;; theme stuff

(load-theme 'solarized-dark t) ;https://github.com/bbatsov/solarized-emacs

(setq x-underline-at-descent-line t) ;underline postition setting for Xorg

(add-to-list 'default-frame-alist
             '(font . "mononoki"))


;;; ide settings

;; clojure
;; (add-hook 'clojure-mode-hook #'enable-paredit-mode)  ; package clojure-mode

;; elisp
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            ;; #'enable-paredit-mode
            (setq indent-tabs-mode nil)))

;; set indentation level
(add-hook 'html-mode-hook
          (lambda ()
            (set (make-local-variable 'sgml-mode-hook) 2)))

(add-hook 'sgml-mode-hook               ;this is also for html
          (lambda ()
            (set (make-local-variable 'sgml-basic-offset) 2)
            (sgml-guess-indent)))

(add-hook 'js-mode
          (setq js-indent-level 2))     ;javascript

(setq css-indent-offset 2)

;; go-mode
(setq gofmt-command "goimports") ;https://godoc.org/golang.org/x/tools/cmd/goimports
(add-hook 'before-save-hook 'gofmt-before-save)

;; gocode https://github.com/nsf/gocode
(add-to-list 'load-path "~/gop/src/github.com/nsf/gocode/emacs/")
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

;; go-eldoc https://github.com/syohex/emacs-go-eldoc
(add-hook 'go-mode-hook 'go-eldoc-setup)

;; flycheck
(global-flycheck-mode)

;; python
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
