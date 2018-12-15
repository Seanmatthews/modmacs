
(use-package cc-mode
  :ensure t
  :init
  :config
  (use-package google-c-style
    :ensure t
    :config
    ;; This prevents the extra two spaces in a namespace that Emacs
    ;; otherwise wants to put... Gawd!
    ;;(add-hook 'c-mode-common-hook 'google-set-c-style)
    ;; Autoindent using google style guide
    (add-hook 'c-mode-common-hook 'google-make-newline-indent)
    )
  (setq c-toggle-auto-newline 1)
  (setq c-set-style "cc-mode")
  (setq c-basic-offset 1)
  (setq tab-width 4)
  (setq indent-tabs-mode nil)
  )

(defun my-newline-and-indent ()
  "Open a new brace or bracket expression, with relevant newlines and indent. "
  (newline)
  (indent-according-to-mode)
  (forward-line -1)
  (indent-according-to-mode))

;; basic C++ standards
(setq-default c-basic-offset 4 c-default-style "linux")
(setq-default tab-width 4 indent-tabs-mode t)
(setq-default c-set-style "cc-mode")
;;(define-key c-mode-base-map (kbd "RET") 'my-newline-and-indent)


;;;;;;;;;;;;;;;;;;;;;;;
;; Autopair
;;;;;;;;;;;;;;;;;;;;;;;
(use-package autopair
  :ensure t
  :init
  (add-hook 'c++-mode-hook #'(lambda () (autopair-mode)))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Clang-format
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; clang-format can be triggered using C-c C-f
;; Create clang-format file using google style
;; clang-format -style=google -dump-config > .clang-format
(use-package clang-format
             :ensure t
             :bind (("C-c C-f" . clang-format-region))
             )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Modern C++ code highlighting
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package modern-cpp-font-lock
  :ensure t
  :init
  (eval-when-compile
    ;; Silence missing function warnings
    (declare-function modern-c++-font-lock-global-mode
                      "modern-cpp-font-lock.el"))
  :config
  (modern-c++-font-lock-global-mode t)
  )

(use-package flycheck
  :ensure t
  :init
  (add-hook 'flycheck-mode-hook #'flycheck-irony-setup)
  )

(use-package fill-column-indicator
  :ensure t
  :init
  (setq fci-rule-column 120)
  (setq fci-rule-width 1)
  (setq fci-rule-color "gray")
  (add-hook 'c++-mode-hook 'fci-mode)
  )


(use-package ivy
             :ensure t
             :commands (ivy-mode)
             :config
             (require 'ivy)
             (ivy-mode t)
             (setq ivy-use-virtual-buffers t)
             (setq enable-recursive-minibuffers t)
             (setq ivy-wrap t)
             (global-set-key (kbd "C-c C-r") 'ivy-resume)
             (setq ivy-count-format "%d/%d ")
             )

;; The way too long hack for properly indenting `enum class`
;; http://stackoverflow.com/questions/6497374/emacs-cc-mode-indentation-problem-with-c0x-enum-class
(defun inside-class-enum-p (pos)
  "Checks if the POS is within the braces of a C++ enum class"
  (ignore-errors
    (save-excursion
      (goto-char pos)
      (up-list -1)
      (backward-sexp 1)
      (looking-back "enum[ \t]+class[ \t]+[^}]*"))))

(defun align-enum-class (langelem)
  (if (inside-class-enum-p (c-langelem-pos langelem))
      0
    (c-lineup-topmost-intro-cont langelem)))

(defun align-enum-class-closing-brace (langelem)
  (if (inside-class-enum-p (c-langelem-pos langelem))
      '-
    '+))

(defun fix-enum-class ()
  "Setup c++-mode to better handle class enum"
  (add-to-list 'c-offsets-alist '(topmost-intro-cont . align-enum-class))
  (add-to-list 'c-offsets-alist
               '(statement-cont . align-enum-class-closing-brace)))

(add-hook 'c++-mode-hook 'fix-enum-class)


(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :init)
(load-theme 'sanityinc-tomorrow-night t)
