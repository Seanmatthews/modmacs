;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ROS Emacs - https://github.com/code-iai/ros_emacs_utils
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path (concat "/opt/ros/" (getenv "ROS_DISTRO")  "/share/emacs/site-lisp"))
(require 'rosemacs-config)
