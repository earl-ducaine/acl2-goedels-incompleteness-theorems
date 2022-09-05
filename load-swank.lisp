
(let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp"
                                       (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))



(ql:quickload :swank)
(swank-loader:init)
(swank:start-server "/tmp/slime.2565")






(standard-oi state)



;; (ql:quickload
