					; Main Emacs configuration
					; hides scrollbar
(scroll-bar-mode -1)
(tool-bar-mode -1) ; hides toolbar
(menu-bar-mode -1) ; Disable menu Bar
(set-fringe-mode 10)

(set-frame-font "JetBrainsMono Nerd Font 14" nil t)

					; Turns on displaying numbers 
(global-display-line-numbers-mode 1)
					; Sets the number-display-type to relative numbers
(setq display-line-numbers-type 'relative)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package ligature
  :config
  (ligature-set-ligatures 'prog-mode '("--" "---" "==" "===" "!=" "!==" "=!="
				       "=:=" "=/=" "<=" ">=" "&&" "&&&" "&=" "++" "+++" "***" ";;" "!!"
				       "??" "???" "?:" "?." "?=" "<:" ":<" ":>" ">:" "<:<" "<>" "<<<" ">>>"
				       "<<" ">>" "||" "-|" "_|_" "|-" "||-" "|=" "||=" "##" "###" "####"
				       "#{" "#[" "]#" "#(" "#?" "#_" "#_(" "#:" "#!" "#=" "^=" "<$>" "<$"
				       "$>" "<+>" "<+" "+>" "<*>" "<*" "*>" "</" "</>" "/>" "<!--" "<#--"
				       "-->" "->" "->>" "<<-" "<-" "<=<" "=<<" "<<=" "<==" "<=>" "<==>"
				       "==>" "=>" "=>>" ">=>" ">>=" ">>-" ">-" "-<" "-<<" ">->" "<-<" "<-|"
				       "<=|" "|=>" "|->" "<->" "<~~" "<~" "<~>" "~~" "~~>" "~>" "~-" "-~"
				       "~@" "[||]" "|]" "[|" "|}" "{|" "[<" ">]" "|>" "<|" "||>" "<||"
				       "|||>" "<|||" "<|>" "..." ".." ".=" "..<" ".?" "::" ":::" ":=" "::="
				       ":?" ":?>" "//" "///" "/*" "*/" "/=" "//=" "/==" "@_" "__" "???"
				       "<:<" ";;;"))
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
 '(custom-enabled-themes '(kaolin-shiva))
 '(custom-safe-themes
   '("918b39b12c40c780831aac53d3047af862c72f24fe65b18cbdf2cb6fe0d14923"
     "e4a441d3cea911e8ef36de2eaed043cbe2079484c44c3f2bbab67a46f863a9f6"
     "5291b60ee27dfc12078f787929498ce82efe5e4d42decdbb994be80cdb2def1f"
     "c341518f5a80752f3113699a7f845dfc7299667311858e7cdfe64677d359d87e"
     "3538194fff1b928df280dc08f041518a8d51ac3ff704c5e46d1517f5c4d8a0e0"
     "9df4b113170b630d3c00cf3e67c59ecf4f007487f199cc46d54fb30efc8b79ce"
     "4e9f0b64032736975e3a5bd5617c829510d5bf55687bf8e7ff90b0721274e032"
     "5beb9cc517b24959e2ee7be47584270bbe11a7b210807fa419d41ede12174a26"
     "ca2ce81d33e0b4bd0fdf20caefdde9cb617fec42eeeaf5cd79c80d630bd5cf6a"
     "70901ffb0f502ec640c30f96a626e66a024af80ebb836eb0cdbe42c06446951b"
     "5d09ffe65f025fd9f51304aad148140d18ce14411d20b9e563f27581b0305af9"
     "6a4d13a6d49d70e3e2a590bae8467dbcb65728befb31c388edf43bcc369b51df"
     "b3c54ff374d12c2e45c621d723a0f6dfb6aab2bb5478a0c4f8b7590adaa23892"
     "a94e15f0a3fd9e86430b4b8dadffc58faa0310168bcbc4fd3c1b687cf25e1f5d"
     "59cb0b29e1b279f887d13214bb91c20cce880c3b9647d3e74f66d1b18756c682"
     "b97004bc28b4d931b589c3453ff83852c28bb009df3421ef0b8b2752e43c67fa"
     "c78d0e0c0f9231e4c33c2d0f3c24d9f079cde28043a1786aaec301cf3bc5e612"
     "c90308bb3d9af3fbc9968243e0f620857ce0d4aa064025f9e9388e0b2018c7ce"
     "71cefc437d0f426cfd6c74b9c6f607c3bf948d9ec2651f41cf2a7d6184bbd383"
     "62e5ee6ff1f9437e7b9010d4575d0415237dfbee5fd64b2f2b5597969499fec2"
     "2195cd3eea5daeb44cd309a56419b4a3d56a4bc7d39561f4ed72b7736de2c921"
     "dfba5753561fb75b8f8c985518676451f64c1bb8af1406a68dbef2eb4f072209"
     "06cbdce4e48e036d42e4a7080e8a7bc88d48001b03614ce238da5f275a3b6ba1"
     "d10c58f4a53b7d4760022fdf67734865c290e40ef5dfa597a653e14b810a7d07"
     "e0df59052e97d35839b4a3a6dcd2173ad41332545c2648ffea558f5363c6b8d1"
     "dfa1e5afbab42ab2924102e11672a2731c53347ce078b734d9816f1d4429f68a"
     "d20b3f5c1adf9cf2e2ad40a0f6172b32d53faa0489478cf359d2bdf432b9d8a4"
     "ac7b410453c725606757b5aa46df55be487d53b9fa50b13ea548e9642c32377b"))
 '(org-agenda-files nil)
 '(package-selected-packages
   '(Magit company company-box drag-mode drag-stuff eaf flycheck helm-lsp
	   kaolin-themes ligature lsp-mode lsp-treemacs magit
	   multiple-cursors rust-mode smartparens yasnippet
	   yasnippet-snippets)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
