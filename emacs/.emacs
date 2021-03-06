;; Disable startup screen and open *scratch*
(setq inhibit-startup-message t)

;; Disable menu-bar
(menu-bar-mode 0)

;; Enable package
(require 'package)
(package-initialize)

;; Enable org
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; Put all backups in shared directory
(setq backup-directory-alist `(("." . "~/.emacs.d/saves")))
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;; Do not create lock-files
(setq create-lockfiles nil)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(org)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
