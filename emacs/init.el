
;				       Main Emacs configuration
					; hides scrollbar
(setq inhibit-startup-screen t)
(scroll-bar-mode -1)
(tool-bar-mode -1) ; hides toolbar
(menu-bar-mode -1) ; Disable menu Bar
(set-fringe-mode 0)

;; Disable backup files (file~)
(setq make-backup-files nil)

;; Disable auto-save files (#file#)
(setq auto-save-default nil)

;; Disable lock files (.#file)
(setq create-lockfiles nil)

(set-frame-font "Iosevka Nerd Font 14" nil t)

					; Turns on displaying numbers 
(global-display-line-numbers-mode 1)
					; Sets the number-display-type to relative numbers
(setq display-line-numbers-type 'relative)
(setq ispell-program-name "/usr/bin/hunspell")
;; Enable ido mode

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package vertico
  ;; (vertico-cycle t) ;; Enable cycling for `vertico-next/previous'
  :init
  (vertico-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides
   '((file (styles basic partial-completion orderless))))
  (orderless-matching-styles
   '(orderless-literal orderless-regexp orderless-flex)))

(use-package savehist
  :init
  (savehist-mode))

(use-package emacs
  :custom
  (context-menu-mode t)
  (enable-recursive-minibuffers t)
  (read-extended-command-predicate #'command-completion-default-include-p)
  (minibuffer-prompt-properties
   '(read-only t cursor-intangible t face minibuffer-prompt)))

(use-package marginalia
  :init
  (marginalia-mode))

(use-package embark
  :bind (("C-." . embark-act)))

(use-package ligature
  :config
  (ligature-set-ligatures 'prog-mode '("<---" "<--"  "<<-" "<-" "->" "-->" "--->" "<->" "<-->" "<--->" "<---->" "<!--"
                                       "<==" "<===" "<=" "=>" "=>>" "==>" "===>" ">=" "<=>" "<==>" "<===>" "<====>" "<!---"
                                       "<~~" "<~" "~>" "~~>" "::" ":::" "==" "!=" "===" "!=="
                                       ":=" ":-" ":+" "<*" "<*>" "*>" "<|" "<|>" "|>" "+:" "-:" "=:" "<******>" "++" "+++"))
  (global-ligature-mode t))

(use-package multiple-cursors
  :config
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines) 
  (global-set-key (kbd "C->") 'mc/mark-next-like-this) 
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this) 
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)) 

(require 'drag-stuff)
(drag-stuff-global-mode 1)
(drag-stuff-define-keys)
					; LSP-Mode configuration 
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  (setq gc-cons-threshold 100000000)
  (setq lsp-auto-configure t)
  :config
  (define-key lsp-mode-map [remap xref-find-apropos] #'consult-lsp-symbols)
  (define-key lsp-mode-map (kbd "C-c l g e") #'consult-lsp-diagnostics)
  (define-key lsp-mode-map (kbd "C-c l h h") #'lsp-describe-thing-at-point)
  :hook (
	 (c-mode . lsp-deferred)
	 (c++-mode . lsp-deferred)
         (js-ts-mode . lsp-deferred)
	 (rust-mode . lsp-deferred)
	 (go-mode . lsp-deferred)
	 (elixir-ts-mode . lsp-deferred)
	 (python-mode . lsp-deferred)
	 (css-mode . lsp-deferred)
	 (web-mode . lsp-deferred)
	 (tsx-ts-mode . lsp-deferred)
	 ;; for which-key integration
	 (lsp-mode . lsp-enable-which-key-integration)
	 (lsp-mode . lsp-doc-frame-mode))
  :commands (lsp lsp-deferred))

(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package consult
  :bind (("C-x b" . consult-buffer)
         ("C-s"   . consult-line)
         ("C-c f" . consult-fd)
         ("M-g i". consult-imenu)
         ("C-c g" . consult-ripgrep))
    :config (setq consult-fd-args "fd -t f -t d -H"))

(use-package which-key
  :config
  (which-key-mode))

(use-package company
  :init (setq company-minimum-prefix-length 1
	      company-idle-delay 0.0)
  :config (global-company-mode))

(use-package yasnippet
  :config
  (yas-global-mode 1))

(use-package go-mode)
(use-package elixir-ts-mode)

(use-package web-mode
  :ensure t
  :mode
  (
   ("\\.html?\\'" . web-mode)
   ("\\.css\\'" . web-mode)
   ("\\.jsx\\'". web-mode)
   ("\\.js\\'". web-mode)
   ("\\.ts\\'". web-mode)
   ("\\.tsx\\'". web-mode)
   ))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :hook (('after-init-hook #'global-flycheck-mode))
  )

(use-package magit)
(use-package forge
  :after magit)

(use-package smartparens
  :ensure smartparens  ;; install the package
  :hook (prog-mode text-mode markdown-mode) ;; add `smartparens-mode` to these hooks
  :config
  ;; load default config
  (require 'smartparens-config))

(require 'rust-mode)

(setq dictionary-server "dict.org")

(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "pandoc")
  :bind (:map markdown-mode-map
              ("C-c C-e" . markdown-do)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(modus-vivendi-deuteranopia))
 '(custom-safe-themes
   '("6dcc66a60dce37a5817d46e7b1f838ac5d95a79061119adeb7c04c7ae9f511d0"
     "2f4ccea8fdfc36df17e70e9e253e1085e30b08270ac5e1bfbd19fc738ef003db"
     "4fea1174a6eaba952c2c61cfbe4ec9aef5c81836d84a4b16149f3d97e8bae022"
     "0e4a97c12619ddf2892b0de051512ecc3c4d896042a4392b052177bfab23a6e4"
     "b07d6ffc0e06dc400d623d0efc05a8c9043b4c33cfd1c85cca76f174d8ea246d"
     "bc5d51f92dd04131914ade7d5147f648d9346e66ccbe8756837212be3f5912fc"
     "e9e28182669917b3b8aa4fe7f55577b982cac1ad3141269b447c721af663f3e0"
     "b3ed1a4cf401a667d2ec3d8d62eb2062db0476f8c8990d8be8483deac7431c58"
     "7d3668feddab2768da5059c7cee3d4f2fa9bcd7524825d182f5991a756893d86"
     default))
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
