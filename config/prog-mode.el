(use-package prog-mode
  :config
  (global-prettify-symbols-mode))

(use-package prettier-js
  :config
  (setq prettier-js-args '
        ("--no-semi"
        "--single-quote" "--print-width 120" ))
  )



(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package flycheck-color-mode-line)

(use-package evil-smartparens
  :config
  (show-smartparens-global-mode))

(use-package elm-mode
  :mode "\\.elm\\'"
  :bind (("M-." . elm-mode-goto-tag-at-point)
         ("M-," . pop-tag-mark))
  :preface
  (defun mg/my-elm-mode-hook ()
    (flycheck-mode 1)
    (smartparens-mode 1))
  :hook ((elm-mode . mg/my-elm-mode-hook))
  :config
  ;; (add-hook 'elm-mode-hook 'elm-oracle-setup-completion)
  ;; (add-hook 'elm-mode-hook 'elm-mode-generate-tags)
  (progn
    (add-to-list 'company-backends 'company-elm)
    (defvar elm-compile-arguments '("--yes" "--output=elm.js"))
    (setq elm-format-on-save 't)
    ;; (setq elm-tags-on-save 't)
    ;; (setq elm-tags-exclude-elm-stuff 't)
    (setq flycheck-display-errors-delay 0.1)
    )
  )
(use-package flycheck-elm
  :after (flycheck elm-mode)
  :init
  (setq flycheck-elm-reporting-mode 'all)
  :config
  (flycheck-elm-setup)
  )

(use-package vue-mode
  :mode "\\.vue\\'"
  :hook ((vue_mode . prettier-js-mode)) ;; todo, this dosent quite work yet
)
