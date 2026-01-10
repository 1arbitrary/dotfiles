					; Main Emacs configuration
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

;; Enable ido mode

(require 'ido)
(ido-mode t)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package ligature
  :load-path "path-to-ligature-repo"
  :config
  ;; Enable all Iosevka ligatures in programming modes
  (ligature-set-ligatures 'prog-mode '("<---" "<--"  "<<-" "<-" "->" "-->" "--->" "<->" "<-->" "<--->" "<---->" "<!--"
                                       "<==" "<===" "<=" "=>" "=>>" "==>" "===>" ">=" "<=>" "<==>" "<===>" "<====>" "<!---"
                                       "<~~" "<~" "~>" "~~>" "::" ":::" "==" "!=" "===" "!=="
                                       ":=" ":-" ":+" "<*" "<*>" "*>" "<|" "<|>" "|>" "+:" "-:" "=:" "<******>" "++" "+++"))
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'.
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
  (setq gc-cons-threshold 100000000)
  (setq lsp-auto-configure t)
  :config (define-key lsp-mode-map [remap xref-find-apropos] #'helm-lsp-workspace-symbol)
  :hook (
         (js-ts-mode . lsp-deferred)
	 (rust-mode . lsp-deferred)
	 (c-mode . lsp-deferred)
	 (c++-mode . lsp-deferred)
	 (python-mode . lsp-deferred)
	 (css-mode . lsp-deferred)
	 (web-mode . lsp-deferred)
	 (tsx-ts-mode . lsp-deferred)
	 ;; for which-key integration
	 (lsp-mode . lsp-enable-which-key-integration)
	 (lsp-mode . lsp-ui-doc-frame-mode))
  :commands (lsp lsp-deferred))

(use-package lsp-ui :commands lsp-ui-mode)
(use-package helm-lsp :commands helm-lsp-workspace-symbols)
(use-package lsp-treemacs
  :init (lsp-treemacs-sync-mode 1)
  :commands lsp-treemacs-errors-list)

(use-package which-key
  :config
  (which-key-mode))

(use-package company
  :init (setq company-minimum-prefix-length 1
	      company-idle-delay 0.0)
  :config (global-company-mode))

(use-package yasnippet
  :config
  (yas-global-mode 1)
  (setq yas-snippet-dirs '("~/.config/emacs/elpa/yasnippet-snippets-20250507.2002/snippets/"))
  )

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
 '(custom-enabled-themes '(cyberpunk))
 '(custom-safe-themes
   '("9fb69436c074b82a62b78b8d733e6274d0bd16d156f7b094e2afe4345c040c49"))
 '(org-agenda-files nil)
 '(package-selected-packages
   '(Magit company company-box consult-rg cyberpunk-theme drag-mode
	   drag-stuff eaf flycheck gruber-darker-theme helm-lsp
	   ligature lsp-mode lsp-treemacs magit multiple-cursors
	   rust-mode smartparens web-mode yasnippet yasnippet-snippets)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
