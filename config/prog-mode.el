(use-package elm-mode
  :mode "\\.elm\\'"
  :bind (("M-." . elm-mode-goto-tag-at-point)
         ("M-," . pop-tag-mark))
  :init
  :config
  ;; (add-hook 'elm-mode-hook 'elm-oracle-setup-completion)
  ;; (add-hook 'elm-mode-hook 'elm-mode-generate-tags)
  (add-to-list 'company-backends 'company-elm)
  (defvar elm-compile-arguments '("--yes" "--output=elm.js"))
  (setq elm-format-on-save 't)
  ;; (setq elm-tags-on-save 't)
  ;; (setq elm-tags-exclude-elm-stuff 't)
  ;; (use-package flycheck
  ;;   :demand
  ;;   :diminish (flycheck-mode . "")
  ;;   :config
    ;; (setq flycheck-display-errors-delay 0.1)
    ;; (diminish 'flycheck-mode)           ;
    (use-package flycheck-elm
      ;; :demand
      :config
      ;; (setq flycheck-elm-reporting-mode 'all)
      (add-hook 'elm-mode-hook 'flycheck-elm-setup)
      )
    ;; )
  )
