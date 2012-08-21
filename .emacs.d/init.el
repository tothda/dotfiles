(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit
                      starter-kit-lisp
                      starter-kit-bindings
                      starter-kit-eshell
                      starter-kit-ruby
                      starter-kit-js
                      sr-speedbar
                      handlebars-mode)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; sr-speedbar

(require 'sr-speedbar)
(load "sr-speedbar")
;; don't use icons
(setq speedbar-use-images nil)
;; show every file
(setq speedbar-show-unknown-files t)
;; show speedbar on the right side of the current window
(setq sr-speedbar-right-side nil)
;; skip speedbar when changing the active window
(setq sr-speedbar-skip-other-window-p t)

(add-to-list 'load-path "~/.emacs.d/vendor/")

;; use forked js2-mode
;; https://github.com/mooz/js2-mode
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(global-set-key (kbd "<ESC> <f1>") 'sr-speedbar-toggle)

;; cygwin path setup

(let ((cygwin-bin-path "c:/cygwin/bin"))
  (if (file-exists-p cygwin-bin-path)
     (progn
       (setenv "PATH" (concat cygwin-bin-path ";" (getenv "PATH")))
       (setq exec-path (cons cygwin-bin-path exec-path)))))

