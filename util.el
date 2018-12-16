;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Custom utility functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Expands a mods list if it contains '*'
(defun expand-mods-list (ml dir)
  (if (member '* ml)
	  (let ((mods (directory-files dir nil "\\.el$")))
		(mapcar (lambda (f) (file-name-base f)) mods))
	(mapcar 'symbol-name ml)
	))

;; Load all *.el files in a directory
(defun load-directory (dir)
  (let ((load-it (lambda (f) (load-file (concat (file-name-as-directory dir) f)))))
	(mapc load-it (directory-files dir nil "\\.el$"))))
