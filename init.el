;; basic setup
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode 10)
(setq ring-bell-function 'ignore)
;; font setting
(set-face-attribute 'default nil
                    :family "Iosevka"
                    :height 200)


;; make ESC quit promts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;;initialize package sources
(require 'package)
(add-to-list 'package-archives '(("melpa" . "https://melpa.org/packages/")
				 ("org" .  "https://orgmode.org/elpa/")
				 ("elpa" .  "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; initialize use-package on non linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; theme
(load-theme 'sanityinc-solarized-dark)

(use-package command-log-mode)

(require 'use-package)
(setq use-package-always-ensure t)

;;ivy usage
(use-package ivy
  :diminish
  :bind (:map ivy-minibuffer-map
	      ("TAB" . ivy-alt-done)
	      ("C-j" . ivy-next-line)
	      ("C-k" . ivy-previous-line))
  :config
  (ivy-mode 1))

;; doom line
(use-package all-the-icons
  :ensure t)
(use-package doom-modeline
  :ensure t
  :config  
  :init (doom-modeline-mode 1))


;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)

;; add numbers of row
(column-number-mode)
(global-display-line-numbers-mode t)

;; magit

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status))
