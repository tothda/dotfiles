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

;; setup load path

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

(setq hpk-vendor-dir (file-name-as-directory (concat dotfiles-dir "vendor")))

(defun hpk-list-dirs-in (dir)
  "List subdirectories of dir, excluding \".\" and \" ..\"."
  (remove-if
   (lambda (x) (or (equal x ".")
               (equal x "..")
               (not (file-directory-p (concat (file-name-as-directory dir) x)))))
   (directory-files dir)))

(add-to-list 'load-path dotfiles-dir)

;; add every directory under vendor to load-path
(dolist (dir (hpk-list-dirs-in hpk-vendor-dir))
  (add-to-list 'load-path (concat hpk-vendor-dir dir)))

;;------------------------------
;; starter kit
(require 'starter-kit)
(require 'starter-kit-bindings)
(require 'starter-kit-ruby)

;;------------------------------
;; handlebars-mode
(add-to-list 'auto-mode-alist '("\\.handlebars$" . handlebars-mode))

;;------------------------------
;; find-file-in-project
(setq ffip-patterns (append ffip-patterns '("*.css", "*.handlebars")))


;;------------------------------
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


;; use forked js2-mode
;; https://github.com/mooz/js2-mode
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; setup PATH
(defun add-to-path (path)
  (if (file-exists-p path)
      (progn
        (setenv "PATH" (concat path path-separator (getenv "PATH")))
        (setq exec-path (cons path exec-path)))))

(add-to-path "c:/cygwin/bin")
(add-to-path "/usr/local/bin")
(add-to-path "~/bin")

;; load bindings
(require 'hpk-bindings)

(blink-cursor-mode)
(global-auto-revert-mode)

;; don't put auto-save files to current directory
;; http://stackoverflow.com/a/11310599/1363047
;; TODO: test if it works
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

