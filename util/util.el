;; open .emacs file with F12
;; put this at top so it loads even if you have other problems in this file
(global-set-key (kbd "<f12>") (lambda () (interactive) (find-file-other-window user-init-file)))


