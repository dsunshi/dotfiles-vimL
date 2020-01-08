(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes
   (quote
    ("a1e99cb36d6235abbe426a0a96fc26c006306f6b9d2a64c2435363350a987b4c" default)))
 '(org-agenda-files (quote ("d:/org/work.org" "d:/org/personal.org" "d:/org/projects.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Setup for Org-mode
(add-to-list 'load-path "D:\\tools\\org-9.1.13\\lisp")
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; Setup for EVIL-mode
(add-to-list 'load-path "D:\\tools\\emacs\\evil")
(require 'evil)
(evil-mode 1)

;; Show line numbers
(global-linum-mode t)

;; Setup for GNU GLOBAL
;; Path to the tags file
(setq tags-file-name "d:\\Projekte\\vwmqb37w.7w\\GTAGS")
;; Path to GLOBAL
(add-to-list 'load-path "d:\\tools\\global\\")
;; Path to gtags.el
(setq load-path (cons "d:\\tools\\global\\share\\gtags\\" load-path))
;;(setq gtags-global-command "d:\\tools\\global\\bin\\global.exe")
(autoload 'gtags-mode "gtags" "" t)

;; Now it is possible to access GLOBAL via M-x gtags-mode, but this will set gtags-mode
;; automatically when c-mode or c++-mode is entered:
(setq c-mode-hook '(lambda () (gtags-mode 1)))
(setq c++-mode-hook '(lambda () (gtags-mode 1)))

;; Basic keybindings for gtags
(setq gtags-mode-hook
'(lambda ()
(local-set-key "\M-t" 'gtags-find-tag)
(local-set-key "\M-r" 'gtags-find-rtag)
(local-set-key "\M-s" 'gtags-find-symbol)
(local-set-key "\C-t" 'gtags-pop-stack)
))
