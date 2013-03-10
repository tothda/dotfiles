;; keybindings
(global-set-key (kbd "<ESC> <f1>") 'sr-speedbar-toggle)
(global-set-key (kbd "<ESC> <f2>") 'list-bookmarks)
(global-set-key [f5] 'split-window-horizontally)
(global-set-key [f6] 'split-window-vertically)
;; (global-set-key [f7] 'delete-window)
(global-set-key [f8] 'delete-window)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key [f9] 'ido-switch-buffer)
(global-set-key [f10] 'ido-find-file)
;; (global-set-key [f11] 'ido-switch-buffer)
(global-set-key [f12] 'other-window)
(global-set-key (kbd "s-w") 'kill-this-buffer) ; mac
(global-set-key (kbd "C-<f4>") 'kill-this-buffer) ; win


(global-set-key (kbd "C-x f") 'find-file-in-project)

(provide 'hpk-bindings)
