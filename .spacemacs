;; -*- mode: dotspacemacs -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; --------------------------------------------------------
     ;; Example of useful layers you may want to use right away
     ;; Uncomment a layer name and press C-c C-c to install it
     ;; --------------------------------------------------------
     auto-completion
     ;; better-defaults
     git
     github
     version-control
     markdown
     emacs-lisp
     org
     clojure
     osx
     finance
     ruby
     sql
     html
     eyebrowse
     gnus
     restclient
     javascript
     ranger
     prodigy
     themes-megapack
     (mu4e :variables
           mu4e-installation-path "/usr/local/share/emacs/site-lisp/mu4e")
     ;; syntax-checking
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '(ob-http
                                      org-gcal)

   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."


  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-always-show-changelog t
   dotspacemacs-startup-lists '(recents projects)
   dotspacemacs-themes '(spacemacs-dark spacemacs-light)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Hack" :size 14 :weight normal :width normal :powerline-scale 1.1)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-command-key ":"
   dotspacemacs-enable-paste-micro-state t
   dotspacemacs-guide-key-delay 0.4
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-persistent-server nil
   dotspacemacs-default-package-repository nil
   )
  ;; User initialization goes here
  (setq-default
   dotspacemacs-enable-paste-micro-state t
   )
  )

;; Mikor megnyílik a neotree window, akkor ne az aktuális fájl könyvtára legyen
;; a root, hanem a projectile project root-ja.
;; TODO: mi van, ha az aktuális fájlhoz nem tartozik projectile project?
(defun td-open-neotree-in-projectile-root ()
  (interactive)
  (let ((root-dir (projectile-project-root)))
    (neotree-dir root-dir)))

(defun dotspacemacs/user-config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."

  (add-to-list 'load-path "~/.emacs.d/private/")
  (require 'td-init)


  )

;; Get email, and store in nnml
(setq gnus-secondary-select-methods
      '(
        (nnimap "gmail"
                (nnimap-address
                 "imap.gmail.com")
                (nnimap-server-port 993)
                (nnimap-stream ssl))
        ))

;; Send email via Gmail:
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-default-smtp-server "smtp.gmail.com")

;; Archive outgoing email in Sent folder on imap.gmail.com:
(setq gnus-message-archive-method '(nnimap "imap.gmail.com")
      gnus-message-archive-group "[Gmail]/Sent Mail")

;; set return email address based on incoming email address
(setq gnus-posting-styles
      '(((header "to" "tothda@gmail.com.com")
         (address "tothda@gmail.com"))))

;; store email in ~/gmail directory
(setq nnml-directory "~/gmail")
(setq message-directory "~/gmail")

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(ahs-case-fold-search nil)
;;  '(ahs-default-range (quote ahs-range-whole-buffer))
;;  '(ahs-idle-interval 0.25)
;;  '(ahs-idle-timer 0 t)
;;  '(ahs-inhibit-face-list nil)
;;  '(custom-safe-themes
;;    (quote
;;     ("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
;;  '(expand-region-contract-fast-key "V")
;;  '(expand-region-reset-fast-key "r")
;;  '(ledger-reports
;;    (quote
;;     (("cash" "ledger --price -db prices.db -V -f 2015.ledger balance ^Assets ^Kriszti:Assets")
;;      ("bal" "ledger -f %(ledger-file) bal")
;;      ("reg" "ledger -f %(ledger-file) reg")
;;      ("payee" "ledger -f %(ledger-file) reg @%(payee)")
;;      ("account" "ledger -f %(ledger-file) reg %(account)"))))
;;  '(magit-use-overlays nil)
;;  '(org-export-backends (quote (ascii html icalendar latex md)))
;;  '(paradox-github-token t)
;;  '(ring-bell-function (quote ignore) t)
;;  '(sql-ms-program "isql"))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
;;  '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
