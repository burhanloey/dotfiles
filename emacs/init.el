(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives (append package-archives
                               '(("melpa" . "http://melpa.org/packages/")
                                 ("melpa-stable" . "http://stable.melpa.org/packages/")
                                 ("gnu" . "http://elpa.gnu.org/packages/"))))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

(use-package better-defaults
  :ensure t)

(use-package solarized-theme
  :ensure t
  :config
  (load-theme 'solarized-dark t))

(use-package projectile
  :ensure t)

(use-package clojure-mode
  :ensure t)

(use-package clj-refactor
  :ensure t
  :defer t
  :pin melpa-stable
  :init
  (add-hook 'clojure-mode-hook (lambda ()
                                 (clj-refactor-mode 1)
                                 (yas-minor-mode 1)
                                 (cljr-add-keybindings-with-prefix "C-c C-m"))))

(use-package cider
  :ensure t
  :defer t
  :pin melpa-stable)

(use-package rainbow-delimiters
  :ensure t
  :init
  (add-hook 'clojure-mode-hook    #'rainbow-delimiters-mode)
  (add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'lisp-mode-hook       #'rainbow-delimiters-mode)
  (add-hook 'slime-repl-mode-hook #'rainbow-delimiters-mode))

(use-package slime
  :ensure t
  :defer t
  :config
  (load (expand-file-name "~/quicklisp/slime-helper.el"))
  (setq inferior-lisp-program "/usr/bin/sbcl")
  (setq slime-contribs '(slime-fancy)))

(use-package autopair
  :ensure t
  :config
  (autopair-global-mode 1)
  (setq autopair-autowrap t))

(use-package web-mode
  :ensure t
  :defer t
  :init
  (add-hook 'web-mode-hook '(lambda ()
                              (setq web-mode-markup-indent-offset 2)))
  :config
  (setq auto-mode-alist (append auto-mode-alist
                                '(("\\.phtml\\'" . web-mode)
                                  ("\\.tpl\\.php\\'" . web-mode)
                                  ("\\.[agj]sp\\'" . web-mode)
                                  ("\\.as[cp]x\\'" . web-mode)
                                  ("\\.erb\\'" . web-mode)
                                  ("\\.mustache\\'" . web-mode)
                                  ("\\.djhtml\\'" . web-mode)
                                  ("\\.html?\\'" . web-mode)
                                  ("\\.ftl\\'" . web-mode)))))

(use-package paredit
  :ensure t
  :init
  (add-hook 'clojure-mode-hook    #'paredit-mode)
  (add-hook 'cider-repl-mode-hook #'paredit-mode)
  (add-hook 'emacs-lisp-mode-hook #'paredit-mode)
  (add-hook 'lisp-mode-hook       #'paredit-mode)
  (add-hook 'slime-repl-mode-hook #'paredit-mode))

(use-package lua-mode
  :ensure t
  :defer t
  :config
  (autoload 'lua-mode "lua-mode" "Lua editing mode." t)
  (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
  (add-to-list 'interpreter-mode-alist '("lua" . lua-mode)))

(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))

(use-package geiser
  :ensure t
  :defer t)
