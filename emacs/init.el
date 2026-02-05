
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

(require 'ido)
(ido-mode t)

(global-set-key (kbd "<f5>") 'compile)

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
	 (go-mode . lsp-deferred)
	 (elixir-ts-mode . lsp-deferred)
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
 '(custom-enabled-themes '(modus-vivendi-tritanopia))
 '(custom-safe-themes
   '("e9835d67c171416877752f0aa0293b1f2070e5e011fb76419bae0adead7cbd45"
     "f205f6f7fc55a6b1e206e88445931ac46ec9a70f124291667809707ddbe63c04"
     "8fbf2d585f1138caaafa9e523fa3a20614c1d1dcc6002c9808c3e40028e21df4"
     "a75fc55d480accd6f651d1bae492b7ab4c5b28894350b63ef39bf947bb8fd453"
     "dde7fb0b1ed1bb5b61e62bf1a00696cf099a2b290718aee9b377365b3ed992f0"
     "c181188a9793b37d054e48e919fbdcfd1dc658b675a349b1399fdc2c8edaeec7"
     "1b7e575c6681e66d8d83634c2c160b40af12f3756360a4dd81b8032f4495cb5e"
     "21c4c4b7d3ab161aaa28b15ca846854d395c33cfb7c6863ab601adfe10d70ce0"
     "4ecca25fc420989fc8520a3717135a60c068f9bc1e575f4a42e1fe5826f0e3dd"
     "74ca643433b3784b48d3c582056decdc0fc0f59df71fd3c6d4a97cafdb8c2ddf"
     "01f347a923dd21661412d4c5a7c7655bf17fb311b57ddbdbd6fce87bd7e58de6"
     "84581927169c3b4a7c57fd0f8cce8aa91823291e403bd577fde32b8c30800279"
     "9af2b1c0728d278281d87dc91ead7f5d9f2287b1ed66ec8941e97ab7a6ab73c0"
     "1e6997bc08f0b11a2b5b6253525aed4e1eb314715076a0c0c2486bd97569f18a"
     "7ed236688b971b70744d1410d4e86cebde9b2980e0568f38d22db4f319e8d135"
     "918b39b12c40c780831aac53d3047af862c72f24fe65b18cbdf2cb6fe0d14923"
     "e4a441d3cea911e8ef36de2eaed043cbe2079484c44c3f2bbab67a46f863a9f6"
     "9d5a33a0097c43f44759530c846e1adf9c40171f232a4b2ae561feccc99a03c4"
     "39cb0376bfc26ca69c42b8410cb8e97bc6e72a6da53b4f1268de9bd1b347b9f3"
     "21eb44ad0e958f71261c436a06577dc114b2850e5a82bc12314cf63c2d2d1db5"
     "a59d0dbcbdfc57a14bc3fa28cb5a8367bc7ede82d848f517b4979b4a03c09da9"
     "5291b60ee27dfc12078f787929498ce82efe5e4d42decdbb994be80cdb2def1f"
     "c341518f5a80752f3113699a7f845dfc7299667311858e7cdfe64677d359d87e"
     "3538194fff1b928df280dc08f041518a8d51ac3ff704c5e46d1517f5c4d8a0e0"
     "9df4b113170b630d3c00cf3e67c59ecf4f007487f199cc46d54fb30efc8b79ce"
     "4e9f0b64032736975e3a5bd5617c829510d5bf55687bf8e7ff90b0721274e032"
     "5beb9cc517b24959e2ee7be47584270bbe11a7b210807fa419d41ede12174a26"
     "ca2ce81d33e0b4bd0fdf20caefdde9cb617fec42eeeaf5cd79c80d630bd5cf6a"
     "39dd7106e6387e0c45dfce8ed44351078f6acd29a345d8b22e7b8e54ac25bac4"
     "cab317d0125d7aab145bc7ee03a1e16804d5abdfa2aa8738198ac30dc5f7b569"
     "36e7dbc8f9ef915a7dd5b34d7360c0763e583aef28d50ceeed50d445b9702c4a"
     "c9e63647d90e7dc59d52c176fbfd46fd2cfed275cd2bad9b29b6cf620d3389b6"))
 '(org-agenda-files nil)
 '(package-selected-packages
   '(calibredb company drag-stuff flycheck go-mode helm-lsp ligature
	       lsp-treemacs lsp-ui magit modus-themes multiple-cursors
	       rust-mode smartparens web-mode yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
