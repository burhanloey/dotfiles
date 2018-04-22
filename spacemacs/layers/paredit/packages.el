;;; packages.el --- paredit layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Burhanuddin <burhanuddin@burhanuddin-Aspire-V5-473PG>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst paredit-packages '(paredit))

(defun paredit/init-paredit ()
  (use-package paredit
    :defer t
    :init
    (progn
      (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
      (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
      (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
      (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
      (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
      (add-hook 'scheme-mode-hook           #'enable-paredit-mode)
      (add-hook 'clojure-mode-hook          #'enable-paredit-mode)
      (add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))
      (add-hook 'slime-repl-mode-hook
                (lambda ()
                  (define-key slime-repl-mode-map
                    (read-kbd-macro paredit-backward-delete-key) nil))))))

;;; packages.el ends here
