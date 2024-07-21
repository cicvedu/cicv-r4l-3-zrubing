

(
 (rust-ts-mode
  .((eglot-workspace-configuration
     . (:rust-analyzer
        (
                     :cargo ( :buildScripts (:enable t)
                              :features "all")

    				 :linkedProjects ["/workspaces/cicv-r4l-4-zrubing/linux/rust-project.json" "/workspaces/cicv-r4l-4-zrubing/src_e1000/rust-project.json" ]
                     :diagnostics ( :disabled ["unresolved-proc-macro"
                                               "unresolved-macro-call"]))))))


 )

;; ((nil . ((indent-tabs-mode . t)
;;          (fill-column . 100)
;;          (mode . auto-fill)))
;;  (c-mode . ((c-file-style . "BSD")
;;             (subdirs . nil)))
;;  ("src_e1000"
;;   . ((nil . (
;; ;; 			 (eval .
;; ;; (with-eval-after-load 'eglot
;; ;;   (add-to-list 'eglot-server-programs
;; ;;                `(rust-ts-mode . ("RA_LOG=lsp_server=debug RA_LOG_FILE=/workspaces/cicv-r4l-4-zrubing/analyzer.log rust-analyzer" :initializationOptions
;; ;;                                       (:linkedProjects ["/workspaces/cicv-r4l-4-zrubing/src_e1000/rust-project.json"])))))

;; ;; 				   )

;; (setq-default eglot-workspace-configuration
;;               '(:rust-analyzer
;; 				(:linkedProjects ["/workspaces/cicv-r4l-4-zrubing/src_e1000/rust-project.json"]
;; 				 :server (:extraEnv (:RA_LOG_FILE "/workspaces/cicv-r4l-4-zrubing/rust-analyzer.log" :RA_LOG "debug" ))
;; 				 :cargo (:sysroot "discover"
;; 						 :buildScripts (:enable t)
;; 						 :procMacro (:enable t))
;; 				 ;;:procMacro (:server "/usr/local/rustup/toolchains/nightly-x86_64-unknown-linux-gnu/libexec/rust-analyzer-proc-macro-srv")
;; 								 )))

;;              )))
;;   ))
