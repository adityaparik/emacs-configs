;; Look for custom-set-variables in custom.el
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Some Cleanup of Emacs interface
(setq inhibit-startup-message t)

(scroll-bar-mode -1)                          ; Disable visible scrollbar
(tool-bar-mode -1)                            ; Disable the toolbar
(tooltip-mode -1)                             ; Disable tooltips
;; (set-fringe-mode 10)                       ; Give some breathing room
(global-visual-line-mode t)                   ; Visual Word Warping in all buffers
(set-window-margins (selected-window) 1 3)    ; Some space on right and left margins
(menu-bar-mode -1)                            ; Disable the menu bar

(setq visible-bell t)                         ; Set up the visible bell

;; Change font type and size
(set-face-attribute 'default nil :font "Hack" :height 120)

;; Chose a colorscheme from default themeset
;; (load-theme 'wombat)

;; Make ESC quit prompts
;; (global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Enable line numbers
(column-number-mode)
(global-display-line-numbers-mode t)


;; Initialize package sources
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))


(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))


;; Initialize use-package
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Enable reftex (pre installed by not active by default)
(require 'reftex)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-reftex)   ; with Emacs latex mode

;; Install counsel, Swiper and Ivy for better completetion framework and interface
(use-package counsel
  :ensure t)
(use-package swiper
  :ensure t)
(use-package ivy
  :diminish
  :bind (("C-s" . swiper))
  :config
  (ivy-mode 1))


;; Some aesthetic improvements using Doom Emacs modeline and themes
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 10)))

(use-package doom-themes
  :init (load-theme 'doom-gruvbox t)
  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config))


;; Rainbow delimiters for clearer bracket matching
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; Install Auctex for advanced LaTex mode in Emacs
(use-package tex
  :defer t
  :ensure auctex
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil))
